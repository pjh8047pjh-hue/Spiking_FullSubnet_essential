import torch
from einops import rearrange

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
