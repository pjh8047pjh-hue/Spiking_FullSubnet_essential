from einops import rearrange

from audiozen.models.spiking_fullsubnet.sequence_model import SequenceModel


class FullbandModel(SequenceModel):
    def __init__(
        self,
        input_size,
        hidden_size,
        num_layers,
        proj_size,
        output_activate_function,
        use_pre_layer_norm=True,
        bn=False,
        shared_weights=False,
        sequence_model="GSN",
    ):
        super().__init__(
            input_size=input_size,
            hidden_size=hidden_size,
            num_layers=num_layers,
            shared_weights=shared_weights,
            sequence_model=sequence_model,
            proj_size=proj_size,
            output_activate_function=output_activate_function,
            bn=bn,
            use_pre_layer_norm=use_pre_layer_norm,
        )
        self.input_size = input_size

    def forward(self, noisy_mag):
        _, num_channels, num_freqs, _ = noisy_mag.shape
        assert num_channels == 1, "Only mono audio is supported."

        if num_freqs % self.input_size != 0:
            raise ValueError(f"Fullband input frequency size must be divisible by input_size. GOT: {num_freqs=}, {self.input_size=}")

        fb_input = noisy_mag[..., : self.input_size, :]
        fb_input = rearrange(fb_input, "b c f t -> b (c f) t")
        fb_output, all_layer_outputs = super().forward(fb_input)
        fb_output = rearrange(fb_output, "b f t -> b 1 f t")
        fb_output = fb_output.repeat(1, 1, num_freqs // self.input_size, 1)

        return fb_output, all_layer_outputs
