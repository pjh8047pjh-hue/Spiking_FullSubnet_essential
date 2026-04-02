import math
from collections import namedtuple

import torch
import torch.nn as nn
from torch.nn import functional as F


MemoryState = namedtuple("MemoryState", ["hx", "cx"])


def step_activation(input_tensor):
    return input_tensor.ge(0.0).to(input_tensor.dtype)


def batchnorm_eval(input_tensor, batchnorm):
    if batchnorm.training:
        return batchnorm(input_tensor)
    return F.batch_norm(
        input_tensor,
        batchnorm.running_mean,
        batchnorm.running_var,
        batchnorm.weight,
        batchnorm.bias,
        training=False,
        momentum=batchnorm.momentum,
        eps=batchnorm.eps,
    )


def gsu_cell_forward(cell, input_tensor, state):
    hx, cx = state
    if cell.shared_weights:
        weight_ih = cell.weight_ih.repeat((2, 1))
        weight_hh = cell.weight_hh.repeat((2, 1))
    else:
        weight_ih = cell.weight_ih
        weight_hh = cell.weight_hh

    gates = torch.mm(input_tensor, weight_ih.t()) + cell.bias_ih + torch.mm(hx, weight_hh.t())
    forgetgate, cellgate = gates.chunk(2, 1)
    forgetgate = torch.sigmoid(forgetgate)
    cy = forgetgate * cx + (1 - forgetgate) * cellgate
    if cell.use_bn:
        cy = batchnorm_eval(cy, cell.batchnorm)
    hy = step_activation(cy)
    return hy, MemoryState(hy, cy)


def gsu_layer_forward(layer, input_tensor, state):
    inputs = input_tensor.unbind(0)
    outputs = []
    for current_input in inputs:
        current_output, state = gsu_cell_forward(layer.cell, current_input, state)
        outputs.append(current_output)
    return torch.stack(outputs), state


def stacked_gsu_forward(sequence_model, input_tensor, states):
    output_states = []
    output = input_tensor
    all_layer_outputs = [input_tensor]
    for layer_index, rnn_layer in enumerate(sequence_model.layers):
        output, out_state = gsu_layer_forward(rnn_layer, output, states[layer_index])
        output_states.append(out_state)
        all_layer_outputs.append(output)
    return output, output_states, all_layer_outputs


def reflect_frequency_index(freq_index, num_freqs):
    if num_freqs <= 1:
        return 0

    while freq_index < 0 or freq_index >= num_freqs:
        if freq_index < 0:
            freq_index = -freq_index
        else:
            freq_index = (2 * num_freqs) - freq_index - 2

    return freq_index


class GSUCell(nn.Module):
    def __init__(self, input_size, hidden_size, shared_weights=False, bn=False):
        super().__init__()
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.shared_weights = shared_weights
        self.use_bn = bn
        if self.shared_weights:
            self.weight_ih = nn.Parameter(torch.empty(hidden_size, input_size))
            self.weight_hh = nn.Parameter(torch.empty(hidden_size, hidden_size))
        else:
            self.weight_ih = nn.Parameter(torch.empty(2 * hidden_size, input_size))
            self.weight_hh = nn.Parameter(torch.empty(2 * hidden_size, hidden_size))
        self.bias_ih = nn.Parameter(torch.zeros(2 * hidden_size))
        self.reset_parameters()

        if self.use_bn:
            self.batchnorm = nn.BatchNorm1d(hidden_size)

    def reset_parameters(self):
        stdv = 1.0 / math.sqrt(self.hidden_size) if self.hidden_size > 0 else 0
        for weight in self.parameters():
            torch.nn.init.uniform_(weight, -stdv, stdv)

    def forward(self, input_tensor, state):
        return gsu_cell_forward(self, input_tensor, state)


class GSULayer(nn.Module):
    def __init__(self, cell, *cell_args):
        super().__init__()
        self.cell = cell(*cell_args)

    def forward(self, input_tensor, state):
        return gsu_layer_forward(self, input_tensor, state)


class StackedGSU(nn.Module):
    def __init__(self, num_layers, first_layer_args, other_layer_args):
        super().__init__()
        self.layers = nn.ModuleList(
            [GSULayer(*first_layer_args)] + [GSULayer(*other_layer_args) for _ in range(num_layers - 1)]
        )

    def forward(self, input_tensor, states):
        return stacked_gsu_forward(self, input_tensor, states)


class SubBandSequenceModel(nn.Module):
    def __init__(
        self,
        input_size,
        hidden_size,
        num_layers,
        df_order,
        num_spks,
        sequence_model="GSN",
        proj_size=0,
        shared_weights=False,
        output_activate_function=None,
        bn=False,
        use_pre_layer_norm=True,
    ):
        super().__init__()
        if sequence_model != "GSN":
            raise NotImplementedError(f"SubBandSequenceModel only supports GSN. GOT: {sequence_model}")

        if output_activate_function not in (None, False):
            raise NotImplementedError(
                f"SubBandSequenceModel only supports identity output activation. GOT: {output_activate_function}"
            )

        if use_pre_layer_norm:
            self.pre_layer_norm = nn.LayerNorm(input_size)

        self.sequence_model = StackedGSU(
            num_layers=num_layers,
            first_layer_args=[GSUCell, input_size, hidden_size, shared_weights, bn],
            other_layer_args=[GSUCell, hidden_size, hidden_size, shared_weights, bn],
        )
        if proj_size > 0:
            self.proj = nn.Linear(hidden_size, proj_size)
        else:
            self.proj = nn.Identity()

        self.df_order = df_order
        self.num_spks = num_spks
        self.hidden_size = hidden_size
        self.num_layers = num_layers
        self.use_pre_layer_norm = use_pre_layer_norm

    def _init_states(self, batch_size, device, dtype):
        return [
            MemoryState(
                torch.zeros(batch_size, self.hidden_size, device=device, dtype=dtype),
                torch.zeros(batch_size, self.hidden_size, device=device, dtype=dtype),
            )
            for _ in range(self.num_layers)
        ]

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
        batch_size, num_subbands, num_channels, sb_freq_size, sequence_length = input_features.shape
        assert num_channels == 1, "Only mono audio is supported."

        packed_input = input_features.reshape(
            batch_size * num_subbands,
            num_channels * sb_freq_size,
            sequence_length,
        )

        states = self._init_states(
            batch_size=batch_size * num_subbands,
            device=input_features.device,
            dtype=input_features.dtype,
        )

        sequence_input = packed_input.permute(2, 0, 1)
        if self.use_pre_layer_norm:
            sequence_input = self.pre_layer_norm(sequence_input)

        sequence_output, _, all_layer_outputs = self.sequence_model(sequence_input, states)
        sequence_output = self.proj(sequence_output)
        all_layer_outputs.append(sequence_output)

        output = sequence_output.permute(1, 2, 0)
        feature_size = output.shape[1]
        base_feature_size = 2 * self.df_order * self.num_spks
        if feature_size % base_feature_size != 0:
            raise ValueError(f"Invalid projected subband feature size. GOT: {feature_size=}, {base_feature_size=}")

        ctr_freq_size = feature_size // base_feature_size
        output = output.reshape(
            batch_size,
            num_subbands,
            2,
            ctr_freq_size,
            self.df_order,
            self.num_spks,
            sequence_length,
        )
        output = output.permute(0, 4, 5, 1, 3, 6, 2)
        output = output.reshape(
            batch_size,
            self.df_order,
            self.num_spks,
            num_subbands * ctr_freq_size,
            sequence_length,
            2,
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
            output.append(sb_output)
            all_layer_outputs.append(sb_all_layer_outputs)

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
        batch_size, num_channels, num_freqs, num_frames = input.size()
        assert num_channels == 1, "Only mono audio is supported."

        if (upper_cutoff_freq - lower_cutoff_freq) % ctr_freq != 0:
            raise ValueError(
                f"Number of frequency bins must be divisible by the center frequency."
                f"GOT: {ctr_freq=}, {upper_cutoff_freq=}, {lower_cutoff_freq=}"
            )

        num_subbands = (upper_cutoff_freq - lower_cutoff_freq) // ctr_freq
        sb_freq_size = ctr_freq + nbr_freq * 2
        packed_output = input.new_empty(batch_size, num_channels, sb_freq_size, num_frames, num_subbands)

        for subband_index in range(num_subbands):
            center_start = lower_cutoff_freq + subband_index * ctr_freq
            for sb_freq_index in range(sb_freq_size):
                source_freq = center_start + sb_freq_index - nbr_freq
                source_freq = reflect_frequency_index(source_freq, num_freqs)
                packed_output[:, :, sb_freq_index, :, subband_index] = input[:, :, source_freq, :]

        return packed_output.permute(0, 4, 1, 2, 3)
