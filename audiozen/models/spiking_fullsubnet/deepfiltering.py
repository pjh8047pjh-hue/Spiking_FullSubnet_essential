import torch
from einops import rearrange
from torch.nn import functional as F


def deepfiltering(complex_spec, coef, order: int, num_spks: int):
    """Deep filtering implementation using `torch.einsum`. Requires unfolded spectrogram.

    Args:
        complex_spec (`torch.ComplexTensor` of shape `[B, C, F, T]`):
            Complex spectrogram.
        coef (`torch.Tensor` of shape `[B, C * order, F, T, 2]`):
            Coefficients of the deep filter.
        order (`int`): Order of the deep filter.
        num_spks (`int`): Number of speakers.

    Returns:
        spec (complex Tensor): Spectrogram of shape `[B, C, S, F, T]`.
    """
    if order > 1:
        complex_spec = F.pad(complex_spec, (order - 1, 0))
        complex_spec = complex_spec.unfold(3, order, 1)  # [B, C, F, T, df]
    else:
        complex_spec = complex_spec.unsqueeze(-1)  # [B, C, F, T, 1]

    complex_spec = complex_spec.unsqueeze(-1)  # [B, C, F, T, df, 1]
    complex_spec = complex_spec.repeat(1, 1, 1, 1, 1, num_spks)  # [B, C, F, T, df, s]

    complex_coef = torch.complex(coef[..., 0], coef[..., 1])  # [B, C * df, s, F, T]
    complex_coef = rearrange(complex_coef, "b (c df) s f t -> b c df s f t", df=order)

    return torch.einsum("...ftds,...dsft->...sft", complex_spec, complex_coef)
