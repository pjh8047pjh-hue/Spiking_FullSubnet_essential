import torch
from einops import rearrange
from torch.nn import functional as F


def build_subband_input(noisy_input, fb_output, lower_cutoff_freq, upper_cutoff_freq, ctr_freq, nbr_freq):
    noisy_subbands = freq_unfold(
        input_tensor=noisy_input,
        lower_cutoff_freq=lower_cutoff_freq,
        upper_cutoff_freq=upper_cutoff_freq,
        ctr_freq=ctr_freq,
        nbr_freq=nbr_freq,
    )
    fb_subbands = freq_unfold(
        input_tensor=fb_output,
        lower_cutoff_freq=lower_cutoff_freq,
        upper_cutoff_freq=upper_cutoff_freq,
        ctr_freq=ctr_freq,
        nbr_freq=0,
    )
    return torch.cat([noisy_subbands, fb_subbands], dim=-2)


def freq_unfold(input_tensor, lower_cutoff_freq, upper_cutoff_freq, ctr_freq, nbr_freq):
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
    _, num_channels, num_freqs, num_frames = input_tensor.size()
    assert num_channels == 1, "Only mono audio is supported."

    if (upper_cutoff_freq - lower_cutoff_freq) % ctr_freq != 0:
        raise ValueError(
            f"Number of frequency bins must be divisible by the center frequency."
            f"GOT: {ctr_freq=}, {upper_cutoff_freq=}, {lower_cutoff_freq=}"
        )

    if lower_cutoff_freq == 0:
        valid_input = input_tensor[..., : upper_cutoff_freq + nbr_freq, :]
        valid_input = F.pad(valid_input, (0, 0, nbr_freq, 0), mode="reflect")
    elif upper_cutoff_freq == num_freqs:
        valid_input = input_tensor[..., lower_cutoff_freq - nbr_freq :, :]
        valid_input = F.pad(valid_input, (0, 0, 0, nbr_freq), mode="reflect")
    else:
        valid_input = input_tensor[..., lower_cutoff_freq - nbr_freq : upper_cutoff_freq + nbr_freq, :]

    output = F.unfold(
        input=valid_input,
        kernel_size=(ctr_freq + nbr_freq * 2, num_frames),
        stride=(ctr_freq, num_frames),
    )
    output = rearrange(output, "b (c fs t) n -> b n c fs t", c=num_channels, fs=ctr_freq + nbr_freq * 2)

    return output
