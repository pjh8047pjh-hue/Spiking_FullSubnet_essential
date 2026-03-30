import torch
import torch.nn as nn
from einops import rearrange

from audiozen.models.spiking_fullsubnet.efficient_spiking_neuron import MemoryState, efficient_spiking_neuron


class SequenceModel(nn.Module):
    def __init__(
        self,
        input_size,
        hidden_size,
        num_layers,
        sequence_model="GSN",
        proj_size=0,
        shared_weights=False,
        output_activate_function=None,
        bn=False,
        use_pre_layer_norm=True,
    ):
        super().__init__()

        if use_pre_layer_norm:
            self.pre_layer_norm = nn.LayerNorm(input_size)

        if sequence_model == "GSN":
            self.sequence_model = efficient_spiking_neuron(
                input_size=input_size,
                hidden_size=hidden_size,
                num_layers=num_layers,
                shared_weights=shared_weights,
                bn=bn,
            )
        elif sequence_model == "LSTM":
            self.sequence_model = nn.LSTM(
                input_size=input_size,
                hidden_size=hidden_size,
                num_layers=num_layers,
                batch_first=True,
                bidirectional=False,
            )
        else:
            raise NotImplementedError(f"Sequence model {sequence_model} not implemented.")

        if proj_size > 0:
            self.proj = nn.Linear(hidden_size, proj_size)
        else:
            self.proj = nn.Identity()

        if output_activate_function == "tanh":
            self.output_activate_function = nn.Tanh()
        elif output_activate_function == "sigmoid":
            self.output_activate_function = nn.Sigmoid()
        elif output_activate_function == "relu":
            self.output_activate_function = nn.ReLU()
        else:
            self.output_activate_function = nn.Identity()

        self.hidden_size = hidden_size
        self.num_layers = num_layers
        self.use_pre_layer_norm = use_pre_layer_norm
        self.sequence_model_name = sequence_model

    def _init_states(self, batch_size, device):
        return [
            MemoryState(
                torch.zeros(batch_size, self.hidden_size, device=device),
                torch.zeros(batch_size, self.hidden_size, device=device),
            )
            for _ in range(self.num_layers)
        ]

    def forward_lstm(self, input):
        assert input.ndim == 3, f"Input tensor must be 3D, but got {input.ndim}D."
        input = rearrange(input, "b f t -> b t f")

        if self.use_pre_layer_norm:
            input = self.pre_layer_norm(input)

        output, _ = self.sequence_model(input)
        output = self.proj(output)
        output = rearrange(output, "b t f -> b f t")
        output = self.output_activate_function(output)
        return output, []

    def forward(self, input):
        """Forward function.

        Args:
            input (`torch.Tensor` of shape `(batch_size, num_freq, sequence_length)` or `(batch_size, num_channels, num_freq, sequence_length)`):
                Input 3D or 4D tensor.

        Returns:
            output (`torch.Tensor` of shape `(batch_size, num_freq, sequence_length)`): Output tensor.
                Output tensor.
        """
        if self.sequence_model_name == "LSTM":
            return self.forward_lstm(input)

        assert input.ndim == 3, f"Input tensor must be 3D, but got {input.ndim}D."

        batch_size, _, _ = input.shape
        states = self._init_states(batch_size, input.device)

        input = rearrange(input, "b f t -> t b f")

        if self.use_pre_layer_norm:
            input = self.pre_layer_norm(input)

        output, _, all_layer_outputs = self.sequence_model(input, states)
        output = self.proj(output)
        all_layer_outputs += [output]
        output = self.output_activate_function(output)

        output = rearrange(output, "t b f -> b f t")
        return output, all_layer_outputs
