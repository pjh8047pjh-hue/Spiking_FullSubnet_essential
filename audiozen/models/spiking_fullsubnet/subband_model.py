import torch
import torch.nn as nn
from einops import rearrange
from torch.nn import functional as F

from audiozen.models.spiking_fullsubnet.sequence_model import SequenceModel


class SubBandSequenceModel(SequenceModel):
    def __init__(self, df_order, num_spks, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.df_order = df_order
        self.num_spks = num_spks

    def forward(self, input_features):
        """How to process the subband features.

        - `fs`: number of frequency bins in the subband.
        - `fc`: number of frequency bins in the center frequency.
        - `df`: order of the deep filter.
        - `n`: number of subbands.
        - `s`: number of speakers.
        - `c`: number of channels.

        Args:
            input (`torch.Tensor` of shape `(batch_size, num_subbands, num_channels, sb_freq_size, sequence_length)`):
                Subband feature at a particular frequency.

        Returns:
            output (`torch.Tensor` of shape `(batch_size, df_order, num_subbands * ctr_freq_size, sequence_length, num_channels)`):
                Complex output tensor. The last dimension (`num_channels`) is the real and imaginary parts.
        """
        batch_size, num_subbands, num_channels, _, _ = input_features.shape
        assert num_channels == 1, "Only mono audio is supported."

        input_features = rearrange(input_features, "b n c fs t -> (b n) (c fs) t")
        output, all_layer_outputs = super().forward(input_features)

        output = rearrange(
            output,
            "(b n) (c fc df s) t -> b df s (n fc) t c",
            b=batch_size,
            s=self.num_spks,
            c=num_channels * 2,
            df=self.df_order,
        )

        return output, all_layer_outputs


class SubbandModel(nn.Module):
    def __init__(
        self,
        freq_cutoffs,
        center_freq_sizes,
        neighbor_freq_sizes,
        df_orders,
        num_spks,
        **kwargs,
    ):
        """Subband model.

        Args:
            freq_cutoffs (`list` of `int`):
                 Cutoff frequencies for the subbands. The first and last elements are the lower and upper cutoffs.
            center_freq_sizes (`list` of `int`):
                Number of frequency bins in the center frequency for each subband. The length of this list must be
                equal to the length of `freq_cutoffs` minus 1.
            neighbor_freq_sizes: like `sb_center_freq_sizes`, but for the neighboring frequency bins.
            df_orders: like `center_freq_sizes`, but for the deep filter order.
            num_spks (`int`): Number of speakers.
            kwargs: other arguments for `SequenceModel`.
        """
        super().__init__()
        assert len(freq_cutoffs) - 1 == len(center_freq_sizes), "Number of subbands must be equal to len(cutoffs)."

        sb_models = []
        for ctr_freq, nbr_freq, df_order in zip(center_freq_sizes, neighbor_freq_sizes, df_orders):
            sb_models.append(
                SubBandSequenceModel(
                    input_size=(ctr_freq + nbr_freq * 2) + ctr_freq,
                    proj_size=2 * ctr_freq * df_order * num_spks,
                    df_order=df_order,
                    num_spks=num_spks,
                    **kwargs,
                )
            )

        self.sb_models = nn.ModuleList(sb_models)
        self.freq_cutoffs = freq_cutoffs
        self.center_freq_sizes = center_freq_sizes
        self.neighbor_freq_sizes = neighbor_freq_sizes
        self.df_orders = df_orders

    def forward(self, noisy_input, fb_output):
        """Frequency-wise processing of the subband features.

        Separate the noisy input into several sections. Each section has the same center frequency and neighboring
        frequency bins. Then, process each section with the corresponding subband model.

        For a subband feature at frequency `f`, the corresponding feature is obtained by concatenating:
        1. `f` itself.
        2. `f - N` to `f - 1`, where `N` is the number of frequency bins on each side of `f`.
        3. `f + 1` to `f + N`.
        4. corresponding frequency bins in the fullband feature.

        Args:
            noisy_input (`torch.Tensor` of shape `(batch_size, num_channels, num_freqs, num_frames)`):
                Noisy input spectrogram. `num_channels` must be 1.
            fb_output (`torch.Tensor` of shape `(batch_size, num_channels, num_freqs, num_frames)`):
                Repeated fullband embedding aligned with the noisy input.
        """
        batch_size, num_channels, _, _ = noisy_input.size()
        assert num_channels == 1, "Only mono audio is supported."

        output = []
        all_layer_outputs = []
        for idx, sb_model in enumerate(self.sb_models):
            noisy_subbands = self._freq_unfold(
                input=noisy_input,
                lower_cutoff_freq=self.freq_cutoffs[idx],
                upper_cutoff_freq=self.freq_cutoffs[idx + 1],
                ctr_freq=self.center_freq_sizes[idx],
                nbr_freq=self.neighbor_freq_sizes[idx],
            )

            fb_subbands = self._freq_unfold(
                input=fb_output,
                lower_cutoff_freq=self.freq_cutoffs[idx],
                upper_cutoff_freq=self.freq_cutoffs[idx + 1],
                ctr_freq=self.center_freq_sizes[idx],
                nbr_freq=0,
            )

            sb_input = torch.cat([noisy_subbands, fb_subbands], dim=-2)
            sb_output, sb_all_layer_outputs = sb_model(sb_input)
            output += [sb_output]
            all_layer_outputs += [sb_all_layer_outputs]

        return output, all_layer_outputs

    def _freq_unfold(self, input, lower_cutoff_freq, upper_cutoff_freq, ctr_freq, nbr_freq):
        """Unfold the frequency bins based on a given lower and upper cutoff frequency bondaries.

        Args:
            input (`torch.Tensor` of shape `(batch_size, num_channels, num_freqs, num_frames)`):
                Noisy input spectrogram.
            lower_cutoff_freq: lower cutoff frequency of current section.
            upper_cutoff_freq: upper cutoff frequency of current section.
            ctr_freq: number of frequency bins in the center frequency.
            nbr_freq: number of neighboring frequency bins.

        Returns:
            output (`torch.Tensor` of shape `(batch_size, num_subbands, num_channels, sb_freq_size, num_frames)`):
                Unfolded tensor.
        """
        _, num_channels, num_freqs, num_frames = input.size()
        assert num_channels == 1, "Only mono audio is supported."

        if (upper_cutoff_freq - lower_cutoff_freq) % ctr_freq != 0:
            raise ValueError(
                f"Number of frequency bins must be divisible by the center frequency."
                f"GOT: {ctr_freq=}, {upper_cutoff_freq=}, {lower_cutoff_freq=}"
            )

        if lower_cutoff_freq == 0:
            valid_input = input[..., : upper_cutoff_freq + nbr_freq, :]
            valid_input = F.pad(valid_input, (0, 0, nbr_freq, 0), mode="reflect")
        elif upper_cutoff_freq == num_freqs:
            valid_input = input[..., lower_cutoff_freq - nbr_freq :, :]
            valid_input = F.pad(valid_input, (0, 0, 0, nbr_freq), mode="reflect")
        else:
            valid_input = input[..., lower_cutoff_freq - nbr_freq : upper_cutoff_freq + nbr_freq, :]

        output = F.unfold(
            input=valid_input, kernel_size=(ctr_freq + nbr_freq * 2, num_frames), stride=(ctr_freq, num_frames)
        )
        output = rearrange(output, "b (c fs t) n -> b n c fs t", c=num_channels, fs=ctr_freq + nbr_freq * 2)

        return output
