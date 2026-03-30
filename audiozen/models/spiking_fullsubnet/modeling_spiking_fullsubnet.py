from functools import partial

import torch
import torch.nn as nn
from einops import rearrange, repeat

from audiozen.acoustics.audio_feature import istft, stft
from audiozen.models.spiking_fullsubnet.deepfiltering import deepfiltering
from audiozen.models.spiking_fullsubnet.fullband_model import FullbandModel
from audiozen.models.spiking_fullsubnet.subband_model import SubbandModel


class SpikingFullSubNet(nn.Module):
    def __init__(
        self,
        n_fft,
        hop_length,
        win_length,
        fdrc,
        fb_input_size,
        fb_hidden_size,
        fb_num_layers,
        fb_proj_size,
        fb_output_activate_function,
        sb_hidden_size,
        sb_num_layers,
        freq_cutoffs,
        df_orders,
        center_freq_sizes,
        neighbor_freq_sizes,
        use_pre_layer_norm_fb=True,
        use_pre_layer_norm_sb=True,
        bn=False,
        shared_weights=False,
        sequence_model="GSN",
        num_spks=1,
    ):
        super().__init__()

        self.fb_model = FullbandModel(
            input_size=fb_input_size,
            hidden_size=fb_hidden_size,
            num_layers=fb_num_layers,
            proj_size=fb_proj_size,
            output_activate_function=fb_output_activate_function,
            bn=bn,
            shared_weights=shared_weights,
            sequence_model=sequence_model,
            use_pre_layer_norm=use_pre_layer_norm_fb,
        )

        self.sb_model = SubbandModel(
            freq_cutoffs=freq_cutoffs,
            center_freq_sizes=center_freq_sizes,
            neighbor_freq_sizes=neighbor_freq_sizes,
            df_orders=df_orders,
            num_spks=num_spks,
            hidden_size=sb_hidden_size,
            num_layers=sb_num_layers,
            shared_weights=shared_weights,
            sequence_model=sequence_model,
            bn=bn,
            use_pre_layer_norm=use_pre_layer_norm_sb,
        )

        self.stft = partial(stft, n_fft=n_fft, hop_length=hop_length, win_length=win_length)
        self.istft = partial(istft, n_fft=n_fft, hop_length=hop_length, win_length=win_length)

        self.fb_input_size = fb_input_size
        self.n_fft = n_fft
        self.hop_length = hop_length
        self.win_length = win_length
        self.fdrc = fdrc
        self.df_orders = df_orders
        self.num_spks = num_spks

    def forward(self, input):
        """Forward function.

        Args:
            input (`torch.Tensor` of shape `(batch_size, sequence_length)`):
                Waveform tensor.

        Returns:
            output (`torch.Tensor` of shape `(batch_size, sequence_length) or `(batch_size, num_spks, sequence_length)`):
                Output tensor.
        """
        assert input.ndim == 2, f"Input tensor must be 2D, but got {input.ndim}D."
        _, sequence_length = input.shape

        noisy_mag, _, noisy_real, noisy_imag = self.stft(input)
        noisy_cmp = torch.complex(real=noisy_real, imag=noisy_imag)
        noisy_cmp = rearrange(noisy_cmp, "b f t -> b 1 f t")

        noisy_mag = rearrange(noisy_mag, "b f t -> b 1 f t")
        noisy_mag = noisy_mag**self.fdrc
        noisy_mag = noisy_mag[..., :-1, :]

        fb_output, fb_all_layer_outputs = self.fb_model(noisy_mag)
        df_coef_list, sb_all_layer_outputs = self.sb_model(noisy_mag, fb_output)

        num_filtered_freqs = 0
        enh_freqs_list = []
        for df_coef, df_order in zip(df_coef_list, self.df_orders):
            num_freqs = df_coef.shape[3]
            comp_stft_in = noisy_cmp[..., num_filtered_freqs : num_filtered_freqs + num_freqs, :]
            enh_freqs = deepfiltering(comp_stft_in, df_coef, df_order, self.num_spks)  # [B, c, s, f, t]
            enh_freqs_list.append(enh_freqs)
            num_filtered_freqs += num_freqs

        enh_freqs = torch.cat(enh_freqs_list, dim=-2)  # [B, c, s, F, T]
        enh_stft = repeat(noisy_cmp, "b 1 f t -> b 1 s f t", s=self.num_spks).clone()

        if self.num_spks > 1:
            enh_stft[..., :-1, :] = enh_freqs
            enh_stft = rearrange(enh_stft, "b 1 s f t -> (b s) f t")
            enh_y = self.istft(enh_stft, length=sequence_length)
            enh_y = rearrange(enh_y, "(b s) t -> b s t", s=self.num_spks)
            return enh_y, fb_all_layer_outputs, sb_all_layer_outputs

        enh_stft[..., :-1, :] = enh_freqs
        enh_stft = rearrange(enh_stft, "b 1 1 f t -> b f t")
        enh_mag = torch.abs(enh_stft)  # For computing DNSMOS loss
        enh_y = self.istft(enh_stft, length=sequence_length)
        return enh_y, enh_mag, fb_all_layer_outputs, sb_all_layer_outputs


if __name__ == "__main__":
    model = SpikingFullSubNet(
        n_fft=512,
        hop_length=128,
        win_length=512,
        fdrc=0.5,
        fb_input_size=64,
        fb_hidden_size=256,
        fb_num_layers=2,
        fb_proj_size=64,
        fb_output_activate_function=None,
        sb_hidden_size=128,
        sb_num_layers=2,
        freq_cutoffs=[0, 20, 80, 256],
        df_orders=[2, 2, 2],
        center_freq_sizes=[2, 10, 22],
        neighbor_freq_sizes=[8, 16, 32],
        use_pre_layer_norm_fb=True,
        use_pre_layer_norm_sb=True,
        bn=False,
        shared_weights=False,
        sequence_model="GSN",
        num_spks=2,
    )

    input = torch.rand(2, 16000)
    output = model(input)
    print(output[0].shape)
