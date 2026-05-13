#include "subband_ref_q610.hpp"

#include <array>
#include <cmath>
#include <cstdint>
#include <limits>

namespace subband_q610 {

const std::array<BandSpec, kNumBands> kBandSpecs = {{
    {0, 0, 32, 4, 15, 5, 8, 34, 4, 38, 40},
    {1, 32, 128, 32, 15, 3, 3, 62, 32, 94, 192},
    {2, 128, 256, 64, 15, 1, 2, 94, 64, 158, 128},
}};

namespace {

inline std::size_t InputIndex(int batch_index, int freq_index, int frame_index, int num_frames) {
  return static_cast<std::size_t>((batch_index * kNumFreqs + freq_index) * num_frames + frame_index);
}

inline std::size_t SubbandIndex(
    int batch_index,
    int subband_index,
    int freq_index,
    int frame_index,
    int num_subbands,
    int freq_size,
    int num_frames) {
  return static_cast<std::size_t>(
      ((batch_index * num_subbands + subband_index) * freq_size + freq_index) * num_frames + frame_index);
}

inline std::size_t PackedIndex(int sample_index, int feature_index, int frame_index, int feature_size, int num_frames) {
  return static_cast<std::size_t>((sample_index * feature_size + feature_index) * num_frames + frame_index);
}

inline std::size_t SequenceIndex(
    int frame_index,
    int sample_index,
    int feature_index,
    int batch_subbands,
    int feature_size) {
  return static_cast<std::size_t>((frame_index * batch_subbands + sample_index) * feature_size + feature_index);
}

inline std::size_t DfCoefIndex(
    int batch_index,
    int df_index,
    int freq_index,
    int frame_index,
    int complex_index,
    int df_order,
    int total_freqs,
    int num_frames) {
  return static_cast<std::size_t>(
      ((((batch_index * df_order + df_index) * total_freqs + freq_index) * num_frames + frame_index) * 2) +
      complex_index);
}

}  // namespace

int16_t SaturateInt16(int64_t value) {
  if (value > static_cast<int64_t>(std::numeric_limits<int16_t>::max())) {
    return std::numeric_limits<int16_t>::max();
  }
  if (value < static_cast<int64_t>(std::numeric_limits<int16_t>::min())) {
    return std::numeric_limits<int16_t>::min();
  }
  return static_cast<int16_t>(value);
}

int64_t RoundShiftRight(int64_t value, int shift_bits) {
  if (shift_bits <= 0) {
    return value;
  }

  const int64_t half = static_cast<int64_t>(1) << (shift_bits - 1);
  if (value >= 0) {
    return (value + half) >> shift_bits;
  }
  return -(((-value) + half) >> shift_bits);
}

int16_t FloatToQ610(float value) {
  const float scaled = value * static_cast<float>(kQScale);
  const int64_t rounded = (scaled >= 0.0f)
      ? static_cast<int64_t>(scaled + 0.5f)
      : static_cast<int64_t>(scaled - 0.5f);
  return SaturateInt16(rounded);
}

float Q610ToFloat(int16_t value) {
  return static_cast<float>(value) / static_cast<float>(kQScale);
}

int16_t MulQ610(int16_t lhs, int16_t rhs) {
  const int64_t product_q20 = static_cast<int64_t>(lhs) * static_cast<int64_t>(rhs);
  return SaturateInt16(RoundShiftRight(product_q20, kQFrac));
}

int16_t AddQ610(int16_t lhs, int16_t rhs) {
  return SaturateInt16(static_cast<int64_t>(lhs) + static_cast<int64_t>(rhs));
}

int16_t SubQ610(int16_t lhs, int16_t rhs) {
  return SaturateInt16(static_cast<int64_t>(lhs) - static_cast<int64_t>(rhs));
}

int16_t StepActivationQ610(int16_t input_value) {
  return input_value >= 0 ? kQOne : kQZero;
}

int16_t SigmoidQ610HostRef(int16_t input_value_q610) {
  const double input_value = static_cast<double>(Q610ToFloat(input_value_q610));
  const double sigmoid_value = 1.0 / (1.0 + std::exp(-input_value));
  return FloatToQ610(static_cast<float>(sigmoid_value));
}

int16_t BatchNormEvalQ610HostRef(int16_t input_value_q610, const GSUWeightsQ610& weights, int hidden_index) {
  if (weights.bn_running_mean == nullptr || weights.bn_running_var == nullptr ||
      weights.bn_weight == nullptr || weights.bn_bias == nullptr) {
    return input_value_q610;
  }

  const double x = static_cast<double>(Q610ToFloat(input_value_q610));
  const double mean = static_cast<double>(Q610ToFloat(weights.bn_running_mean[hidden_index]));
  const double var = static_cast<double>(Q610ToFloat(weights.bn_running_var[hidden_index]));
  const double gamma = static_cast<double>(Q610ToFloat(weights.bn_weight[hidden_index]));
  const double beta = static_cast<double>(Q610ToFloat(weights.bn_bias[hidden_index]));

  const double denom = std::sqrt(var + static_cast<double>(kBnEpsFloat));
  const double normalized = (x - mean) / denom;
  return FloatToQ610(static_cast<float>((gamma * normalized) + beta));
}

int ReflectFrequencyIndex(int freq_index, int num_freqs) {
  if (num_freqs <= 1) {
    return 0;
  }

  while (freq_index < 0 || freq_index >= num_freqs) {
    if (freq_index < 0) {
      freq_index = -freq_index;
    } else {
      freq_index = (2 * num_freqs) - freq_index - 2;
    }
  }

  return freq_index;
}

const BandSpec& GetBandSpec(int band_index) {
  return kBandSpecs[static_cast<std::size_t>(band_index)];
}

std::size_t GetNoisySubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.noisy_freq_size * num_frames;
}

std::size_t GetFbSubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.fb_freq_size * num_frames;
}

std::size_t GetSbInputElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.packed_input_size * num_frames;
}

std::size_t GetPackedInputElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.packed_input_size * num_frames;
}

std::size_t GetSequenceElementCount(int batch_subbands, int feature_size, int num_frames) {
  return static_cast<std::size_t>(num_frames) * batch_subbands * feature_size;
}

std::size_t GetStateElementCount(int batch_subbands) {
  return static_cast<std::size_t>(batch_subbands) * kSbHiddenSize;
}

std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.df_order * kNumSpks *
      (spec.num_subbands * spec.ctr_freq) * num_frames * 2;
}

void ClearBufferQ610(int16_t* buffer, std::size_t element_count) {
  for (std::size_t index = 0; index < element_count; ++index) {
    buffer[index] = kQZero;
  }
}

void FreqUnfoldQ610(
    const BandSpec& spec,
    int nbr_freq,
    const int16_t* input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  const int freq_size = spec.ctr_freq + (2 * nbr_freq);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int center_start = spec.lower_cutoff_freq + subband_index * spec.ctr_freq;
      for (int sb_freq_index = 0; sb_freq_index < freq_size; ++sb_freq_index) {
        int source_freq = center_start + sb_freq_index - nbr_freq;
        source_freq = ReflectFrequencyIndex(source_freq, kNumFreqs);
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output_q610[SubbandIndex(
              batch_index,
              subband_index,
              sb_freq_index,
              frame_index,
              spec.num_subbands,
              freq_size,
              num_frames)] = input_q610[InputIndex(batch_index, source_freq, frame_index, num_frames)];
        }
      }
    }
  }
}

void ConcatQ610(
    const BandSpec& spec,
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      for (int freq_index = 0; freq_index < spec.noisy_freq_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output_q610[SubbandIndex(
              batch_index,
              subband_index,
              freq_index,
              frame_index,
              spec.num_subbands,
              spec.packed_input_size,
              num_frames)] = noisy_subbands_q610[SubbandIndex(
              batch_index,
              subband_index,
              freq_index,
              frame_index,
              spec.num_subbands,
              spec.noisy_freq_size,
              num_frames)];
        }
      }

      for (int freq_index = 0; freq_index < spec.fb_freq_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output_q610[SubbandIndex(
              batch_index,
              subband_index,
              spec.noisy_freq_size + freq_index,
              frame_index,
              spec.num_subbands,
              spec.packed_input_size,
              num_frames)] = fb_subbands_q610[SubbandIndex(
              batch_index,
              subband_index,
              freq_index,
              frame_index,
              spec.num_subbands,
              spec.fb_freq_size,
              num_frames)];
        }
      }
    }
  }
}

void PackQ610(
    const BandSpec& spec,
    const int16_t* sb_input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int freq_index = 0; freq_index < spec.packed_input_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output_q610[PackedIndex(sample_index, freq_index, frame_index, spec.packed_input_size, num_frames)] =
              sb_input_q610[SubbandIndex(
                  batch_index,
                  subband_index,
                  freq_index,
                  frame_index,
                  spec.num_subbands,
                  spec.packed_input_size,
                  num_frames)];
        }
      }
    }
  }
}

void PackedToSequenceQ610(
    const int16_t* packed_input_q610,
    int batch_subbands,
    int feature_size,
    int num_frames,
    int16_t* output_q610) {
  for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
    for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        output_q610[SequenceIndex(frame_index, sample_index, feature_index, batch_subbands, feature_size)] =
            packed_input_q610[PackedIndex(sample_index, feature_index, frame_index, feature_size, num_frames)];
      }
    }
  }
}

void RunGSULayerQ610(
    const int16_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights,
    int16_t* hx_state_q610,
    int16_t* cx_state_q610,
    int16_t* sequence_output_q610) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const int16_t* input_ptr = &sequence_input_q610[input_offset];
      std::array<int16_t, kSbHiddenSize> prev_hx_q610{};
      std::array<int16_t, kSbHiddenSize> prev_cx_q610{};

      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        prev_hx_q610[hidden_index] = hx_state_q610[state_offset + hidden_index];
        prev_cx_q610[hidden_index] = cx_state_q610[state_offset + hidden_index];
      }

      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        const int16_t* weight_ih_ptr =
            &weights.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
        const int16_t* weight_hh_ptr =
            &weights.weight_hh[static_cast<std::size_t>(hidden_index) * kSbHiddenSize];

        int64_t common_q20 = 0;
        for (int input_index = 0; input_index < input_size; ++input_index) {
          common_q20 += static_cast<int64_t>(input_ptr[input_index]) *
                        static_cast<int64_t>(weight_ih_ptr[input_index]);
        }
        for (int recurrent_index = 0; recurrent_index < kSbHiddenSize; ++recurrent_index) {
          common_q20 += static_cast<int64_t>(prev_hx_q610[recurrent_index]) *
                        static_cast<int64_t>(weight_hh_ptr[recurrent_index]);
        }

        const int64_t q_scale_q20 = static_cast<int64_t>(1) << kQFrac;
        const int64_t forget_q20 =
            common_q20 + (static_cast<int64_t>(weights.bias_ih[hidden_index]) * q_scale_q20);
        const int64_t cell_q20 =
            common_q20 + (static_cast<int64_t>(weights.bias_ih[kSbHiddenSize + hidden_index]) * q_scale_q20);

        const int16_t forget_preact_q610 = SaturateInt16(RoundShiftRight(forget_q20, kQFrac));
        const int16_t cell_preact_q610 = SaturateInt16(RoundShiftRight(cell_q20, kQFrac));

        const int16_t forget_gate_q610 = SigmoidQ610HostRef(forget_preact_q610);
        const int16_t one_minus_forget_q610 = SubQ610(kQOne, forget_gate_q610);
        const int16_t retained_q610 = MulQ610(forget_gate_q610, prev_cx_q610[hidden_index]);
        const int16_t injected_q610 = MulQ610(one_minus_forget_q610, cell_preact_q610);

        int16_t cy_q610 = AddQ610(retained_q610, injected_q610);
        cy_q610 = BatchNormEvalQ610HostRef(cy_q610, weights, hidden_index);
        const int16_t hy_q610 = StepActivationQ610(cy_q610);

        cx_state_q610[state_offset + hidden_index] = cy_q610;
        hx_state_q610[state_offset + hidden_index] = hy_q610;
        sequence_output_q610[SequenceIndex(frame_index, sample_index, hidden_index, batch_subbands, kSbHiddenSize)] =
            hy_q610;
      }
    }
  }
}

void RunProjectionQ610(
    const int16_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights,
    int16_t* sequence_output_q610) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const int16_t* input_ptr =
          &sequence_input_q610[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];
      for (int proj_index = 0; proj_index < proj_size; ++proj_index) {
        const int64_t q_scale_q20 = static_cast<int64_t>(1) << kQFrac;
        int64_t sum_q20 = static_cast<int64_t>(weights.bias[proj_index]) * q_scale_q20;
        const int16_t* weight_ptr =
            &weights.weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<int64_t>(input_ptr[hidden_index]) *
                     static_cast<int64_t>(weight_ptr[hidden_index]);
        }
        sequence_output_q610[SequenceIndex(frame_index, sample_index, proj_index, batch_subbands, proj_size)] =
            SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
      }
    }
  }
}

void ProjectToDfCoefQ610(
    const BandSpec& spec,
    const int16_t* projected_sequence_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const int total_freqs = spec.num_subbands * spec.ctr_freq;

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int complex_index = 0; complex_index < 2; ++complex_index) {
        for (int ctr_index = 0; ctr_index < spec.ctr_freq; ++ctr_index) {
          for (int df_index = 0; df_index < spec.df_order; ++df_index) {
            const int feature_index = ((complex_index * spec.ctr_freq + ctr_index) * spec.df_order) + df_index;
            const int merged_freq_index = subband_index * spec.ctr_freq + ctr_index;
            for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
              output_q610[DfCoefIndex(
                  batch_index,
                  df_index,
                  merged_freq_index,
                  frame_index,
                  complex_index,
                  spec.df_order,
                  total_freqs,
                  num_frames)] = projected_sequence_q610[SequenceIndex(
                  frame_index,
                  sample_index,
                  feature_index,
                  batch_subbands,
                  spec.proj_size)];
            }
          }
        }
      }
    }
  }
}

void RunBandQ610(
    const BandSpec& spec,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610) {
  const int batch_subbands = batch_size * spec.num_subbands;

  FreqUnfoldQ610(spec, spec.nbr_freq, noisy_input_q610, batch_size, num_frames, noisy_subbands_q610);
  FreqUnfoldQ610(spec, 0, fb_output_q610, batch_size, num_frames, fb_subbands_q610);
  ConcatQ610(spec, noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, sb_input_q610);
  PackQ610(spec, sb_input_q610, batch_size, num_frames, packed_input_q610);
  PackedToSequenceQ610(packed_input_q610, batch_subbands, spec.packed_input_size, num_frames, sequence_input_q610);

  ClearBufferQ610(layer0_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer0_cx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_cx_state_q610, GetStateElementCount(batch_subbands));

  RunGSULayerQ610(
      sequence_input_q610,
      batch_subbands,
      num_frames,
      spec.packed_input_size,
      weights_q610.layers[0],
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610);

  RunGSULayerQ610(
      layer0_output_q610,
      batch_subbands,
      num_frames,
      kSbHiddenSize,
      weights_q610.layers[1],
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_q610);

  RunProjectionQ610(
      layer1_output_q610,
      batch_subbands,
      num_frames,
      spec.proj_size,
      weights_q610.proj,
      projected_output_q610);

  ProjectToDfCoefQ610(spec, projected_output_q610, batch_size, num_frames, df_coef_q610);
}

void RunBand0Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610) {
  RunBandQ610(
      GetBandSpec(0),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      noisy_subbands_q610,
      fb_subbands_q610,
      sb_input_q610,
      packed_input_q610,
      sequence_input_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_q610,
      projected_output_q610,
      df_coef_q610);
}

void RunBand1Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610) {
  RunBandQ610(
      GetBandSpec(1),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      noisy_subbands_q610,
      fb_subbands_q610,
      sb_input_q610,
      packed_input_q610,
      sequence_input_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_q610,
      projected_output_q610,
      df_coef_q610);
}

void RunBand2Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610) {
  RunBandQ610(
      GetBandSpec(2),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      noisy_subbands_q610,
      fb_subbands_q610,
      sb_input_q610,
      packed_input_q610,
      sequence_input_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_q610,
      projected_output_q610,
      df_coef_q610);
}

}  // namespace subband_q610
