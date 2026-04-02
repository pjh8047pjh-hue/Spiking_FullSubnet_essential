from audiozen.models.spiking_fullsubnet.subband_feature import build_subband_input
from audiozen.models.spiking_fullsubnet.subband_sequence_model import SubBandSequenceModel


class SubbandStage(SubBandSequenceModel):
    def __init__(self, lower_cutoff_freq, upper_cutoff_freq, ctr_freq, nbr_freq, df_order, num_spks, **kwargs):
        self.lower_cutoff_freq = lower_cutoff_freq
        self.upper_cutoff_freq = upper_cutoff_freq
        self.ctr_freq = ctr_freq
        self.nbr_freq = nbr_freq
        super().__init__(
            df_order=df_order,
            num_spks=num_spks,
            input_size=(ctr_freq + nbr_freq * 2) + ctr_freq,
            proj_size=2 * ctr_freq * df_order * num_spks,
            **kwargs,
        )

    def forward(self, noisy_input, fb_output):
        sb_input = build_subband_input(
            noisy_input=noisy_input,
            fb_output=fb_output,
            lower_cutoff_freq=self.lower_cutoff_freq,
            upper_cutoff_freq=self.upper_cutoff_freq,
            ctr_freq=self.ctr_freq,
            nbr_freq=self.nbr_freq,
        )
        return super().forward(sb_input)
