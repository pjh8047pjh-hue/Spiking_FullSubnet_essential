#include "subband_ref_q610.hpp"

#include <cassert>
#include <cstdint>
#include <limits>

namespace subband_q610 {

const BandSpec kBandSpecs[kNumBands] = {
    {0, 0, 32, 4, 15, 5, 8, 34, 4, 38, 40},
    {1, 32, 128, 32, 15, 3, 3, 62, 32, 94, 192},
    {2, 128, 256, 64, 15, 1, 2, 94, 64, 158, 128},
};

namespace {

constexpr int kSigmoidPwlSegmentCount = 16;
constexpr q_data_t kSigmoidPwlKnotsQ610[kSigmoidPwlSegmentCount + 1] = {
    0, 256, 512, 768, 1024, 1280, 1536, 1792, 2048, 2560, 3072, 3584, 4096, 5120, 6144, 7168, 8192,
};
constexpr q_data_t kSigmoidPwlValuesQ610[kSigmoidPwlSegmentCount + 1] = {
    512, 576, 637, 695, 749, 796, 837, 872, 902, 946, 975, 994, 1006, 1017, 1021, 1023, 1024,
};

static_assert(kBand0ProjSize == (2 * kBand0CtrFreq * kBand0DfOrder), "Band0 projection layout must match DF layout.");
static_assert(kBand1ProjSize == (2 * kBand1CtrFreq * kBand1DfOrder), "Band1 projection layout must match DF layout.");
static_assert(kBand2ProjSize == (2 * kBand2CtrFreq * kBand2DfOrder), "Band2 projection layout must match DF layout.");

void AssertBandSpecBounds(const BandSpec& spec) {
  assert(spec.band_index >= 0 && spec.band_index < kNumBands);
  assert(spec.lower_cutoff_freq >= 0);
  assert(spec.upper_cutoff_freq <= kNumFreqs);
  assert(spec.ctr_freq > 0 && spec.ctr_freq <= kMaxCtrFreq);
  assert(spec.nbr_freq >= 0 && spec.nbr_freq <= kMaxNoisyFreqSize);
  assert(spec.df_order > 0 && spec.df_order <= kMaxDfOrder);
  assert(spec.num_subbands > 0 && spec.num_subbands <= kMaxNumSubbands);
  assert(spec.noisy_freq_size > 0 && spec.noisy_freq_size <= kMaxNoisyFreqSize);
  assert(spec.fb_freq_size > 0 && spec.fb_freq_size <= kMaxFbFreqSize);
  assert(spec.packed_input_size > 0 && spec.packed_input_size <= kMaxPackedInputSize);
  assert(spec.proj_size > 0 && spec.proj_size <= kMaxProjSize);
}

void AssertBandRuntimeBounds(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandSpecBounds(spec);
  assert(batch_size >= 0 && batch_size <= kMaxBatchSize);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);
}

void AssertBatchSubbandsBounds(int batch_subbands) {
  assert(batch_subbands >= 0 && batch_subbands <= kMaxBatchSubbands);
}

void AssertInputSizeBounds(int input_size) {
  assert(input_size >= 0 && input_size <= kMaxCellInputSize);
}

void AssertProjectionSizeBounds(int proj_size) {
  assert(proj_size >= 0 && proj_size <= kMaxProjSize);
}

template <int N>
void CopyExternalToLocalQ610(const q_data_t* input, q_data_t (&output)[N]) {
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    output[index] = input[index];
  }
}

template <int N>
void PointerToStreamQ610(const q_data_t* input, hls::stream<q_data_t>& output_stream) {
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    output_stream.write(input[index]);
  }
}

template <int N>
void StreamToPointerQ610(hls::stream<q_data_t>& input_stream, q_data_t* output) {
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    output[index] = input_stream.read();
  }
}

template <int N>
void ReadVectorFromStreamQ610(hls::stream<q_data_t>& input_stream, q_data_t (&buffer)[N], int vector_size) {
  assert(vector_size >= 0 && vector_size <= N);
  for (int index = 0; index < vector_size; ++index) {
    #pragma HLS pipeline II=1
    buffer[index] = input_stream.read();
  }
}

template <int N>
void WriteVectorToStreamQ610(const q_data_t (&buffer)[N], int vector_size, hls::stream<q_data_t>& output_stream) {
  assert(vector_size >= 0 && vector_size <= N);
  for (int index = 0; index < vector_size; ++index) {
    #pragma HLS pipeline II=1
    output_stream.write(buffer[index]);
  }
}

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

q_data_t SaturateInt16(accum_q_t value) {
  const accum_q_t max_value = static_cast<accum_q_t>(std::numeric_limits<int16_t>::max());
  const accum_q_t min_value = static_cast<accum_q_t>(std::numeric_limits<int16_t>::min());
  if (value > max_value) {
    return static_cast<q_data_t>(std::numeric_limits<int16_t>::max());
  }
  if (value < min_value) {
    return static_cast<q_data_t>(std::numeric_limits<int16_t>::min());
  }
  return static_cast<q_data_t>(value);
}

accum_q_t RoundShiftRight(accum_q_t value, int shift_bits) {
  if (shift_bits <= 0) {
    return value;
  }

  const accum_q_t half = static_cast<accum_q_t>(1) << (shift_bits - 1);
  if (value >= 0) {
    return (value + half) >> shift_bits;
  }
  return -(((-value) + half) >> shift_bits);
}

q_data_t MulQ610(q_data_t lhs, q_data_t rhs) {
  const accum_q_t product_q20 = static_cast<accum_q_t>(lhs) * static_cast<accum_q_t>(rhs);
  return SaturateInt16(RoundShiftRight(product_q20, kQFrac));
}

q_data_t AddQ610(q_data_t lhs, q_data_t rhs) {
  return SaturateInt16(static_cast<accum_q_t>(lhs) + static_cast<accum_q_t>(rhs));
}

q_data_t SubQ610(q_data_t lhs, q_data_t rhs) {
  return SaturateInt16(static_cast<accum_q_t>(lhs) - static_cast<accum_q_t>(rhs));
}

q_data_t StepActivationQ610(q_data_t input_value) {
  return input_value >= 0 ? kQOne : kQZero;
}

q_data_t SigmoidPwlQ610(q_data_t input_value_q610) {
  if (input_value_q610 >= kSigmoidPwlKnotsQ610[kSigmoidPwlSegmentCount]) {
    return kQOne;
  }
  if (input_value_q610 <= -kSigmoidPwlKnotsQ610[kSigmoidPwlSegmentCount]) {
    return kQZero;
  }

  const bool is_negative = input_value_q610 < 0;
  q_data_t abs_input_q610 = input_value_q610;
  if (is_negative) {
    abs_input_q610 = static_cast<q_data_t>(-static_cast<accum_q_t>(input_value_q610));
  }

  int segment_index = kSigmoidPwlSegmentCount - 1;
  for (int segment = 0; segment < kSigmoidPwlSegmentCount; ++segment) {
    #pragma HLS unroll
    if (abs_input_q610 <= kSigmoidPwlKnotsQ610[segment + 1]) {
      segment_index = segment;
      break;
    }
  }

  const q_data_t x0_q610 = kSigmoidPwlKnotsQ610[segment_index];
  const q_data_t x1_q610 = kSigmoidPwlKnotsQ610[segment_index + 1];
  const q_data_t y0_q610 = kSigmoidPwlValuesQ610[segment_index];
  const q_data_t y1_q610 = kSigmoidPwlValuesQ610[segment_index + 1];
  const int32_t delta_x_q610 = static_cast<int32_t>(x1_q610) - static_cast<int32_t>(x0_q610);
  const int32_t delta_y_q610 = static_cast<int32_t>(y1_q610) - static_cast<int32_t>(y0_q610);
  const int32_t offset_x_q610 = static_cast<int32_t>(abs_input_q610) - static_cast<int32_t>(x0_q610);
  const int32_t interpolated_q610 =
      static_cast<int32_t>(y0_q610) + ((offset_x_q610 * delta_y_q610 + (delta_x_q610 / 2)) / delta_x_q610);
  const q_data_t positive_value_q610 = SaturateInt16(interpolated_q610);
  return is_negative ? SubQ610(kQOne, positive_value_q610) : positive_value_q610;
}

q_data_t ApplyBatchNormFoldedQ610(q_data_t input_value_q610, const GSUWeightsQ610& weights, int hidden_index) {
  if (weights.bn_mul == nullptr || weights.bn_add == nullptr) {
    return input_value_q610;
  }
  const q_data_t scaled_q610 = MulQ610(input_value_q610, weights.bn_mul[hidden_index]);
  return AddQ610(scaled_q610, weights.bn_add[hidden_index]);
}

int ReflectFrequencyIndex(int freq_index, int num_freqs) {
  assert(num_freqs > 0 && num_freqs <= kNumFreqs);
  if (num_freqs <= 1) {
    return 0;
  }

  for (int reflect_iter = 0; reflect_iter < (2 * kNumFreqs); ++reflect_iter) {
    if (freq_index >= 0 && freq_index < num_freqs) {
      break;
    }
    if (freq_index < 0) {
      freq_index = -freq_index;
    } else {
      freq_index = (2 * num_freqs) - freq_index - 2;
    }
  }

  assert(freq_index >= 0 && freq_index < num_freqs);
  return freq_index;
}

const BandSpec& GetBandSpec(int band_index) {
  assert(band_index >= 0 && band_index < kNumBands);
  return kBandSpecs[static_cast<std::size_t>(band_index)];
}

std::size_t GetNoisySubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.noisy_freq_size * num_frames;
}

std::size_t GetFbSubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.fb_freq_size * num_frames;
}

std::size_t GetSbInputElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.packed_input_size * num_frames;
}

std::size_t GetPackedInputElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  return static_cast<std::size_t>(batch_size) * spec.num_subbands * spec.packed_input_size * num_frames;
}

std::size_t GetSequenceElementCount(int batch_subbands, int feature_size, int num_frames) {
  AssertBatchSubbandsBounds(batch_subbands);
  assert(feature_size >= 0 && feature_size <= kMaxSequenceFeatureSize);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);
  return static_cast<std::size_t>(num_frames) * batch_subbands * feature_size;
}

std::size_t GetStateElementCount(int batch_subbands) {
  AssertBatchSubbandsBounds(batch_subbands);
  return static_cast<std::size_t>(batch_subbands) * kSbHiddenSize;
}

std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  return static_cast<std::size_t>(batch_size) * spec.df_order * kNumSpks *
      (spec.num_subbands * spec.ctr_freq) * num_frames * 2;
}

void ClearBufferQ610(q_data_t* buffer, std::size_t element_count) {
  assert(element_count <= static_cast<std::size_t>(kMaxStateElementCount));
  for (std::size_t index = 0; index < element_count; ++index) {
    #pragma HLS pipeline II=1
    buffer[index] = kQZero;
  }
}

void FreqUnfoldQ610(
    const BandSpec& spec,
    int nbr_freq,
    const q_data_t* input_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  assert(nbr_freq >= 0 && nbr_freq <= kMaxNoisyFreqSize);
  const int freq_size = spec.ctr_freq + (2 * nbr_freq);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int center_start = spec.lower_cutoff_freq + subband_index * spec.ctr_freq;
      for (int sb_freq_index = 0; sb_freq_index < freq_size; ++sb_freq_index) {
        int source_freq = center_start + sb_freq_index - nbr_freq;
        source_freq = ReflectFrequencyIndex(source_freq, kNumFreqs);
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
          #pragma HLS pipeline II=1
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
    const q_data_t* noisy_subbands_q610,
    const q_data_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      for (int freq_index = 0; freq_index < spec.noisy_freq_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
          #pragma HLS pipeline II=1
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
          #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
          #pragma HLS pipeline II=1
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
    const q_data_t* sb_input_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int freq_index = 0; freq_index < spec.packed_input_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
          #pragma HLS pipeline II=1
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
    const q_data_t* packed_input_q610,
    int batch_subbands,
    int feature_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBatchSubbandsBounds(batch_subbands);
  AssertInputSizeBounds(feature_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);
  for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
    for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
        #pragma HLS pipeline II=1
        output_q610[SequenceIndex(frame_index, sample_index, feature_index, batch_subbands, feature_size)] =
            packed_input_q610[PackedIndex(sample_index, feature_index, frame_index, feature_size, num_frames)];
      }
    }
  }
}

namespace {

void RunGSUCellQ610(
    const q_data_t* input_ptr,
    int input_size,
    const GSUWeightsQ610& weights,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    q_data_t* output_hy_q610) {
  AssertInputSizeBounds(input_size);
  q_data_t prev_hx_q610[kSbHiddenSize];
  q_data_t prev_cx_q610[kSbHiddenSize];

  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    #pragma HLS pipeline II=1
    prev_hx_q610[hidden_index] = hx_state_q610[hidden_index];
    prev_cx_q610[hidden_index] = cx_state_q610[hidden_index];
  }

  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    const q_data_t* weight_ih_ptr = &weights.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
    const q_data_t* weight_hh_ptr = &weights.weight_hh[static_cast<std::size_t>(hidden_index) * kSbHiddenSize];

    accum_q_t common_q20 = 0;
    for (int input_index = 0; input_index < input_size; ++input_index) {
      common_q20 += static_cast<accum_q_t>(input_ptr[input_index]) * static_cast<accum_q_t>(weight_ih_ptr[input_index]);
    }
    for (int recurrent_index = 0; recurrent_index < kSbHiddenSize; ++recurrent_index) {
      common_q20 +=
          static_cast<accum_q_t>(prev_hx_q610[recurrent_index]) * static_cast<accum_q_t>(weight_hh_ptr[recurrent_index]);
    }

    const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
    const accum_q_t forget_q20 =
        common_q20 + (static_cast<accum_q_t>(weights.bias_ih[hidden_index]) * q_scale_q20);
    const accum_q_t cell_q20 =
        common_q20 + (static_cast<accum_q_t>(weights.bias_ih[kSbHiddenSize + hidden_index]) * q_scale_q20);

    const q_data_t forget_preact_q610 = SaturateInt16(RoundShiftRight(forget_q20, kQFrac));
    const q_data_t cell_preact_q610 = SaturateInt16(RoundShiftRight(cell_q20, kQFrac));

    const q_data_t forget_gate_q610 = SigmoidPwlQ610(forget_preact_q610);
    const q_data_t one_minus_forget_q610 = SubQ610(kQOne, forget_gate_q610);
    const q_data_t retained_q610 = MulQ610(forget_gate_q610, prev_cx_q610[hidden_index]);
    const q_data_t injected_q610 = MulQ610(one_minus_forget_q610, cell_preact_q610);

    q_data_t cy_q610 = AddQ610(retained_q610, injected_q610);
    cy_q610 = ApplyBatchNormFoldedQ610(cy_q610, weights, hidden_index);
    const q_data_t hy_q610 = StepActivationQ610(cy_q610);

    cx_state_q610[hidden_index] = cy_q610;
    hx_state_q610[hidden_index] = hy_q610;
    output_hy_q610[hidden_index] = hy_q610;
  }
}

}  // namespace

void RunGSULayerQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    q_data_t* sequence_output_q610) {
  AssertBatchSubbandsBounds(batch_subbands);
  AssertInputSizeBounds(input_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const std::size_t output_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize);
      RunGSUCellQ610(
          &sequence_input_q610[input_offset],
          input_size,
          weights,
          &hx_state_q610[state_offset],
          &cx_state_q610[state_offset],
          &sequence_output_q610[output_offset]);
    }
  }
}

namespace {

void RunStackedGSUQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int first_layer_input_size,
    const BandWeightsQ610& weights_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610) {
  RunGSULayerQ610(
      sequence_input_q610,
      batch_subbands,
      num_frames,
      first_layer_input_size,
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
}

}  // namespace

void RunProjectionQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights,
    q_data_t* sequence_output_q610) {
  AssertBatchSubbandsBounds(batch_subbands);
  AssertProjectionSizeBounds(proj_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const q_data_t* input_ptr =
          &sequence_input_q610[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];
      for (int proj_index = 0; proj_index < proj_size; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        accum_q_t sum_q20 = static_cast<accum_q_t>(weights.bias[proj_index]) * q_scale_q20;
        const q_data_t* weight_ptr =
            &weights.weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<accum_q_t>(input_ptr[hidden_index]) *
                     static_cast<accum_q_t>(weight_ptr[hidden_index]);
        }
        sequence_output_q610[SequenceIndex(frame_index, sample_index, proj_index, batch_subbands, proj_size)] =
            SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
      }
    }
  }
}

void ProjectToDfCoefQ610(
    const BandSpec& spec,
    const q_data_t* projected_sequence_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  const int batch_subbands = batch_size * spec.num_subbands;
  AssertBatchSubbandsBounds(batch_subbands);
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
              #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
              #pragma HLS pipeline II=1
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

namespace {

void GenerateBand0SequenceStreamQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    hls::stream<q_data_t>& sequence_stream) {
  #pragma HLS inline off
  constexpr int kBand0NbrFreq = (kBand0NoisyFreqSize - kBand0CtrFreq) / 2;

  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kFixedNumFrames
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      const int center_start = subband_index * kBand0CtrFreq;
      for (int noisy_freq_index = 0; noisy_freq_index < kBand0NoisyFreqSize; ++noisy_freq_index) {
        #pragma HLS pipeline II=1
        int source_freq = center_start + noisy_freq_index - kBand0NbrFreq;
        if (source_freq < 0) {
          source_freq = -source_freq;
        }
        sequence_stream.write(noisy_input_q610[InputIndex(0, source_freq, frame_index, kFixedNumFrames)]);
      }
      for (int fb_freq_index = 0; fb_freq_index < kBand0FbFreqSize; ++fb_freq_index) {
        #pragma HLS pipeline II=1
        const int source_freq = center_start + fb_freq_index;
        sequence_stream.write(fb_output_q610[InputIndex(0, source_freq, frame_index, kFixedNumFrames)]);
      }
    }
  }
}

void RunGSULayerStreamQ610(
    hls::stream<q_data_t>& sequence_input_stream,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    hls::stream<q_data_t>& sequence_output_stream) {
  AssertBatchSubbandsBounds(batch_subbands);
  AssertInputSizeBounds(input_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);

  q_data_t input_buffer[kMaxCellInputSize];
  q_data_t output_buffer[kSbHiddenSize];

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      ReadVectorFromStreamQ610(sequence_input_stream, input_buffer, input_size);
      RunGSUCellQ610(
          input_buffer,
          input_size,
          weights,
          &hx_state_q610[state_offset],
          &cx_state_q610[state_offset],
          output_buffer);
      WriteVectorToStreamQ610(output_buffer, kSbHiddenSize, sequence_output_stream);
    }
  }
}

void RunProjectionStreamQ610(
    hls::stream<q_data_t>& sequence_input_stream,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights,
    hls::stream<q_data_t>& sequence_output_stream) {
  AssertBatchSubbandsBounds(batch_subbands);
  AssertProjectionSizeBounds(proj_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);

  q_data_t input_buffer[kSbHiddenSize];

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      ReadVectorFromStreamQ610(sequence_input_stream, input_buffer, kSbHiddenSize);
      for (int proj_index = 0; proj_index < proj_size; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        accum_q_t sum_q20 = static_cast<accum_q_t>(weights.bias[proj_index]) * q_scale_q20;
        const q_data_t* weight_ptr = &weights.weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<accum_q_t>(input_buffer[hidden_index]) *
                     static_cast<accum_q_t>(weight_ptr[hidden_index]);
        }
        sequence_output_stream.write(SaturateInt16(RoundShiftRight(sum_q20, kQFrac)));
      }
    }
  }
}

void ProjectBand0DfCoefQ610(hls::stream<q_data_t>& projected_stream, q_data_t* df_coef_q610) {
  #pragma HLS inline off
  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kFixedNumFrames
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      for (int feature_index = 0; feature_index < kBand0ProjSize; ++feature_index) {
        #pragma HLS pipeline II=1
        const q_data_t value_q610 = projected_stream.read();
        const int complex_index = feature_index / (kBand0CtrFreq * kBand0DfOrder);
        const int feature_remainder = feature_index % (kBand0CtrFreq * kBand0DfOrder);
        const int ctr_index = feature_remainder / kBand0DfOrder;
        const int df_index = feature_remainder % kBand0DfOrder;
        const int merged_freq_index = subband_index * kBand0CtrFreq + ctr_index;
        df_coef_q610[DfCoefIndex(
            0,
            df_index,
            merged_freq_index,
            frame_index,
            complex_index,
            kBand0DfOrder,
            kBand0TotalFreqs,
            kFixedNumFrames)] = value_q610;
      }
    }
  }
}

void RunBand0StreamingCoreQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    const BandWeightsQ610& weights_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* df_coef_q610) {
  #pragma HLS inline off
  hls::stream<q_data_t> sequence_stream;
  hls::stream<q_data_t> layer0_output_stream;
  hls::stream<q_data_t> layer1_output_stream;
  hls::stream<q_data_t> projected_output_stream;

  #pragma HLS stream variable=sequence_stream depth=64
  #pragma HLS stream variable=layer0_output_stream depth=64
  #pragma HLS stream variable=layer1_output_stream depth=64
  #pragma HLS stream variable=projected_output_stream depth=64

  ClearBufferQ610(layer0_hx_state_q610, kBand0StateElementCount);
  ClearBufferQ610(layer0_cx_state_q610, kBand0StateElementCount);
  ClearBufferQ610(layer1_hx_state_q610, kBand0StateElementCount);
  ClearBufferQ610(layer1_cx_state_q610, kBand0StateElementCount);

  #pragma HLS dataflow
  GenerateBand0SequenceStreamQ610(noisy_input_q610, fb_output_q610, sequence_stream);
  RunGSULayerStreamQ610(
      sequence_stream,
      kBand0NumSubbands,
      kFixedNumFrames,
      kBand0PackedInputSize,
      weights_q610.layers[0],
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_stream);
  RunGSULayerStreamQ610(
      layer0_output_stream,
      kBand0NumSubbands,
      kFixedNumFrames,
      kSbHiddenSize,
      weights_q610.layers[1],
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_stream);
  RunProjectionStreamQ610(
      layer1_output_stream,
      kBand0NumSubbands,
      kFixedNumFrames,
      kBand0ProjSize,
      weights_q610.proj,
      projected_output_stream);
  ProjectBand0DfCoefQ610(projected_output_stream, df_coef_q610);
}

}  // namespace

void RunBandQ610(
    const BandSpec& spec,
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  const int batch_subbands = batch_size * spec.num_subbands;
  AssertBatchSubbandsBounds(batch_subbands);

  FreqUnfoldQ610(spec, spec.nbr_freq, noisy_input_q610, batch_size, num_frames, noisy_subbands_q610);
  FreqUnfoldQ610(spec, 0, fb_output_q610, batch_size, num_frames, fb_subbands_q610);
  ConcatQ610(spec, noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, sb_input_q610);
  PackQ610(spec, sb_input_q610, batch_size, num_frames, packed_input_q610);
  PackedToSequenceQ610(packed_input_q610, batch_subbands, spec.packed_input_size, num_frames, sequence_input_q610);

  ClearBufferQ610(layer0_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer0_cx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_cx_state_q610, GetStateElementCount(batch_subbands));

  RunStackedGSUQ610(
      sequence_input_q610,
      batch_subbands,
      num_frames,
      spec.packed_input_size,
      weights_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610,
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

namespace {

void LoadBand0WeightsQ610(
    const q_data_t* layer0_weight_ih_q610,
    const q_data_t* layer0_weight_hh_q610,
    const q_data_t* layer0_bias_ih_q610,
    const q_data_t* layer0_bn_mul_q610,
    const q_data_t* layer0_bn_add_q610,
    const q_data_t* layer1_weight_ih_q610,
    const q_data_t* layer1_weight_hh_q610,
    const q_data_t* layer1_bias_ih_q610,
    const q_data_t* layer1_bn_mul_q610,
    const q_data_t* layer1_bn_add_q610,
    const q_data_t* proj_weight_q610,
    const q_data_t* proj_bias_q610,
    q_data_t (&layer0_weight_ih_local)[kSbHiddenSize * kBand0PackedInputSize],
    q_data_t (&layer0_weight_hh_local)[kSbHiddenSize * kSbHiddenSize],
    q_data_t (&layer0_bias_ih_local)[2 * kSbHiddenSize],
    q_data_t (&layer0_bn_mul_local)[kSbHiddenSize],
    q_data_t (&layer0_bn_add_local)[kSbHiddenSize],
    q_data_t (&layer1_weight_ih_local)[kSbHiddenSize * kSbHiddenSize],
    q_data_t (&layer1_weight_hh_local)[kSbHiddenSize * kSbHiddenSize],
    q_data_t (&layer1_bias_ih_local)[2 * kSbHiddenSize],
    q_data_t (&layer1_bn_mul_local)[kSbHiddenSize],
    q_data_t (&layer1_bn_add_local)[kSbHiddenSize],
    q_data_t (&proj_weight_local)[kBand0ProjSize * kSbHiddenSize],
    q_data_t (&proj_bias_local)[kBand0ProjSize]) {
  #pragma HLS inline off
  CopyExternalToLocalQ610<kSbHiddenSize * kBand0PackedInputSize>(layer0_weight_ih_q610, layer0_weight_ih_local);
  CopyExternalToLocalQ610<kSbHiddenSize * kSbHiddenSize>(layer0_weight_hh_q610, layer0_weight_hh_local);
  CopyExternalToLocalQ610<2 * kSbHiddenSize>(layer0_bias_ih_q610, layer0_bias_ih_local);
  CopyExternalToLocalQ610<kSbHiddenSize>(layer0_bn_mul_q610, layer0_bn_mul_local);
  CopyExternalToLocalQ610<kSbHiddenSize>(layer0_bn_add_q610, layer0_bn_add_local);
  CopyExternalToLocalQ610<kSbHiddenSize * kSbHiddenSize>(layer1_weight_ih_q610, layer1_weight_ih_local);
  CopyExternalToLocalQ610<kSbHiddenSize * kSbHiddenSize>(layer1_weight_hh_q610, layer1_weight_hh_local);
  CopyExternalToLocalQ610<2 * kSbHiddenSize>(layer1_bias_ih_q610, layer1_bias_ih_local);
  CopyExternalToLocalQ610<kSbHiddenSize>(layer1_bn_mul_q610, layer1_bn_mul_local);
  CopyExternalToLocalQ610<kSbHiddenSize>(layer1_bn_add_q610, layer1_bn_add_local);
  CopyExternalToLocalQ610<kBand0ProjSize * kSbHiddenSize>(proj_weight_q610, proj_weight_local);
  CopyExternalToLocalQ610<kBand0ProjSize>(proj_bias_q610, proj_bias_local);
}

void LoadBand0InputsQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    hls::stream<q_data_t>& noisy_input_stream,
    hls::stream<q_data_t>& fb_output_stream) {
  #pragma HLS inline off
  PointerToStreamQ610<kBand0InputElementCount>(noisy_input_q610, noisy_input_stream);
  PointerToStreamQ610<kBand0InputElementCount>(fb_output_q610, fb_output_stream);
}

void ComputeBand0FromStreamsQ610(
    hls::stream<q_data_t>& noisy_input_stream,
    hls::stream<q_data_t>& fb_output_stream,
    const q_data_t (&layer0_weight_ih_q610)[kSbHiddenSize * kBand0PackedInputSize],
    const q_data_t (&layer0_weight_hh_q610)[kSbHiddenSize * kSbHiddenSize],
    const q_data_t (&layer0_bias_ih_q610)[2 * kSbHiddenSize],
    const q_data_t (&layer0_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer0_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&layer1_weight_ih_q610)[kSbHiddenSize * kSbHiddenSize],
    const q_data_t (&layer1_weight_hh_q610)[kSbHiddenSize * kSbHiddenSize],
    const q_data_t (&layer1_bias_ih_q610)[2 * kSbHiddenSize],
    const q_data_t (&layer1_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer1_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&proj_weight_q610)[kBand0ProjSize * kSbHiddenSize],
    const q_data_t (&proj_bias_q610)[kBand0ProjSize],
    hls::stream<q_data_t>& df_coef_stream) {
  #pragma HLS inline off
  static q_data_t noisy_input_local[kBand0InputElementCount];
  static q_data_t fb_output_local[kBand0InputElementCount];
  static q_data_t layer0_hx_state_q610[kBand0StateElementCount];
  static q_data_t layer0_cx_state_q610[kBand0StateElementCount];
  static q_data_t layer1_hx_state_q610[kBand0StateElementCount];
  static q_data_t layer1_cx_state_q610[kBand0StateElementCount];
  static q_data_t df_coef_local[kBand0DfCoefElementCount];

  StreamToPointerQ610<kBand0InputElementCount>(noisy_input_stream, noisy_input_local);
  StreamToPointerQ610<kBand0InputElementCount>(fb_output_stream, fb_output_local);

  BandWeightsQ610 weights_q610{};
  weights_q610.layers[0] = {
      layer0_weight_ih_q610,
      layer0_weight_hh_q610,
      layer0_bias_ih_q610,
      layer0_bn_mul_q610,
      layer0_bn_add_q610,
  };
  weights_q610.layers[1] = {
      layer1_weight_ih_q610,
      layer1_weight_hh_q610,
      layer1_bias_ih_q610,
      layer1_bn_mul_q610,
      layer1_bn_add_q610,
  };
  weights_q610.proj = {
      proj_weight_q610,
      proj_bias_q610,
  };

  RunBand0StreamingCoreQ610(
      noisy_input_local,
      fb_output_local,
      weights_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      df_coef_local);

  PointerToStreamQ610<kBand0DfCoefElementCount>(df_coef_local, df_coef_stream);
}

void StoreBand0OutputQ610(hls::stream<q_data_t>& df_coef_stream, q_data_t* df_coef_q610) {
  #pragma HLS inline off
  StreamToPointerQ610<kBand0DfCoefElementCount>(df_coef_stream, df_coef_q610);
}

}  // namespace

void RunBand0Q610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610) {
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
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610) {
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
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610) {
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

void SubbandBand0TopQ610(
    const q_data_t noisy_input_q610[kBand0InputElementCount],
    const q_data_t fb_output_q610[kBand0InputElementCount],
    const q_data_t layer0_weight_ih_q610[kSbHiddenSize * kBand0PackedInputSize],
    const q_data_t layer0_weight_hh_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer0_bias_ih_q610[2 * kSbHiddenSize],
    const q_data_t layer0_bn_mul_q610[kSbHiddenSize],
    const q_data_t layer0_bn_add_q610[kSbHiddenSize],
    const q_data_t layer1_weight_ih_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer1_weight_hh_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer1_bias_ih_q610[2 * kSbHiddenSize],
    const q_data_t layer1_bn_mul_q610[kSbHiddenSize],
    const q_data_t layer1_bn_add_q610[kSbHiddenSize],
    const q_data_t proj_weight_q610[kBand0ProjSize * kSbHiddenSize],
    const q_data_t proj_bias_q610[kBand0ProjSize],
    q_data_t df_coef_q610[kBand0DfCoefElementCount]) {
  #pragma HLS INTERFACE m_axi port=noisy_input_q610 bundle=gmem0 depth=kBand0InputElementCount
  #pragma HLS INTERFACE m_axi port=fb_output_q610 bundle=gmem1 depth=kBand0InputElementCount
  #pragma HLS INTERFACE m_axi port=layer0_weight_ih_q610 bundle=weights0 depth=(kSbHiddenSize * kBand0PackedInputSize)
  #pragma HLS INTERFACE m_axi port=layer0_weight_hh_q610 bundle=weights0 depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer0_bias_ih_q610 bundle=weights0 depth=(2 * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer0_bn_mul_q610 bundle=weights0 depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer0_bn_add_q610 bundle=weights0 depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer1_weight_ih_q610 bundle=weights1 depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_weight_hh_q610 bundle=weights1 depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_bias_ih_q610 bundle=weights1 depth=(2 * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_bn_mul_q610 bundle=weights1 depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer1_bn_add_q610 bundle=weights1 depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=proj_weight_q610 bundle=weights2 depth=(kBand0ProjSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=proj_bias_q610 bundle=weights2 depth=kBand0ProjSize
  #pragma HLS INTERFACE m_axi port=df_coef_q610 bundle=gmem2 depth=kBand0DfCoefElementCount
  #pragma HLS INTERFACE s_axilite port=return bundle=control

  q_data_t layer0_weight_ih_local[kSbHiddenSize * kBand0PackedInputSize];
  q_data_t layer0_weight_hh_local[kSbHiddenSize * kSbHiddenSize];
  q_data_t layer0_bias_ih_local[2 * kSbHiddenSize];
  q_data_t layer0_bn_mul_local[kSbHiddenSize];
  q_data_t layer0_bn_add_local[kSbHiddenSize];
  q_data_t layer1_weight_ih_local[kSbHiddenSize * kSbHiddenSize];
  q_data_t layer1_weight_hh_local[kSbHiddenSize * kSbHiddenSize];
  q_data_t layer1_bias_ih_local[2 * kSbHiddenSize];
  q_data_t layer1_bn_mul_local[kSbHiddenSize];
  q_data_t layer1_bn_add_local[kSbHiddenSize];
  q_data_t proj_weight_local[kBand0ProjSize * kSbHiddenSize];
  q_data_t proj_bias_local[kBand0ProjSize];

  LoadBand0WeightsQ610(
      layer0_weight_ih_q610,
      layer0_weight_hh_q610,
      layer0_bias_ih_q610,
      layer0_bn_mul_q610,
      layer0_bn_add_q610,
      layer1_weight_ih_q610,
      layer1_weight_hh_q610,
      layer1_bias_ih_q610,
      layer1_bn_mul_q610,
      layer1_bn_add_q610,
      proj_weight_q610,
      proj_bias_q610,
      layer0_weight_ih_local,
      layer0_weight_hh_local,
      layer0_bias_ih_local,
      layer0_bn_mul_local,
      layer0_bn_add_local,
      layer1_weight_ih_local,
      layer1_weight_hh_local,
      layer1_bias_ih_local,
      layer1_bn_mul_local,
      layer1_bn_add_local,
      proj_weight_local,
      proj_bias_local);

  hls::stream<q_data_t> noisy_input_stream;
  hls::stream<q_data_t> fb_output_stream;
  hls::stream<q_data_t> df_coef_stream;

  #pragma HLS dataflow
  LoadBand0InputsQ610(noisy_input_q610, fb_output_q610, noisy_input_stream, fb_output_stream);
  ComputeBand0FromStreamsQ610(
      noisy_input_stream,
      fb_output_stream,
      layer0_weight_ih_local,
      layer0_weight_hh_local,
      layer0_bias_ih_local,
      layer0_bn_mul_local,
      layer0_bn_add_local,
      layer1_weight_ih_local,
      layer1_weight_hh_local,
      layer1_bias_ih_local,
      layer1_bn_mul_local,
      layer1_bn_add_local,
      proj_weight_local,
      proj_bias_local,
      df_coef_stream);
  StoreBand0OutputQ610(df_coef_stream, df_coef_q610);
}

}  // namespace subband_q610
