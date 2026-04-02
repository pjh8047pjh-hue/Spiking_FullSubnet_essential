import torch.nn as nn

from audiozen.models.spiking_fullsubnet.subband_stage import SubbandStage


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
        assert len(center_freq_sizes) == len(neighbor_freq_sizes) == len(df_orders), "Subband parameter lengths must match."

        sb_models = []
        for lower_cutoff_freq, upper_cutoff_freq, ctr_freq, nbr_freq, df_order in zip(
            freq_cutoffs[:-1], freq_cutoffs[1:], center_freq_sizes, neighbor_freq_sizes, df_orders
        ):
            sb_models.append(
                SubbandStage(
                    lower_cutoff_freq=lower_cutoff_freq,
                    upper_cutoff_freq=upper_cutoff_freq,
                    ctr_freq=ctr_freq,
                    nbr_freq=nbr_freq,
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
        _, num_channels, _, _ = noisy_input.size()
        assert num_channels == 1, "Only mono audio is supported."

        output = []
        all_layer_outputs = []
        for sb_model in self.sb_models:
            sb_output, sb_all_layer_outputs = sb_model(noisy_input, fb_output)
            output += [sb_output]
            all_layer_outputs += [sb_all_layer_outputs]

        return output, all_layer_outputs
