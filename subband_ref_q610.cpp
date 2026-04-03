
#include <array>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <limits>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace subband_q610 {

// -----------------------------------------------------------------------------
// Fixed-point configuration
// -----------------------------------------------------------------------------
// Q6.10 signed fixed-point:
//   total bits      = 16
//   fractional bits = 10
//   scale           = 1024
//   representable range is approximately [-32.0, 31.999]
constexpr int kQFrac = 10;
constexpr int kQScale = 1 << kQFrac;
constexpr int16_t kQZero = 0;
constexpr int16_t kQOne = static_cast<int16_t>(1 << kQFrac);

constexpr int kNumBands = 3;
constexpr int kNumChannels = 1;
constexpr int kNumSpks = 1;
constexpr int kNumFreqs = 256;      // noisy_mag[..., :-1, :] => 256 bins
constexpr int kSbHiddenSize = 224;  // baseline_m.toml
constexpr int kSbNumLayers = 2;     // baseline_m.toml
constexpr float kBnEpsFloat = 1.0e-5f;  // kept in float because Q6.10 cannot represent 1e-5

struct BandSpec {
  int band_index;
  int lower_cutoff_freq;
  int upper_cutoff_freq;
  int ctr_freq;
  int nbr_freq;
  int df_order;
  int num_subbands;
  int noisy_freq_size;
  int fb_freq_size;
  int packed_input_size;
  int proj_size;
};

struct GSUWeightsQ610 {
  // shared_weights=true baseline:
  // weight_ih: [hidden_size, input_size]
  // weight_hh: [hidden_size, hidden_size]
  // bias_ih  : [2 * hidden_size]
  std::vector<int16_t> weight_ih;
  std::vector<int16_t> weight_hh;
  std::vector<int16_t> bias_ih;

  // BatchNorm1d eval parameters in Q6.10.
  // running_mean, running_var, gamma(weight), beta(bias)
  std::vector<int16_t> bn_running_mean;
  std::vector<int16_t> bn_running_var;
  std::vector<int16_t> bn_weight;
  std::vector<int16_t> bn_bias;
};

struct LinearWeightsQ610 {
  // weight: [out_features, in_features]
  std::vector<int16_t> weight;
  std::vector<int16_t> bias;
};

struct BandWeightsQ610 {
  std::array<GSUWeightsQ610, kSbNumLayers> layers;
  LinearWeightsQ610 proj;
};

struct TensorBufferQ610 {
  std::vector<int16_t> data;
  std::vector<int> shape;
};

struct BandForwardResultQ610 {
  TensorBufferQ610 noisy_subbands;
  TensorBufferQ610 fb_subbands;
  TensorBufferQ610 sb_input;
  TensorBufferQ610 packed_input;
  TensorBufferQ610 df_coef;
  std::vector<TensorBufferQ610> layer_outputs;
};

const std::array<BandSpec, kNumBands> kBandSpecs = {{
    {0,   0,  32,  4, 15, 5, 8,  34,  4,  38,  40},
    {1,  32, 128, 32, 15, 3, 3,  62, 32,  94, 192},
    {2, 128, 256, 64, 15, 1, 2,  94, 64, 158, 128},
}};

// -----------------------------------------------------------------------------
// Fixed-point helpers
// -----------------------------------------------------------------------------
inline int16_t SaturateInt16(int64_t value) {
  if (value > static_cast<int64_t>(std::numeric_limits<int16_t>::max())) {
    return std::numeric_limits<int16_t>::max();
  }
  if (value < static_cast<int64_t>(std::numeric_limits<int16_t>::min())) {
    return std::numeric_limits<int16_t>::min();
  }
  return static_cast<int16_t>(value);
}

inline int64_t RoundShiftRight(int64_t value, int shift_bits) {
  if (shift_bits <= 0) {
    return value;
  }
  const int64_t half = static_cast<int64_t>(1) << (shift_bits - 1);
  if (value >= 0) {
    return (value + half) >> shift_bits;
  }
  return -(((-value) + half) >> shift_bits);
}

inline int16_t FloatToQ610(float value) {
  const float scaled = value * static_cast<float>(kQScale);
  const int64_t rounded = (scaled >= 0.0f)
      ? static_cast<int64_t>(scaled + 0.5f)
      : static_cast<int64_t>(scaled - 0.5f);
  return SaturateInt16(rounded);
}

inline float Q610ToFloat(int16_t value) {
  return static_cast<float>(value) / static_cast<float>(kQScale);
}

inline int16_t MulQ610(int16_t lhs, int16_t rhs) {
  const int64_t product_q20 = static_cast<int64_t>(lhs) * static_cast<int64_t>(rhs);
  return SaturateInt16(RoundShiftRight(product_q20, kQFrac));
}

inline int16_t AddQ610(int16_t lhs, int16_t rhs) {
  return SaturateInt16(static_cast<int64_t>(lhs) + static_cast<int64_t>(rhs));
}

inline int16_t SubQ610(int16_t lhs, int16_t rhs) {
  return SaturateInt16(static_cast<int64_t>(lhs) - static_cast<int64_t>(rhs));
}

std::vector<int16_t> QuantizeVectorQ610(const std::vector<float>& values) {
  std::vector<int16_t> result(values.size(), 0);
  for (std::size_t index = 0; index < values.size(); ++index) {
    result[index] = FloatToQ610(values[index]);
  }
  return result;
}

int16_t StepActivationQ610(int16_t input_value) {
  return input_value >= 0 ? kQOne : kQZero;
}

// Host-reference sigmoid for the Q6.10 model.
// Input/Output are Q6.10, but exp is evaluated in float to keep the first
// reference implementation faithful. Replace this helper with LUT/PWL after
// the fixed-point reference passes validation.
int16_t SigmoidQ610HostRef(int16_t input_value_q610) {
  const double input_value = static_cast<double>(Q610ToFloat(input_value_q610));
  const double sigmoid_value = 1.0 / (1.0 + std::exp(-input_value));
  return FloatToQ610(static_cast<float>(sigmoid_value));
}

// Host-reference BatchNorm eval for the Q6.10 model.
// The tensor and BN parameters are all quantized to Q6.10, but sqrt is still
// evaluated in float. This keeps the reference path simple and deterministic.
int16_t BatchNormEvalQ610HostRef(int16_t input_value_q610, const GSUWeightsQ610& weights, int hidden_index) {
  if (weights.bn_running_mean.empty()) {
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

// -----------------------------------------------------------------------------
// Index helpers
// -----------------------------------------------------------------------------
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

inline std::size_t PackedIndex(
    int sample_index,
    int feature_index,
    int frame_index,
    int feature_size,
    int num_frames) {
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

// -----------------------------------------------------------------------------
// Validation helpers
// -----------------------------------------------------------------------------
void ValidateBatchAndFrames(int batch_size, int num_frames) {
  if (batch_size <= 0) {
    throw std::invalid_argument("batch_size must be positive.");
  }
  if (num_frames <= 0) {
    throw std::invalid_argument("num_frames must be positive.");
  }
}

template <typename T>
void ValidatePointer(const T* pointer, const char* name) {
  if (pointer == nullptr) {
    throw std::invalid_argument(std::string(name) + " must not be null.");
  }
}

void ValidateSize(std::size_t actual, std::size_t expected, const char* name) {
  if (actual != expected) {
    throw std::invalid_argument(
        std::string(name) + " has an invalid size. expected=" + std::to_string(expected) +
        " actual=" + std::to_string(actual));
  }
}

void ValidateBandWeights(const BandSpec& spec, const BandWeightsQ610& weights) {
  ValidateSize(
      weights.layers[0].weight_ih.size(),
      static_cast<std::size_t>(kSbHiddenSize * spec.packed_input_size),
      "layer0.weight_ih");
  ValidateSize(
      weights.layers[0].weight_hh.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer0.weight_hh");
  ValidateSize(
      weights.layers[0].bias_ih.size(),
      static_cast<std::size_t>(2 * kSbHiddenSize),
      "layer0.bias_ih");

  ValidateSize(
      weights.layers[1].weight_ih.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer1.weight_ih");
  ValidateSize(
      weights.layers[1].weight_hh.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer1.weight_hh");
  ValidateSize(
      weights.layers[1].bias_ih.size(),
      static_cast<std::size_t>(2 * kSbHiddenSize),
      "layer1.bias_ih");

  ValidateSize(
      weights.proj.weight.size(),
      static_cast<std::size_t>(spec.proj_size * kSbHiddenSize),
      "proj.weight");
  ValidateSize(
      weights.proj.bias.size(),
      static_cast<std::size_t>(spec.proj_size),
      "proj.bias");

  for (int layer_index = 0; layer_index < kSbNumLayers; ++layer_index) {
    const GSUWeightsQ610& layer_weights = weights.layers[layer_index];
    if (!layer_weights.bn_running_mean.empty()) {
      ValidateSize(
          layer_weights.bn_running_mean.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.running_mean");
      ValidateSize(
          layer_weights.bn_running_var.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.running_var");
      ValidateSize(
          layer_weights.bn_weight.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.weight");
      ValidateSize(
          layer_weights.bn_bias.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.bias");
    }
  }
}

TensorBufferQ610 MakeTensorBufferQ610(std::vector<int16_t> data, std::vector<int> shape) {
  TensorBufferQ610 tensor;
  tensor.data = std::move(data);
  tensor.shape = std::move(shape);
  return tensor;
}

// -----------------------------------------------------------------------------
// Core data movement blocks: identical logic, fixed-point payload
// -----------------------------------------------------------------------------
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
  if (band_index < 0 || band_index >= kNumBands) {
    throw std::out_of_range("Invalid band index.");
  }
  return kBandSpecs[band_index];
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

std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames) {
  return static_cast<std::size_t>(batch_size) * spec.df_order * kNumSpks *
      (spec.num_subbands * spec.ctr_freq) * num_frames * 2;
}

void FreqUnfoldImplQ610(
    const BandSpec& spec,
    int nbr_freq,
    const int16_t* input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(input_q610, "input_q610");
  ValidatePointer(output_q610, "output_q610");

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

void ConcatImplQ610(
    const BandSpec& spec,
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(noisy_subbands_q610, "noisy_subbands_q610");
  ValidatePointer(fb_subbands_q610, "fb_subbands_q610");
  ValidatePointer(output_q610, "output_q610");

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

void PackImplQ610(
    const BandSpec& spec,
    const int16_t* sb_input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(sb_input_q610, "sb_input_q610");
  ValidatePointer(output_q610, "output_q610");

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

std::vector<int16_t> PackedToSequenceQ610(
    const std::vector<int16_t>& packed_input_q610,
    int batch_subbands,
    int feature_size,
    int num_frames) {
  std::vector<int16_t> sequence_input_q610(
      static_cast<std::size_t>(num_frames) * batch_subbands * feature_size,
      kQZero);

  for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
    for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        sequence_input_q610[SequenceIndex(frame_index, sample_index, feature_index, batch_subbands, feature_size)] =
            packed_input_q610[PackedIndex(sample_index, feature_index, frame_index, feature_size, num_frames)];
      }
    }
  }

  return sequence_input_q610;
}

// -----------------------------------------------------------------------------
// Core arithmetic blocks
// -----------------------------------------------------------------------------
std::vector<int16_t> RunGSULayerQ610(
    const std::vector<int16_t>& sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights) {
  std::vector<int16_t> sequence_output_q610(
      static_cast<std::size_t>(num_frames) * batch_subbands * kSbHiddenSize,
      kQZero);
  std::vector<int16_t> hx_q610(static_cast<std::size_t>(batch_subbands) * kSbHiddenSize, kQZero);
  std::vector<int16_t> cx_q610(static_cast<std::size_t>(batch_subbands) * kSbHiddenSize, kQZero);

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const int16_t* input_ptr = &sequence_input_q610[input_offset];
      std::array<int16_t, kSbHiddenSize> prev_hx_q610{};
      std::array<int16_t, kSbHiddenSize> prev_cx_q610{};
      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        prev_hx_q610[hidden_index] = hx_q610[state_offset + hidden_index];
        prev_cx_q610[hidden_index] = cx_q610[state_offset + hidden_index];
      }

      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        const int16_t* weight_ih_ptr =
            &weights.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
        const int16_t* weight_hh_ptr =
            &weights.weight_hh[static_cast<std::size_t>(hidden_index) * kSbHiddenSize];

        // shared_weights=true:
        // common_q20 = dot(input, weight_ih) + dot(hx, weight_hh)
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

        cx_q610[state_offset + hidden_index] = cy_q610;
        hx_q610[state_offset + hidden_index] = hy_q610;
        sequence_output_q610[SequenceIndex(frame_index, sample_index, hidden_index, batch_subbands, kSbHiddenSize)] =
            hy_q610;
      }
    }
  }

  return sequence_output_q610;
}

std::vector<int16_t> RunProjectionQ610(
    const std::vector<int16_t>& sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights) {
  std::vector<int16_t> sequence_output_q610(
      static_cast<std::size_t>(num_frames) * batch_subbands * proj_size,
      kQZero);

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

  return sequence_output_q610;
}

TensorBufferQ610 MakeLayerTensorQ610(const std::vector<int16_t>& data, int dim0, int dim1, int dim2) {
  return MakeTensorBufferQ610(data, {dim0, dim1, dim2});
}

void ProjectToDfCoefQ610(
    const BandSpec& spec,
    const std::vector<int16_t>& projected_sequence_q610,
    int batch_size,
    int num_frames,
    TensorBufferQ610* output_tensor_q610) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const int total_freqs = spec.num_subbands * spec.ctr_freq;
  output_tensor_q610->shape = {batch_size, spec.df_order, kNumSpks, total_freqs, num_frames, 2};
  output_tensor_q610->data.assign(GetDfCoefElementCount(spec, batch_size, num_frames), kQZero);

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int complex_index = 0; complex_index < 2; ++complex_index) {
        for (int ctr_index = 0; ctr_index < spec.ctr_freq; ++ctr_index) {
          for (int df_index = 0; df_index < spec.df_order; ++df_index) {
            const int feature_index = ((complex_index * spec.ctr_freq + ctr_index) * spec.df_order) + df_index;
            const int merged_freq_index = subband_index * spec.ctr_freq + ctr_index;
            for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
              output_tensor_q610->data[DfCoefIndex(
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

// -----------------------------------------------------------------------------
// Public band-level runners
// -----------------------------------------------------------------------------
BandForwardResultQ610 RunBandImplQ610(
    const BandSpec& spec,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    bool capture_layer_outputs) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(noisy_input_q610, "noisy_input_q610");
  ValidatePointer(fb_output_q610, "fb_output_q610");
  ValidateBandWeights(spec, weights_q610);

  BandForwardResultQ610 result;

  result.noisy_subbands.shape = {batch_size, spec.num_subbands, kNumChannels, spec.noisy_freq_size, num_frames};
  result.noisy_subbands.data.assign(GetNoisySubbandsElementCount(spec, batch_size, num_frames), kQZero);
  FreqUnfoldImplQ610(
      spec,
      spec.nbr_freq,
      noisy_input_q610,
      batch_size,
      num_frames,
      result.noisy_subbands.data.data());

  result.fb_subbands.shape = {batch_size, spec.num_subbands, kNumChannels, spec.fb_freq_size, num_frames};
  result.fb_subbands.data.assign(GetFbSubbandsElementCount(spec, batch_size, num_frames), kQZero);
  FreqUnfoldImplQ610(
      spec,
      0,
      fb_output_q610,
      batch_size,
      num_frames,
      result.fb_subbands.data.data());

  result.sb_input.shape = {batch_size, spec.num_subbands, kNumChannels, spec.packed_input_size, num_frames};
  result.sb_input.data.assign(GetSbInputElementCount(spec, batch_size, num_frames), kQZero);
  ConcatImplQ610(
      spec,
      result.noisy_subbands.data.data(),
      result.fb_subbands.data.data(),
      batch_size,
      num_frames,
      result.sb_input.data.data());

  result.packed_input.shape = {batch_size * spec.num_subbands, spec.packed_input_size, num_frames};
  result.packed_input.data.assign(GetPackedInputElementCount(spec, batch_size, num_frames), kQZero);
  PackImplQ610(spec, result.sb_input.data.data(), batch_size, num_frames, result.packed_input.data.data());

  const int batch_subbands = batch_size * spec.num_subbands;
  std::vector<int16_t> sequence_input_q610 =
      PackedToSequenceQ610(result.packed_input.data, batch_subbands, spec.packed_input_size, num_frames);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(
        MakeLayerTensorQ610(sequence_input_q610, num_frames, batch_subbands, spec.packed_input_size));
  }

  std::vector<int16_t> layer0_output_q610 =
      RunGSULayerQ610(sequence_input_q610, batch_subbands, num_frames, spec.packed_input_size, weights_q610.layers[0]);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensorQ610(layer0_output_q610, num_frames, batch_subbands, kSbHiddenSize));
  }

  std::vector<int16_t> layer1_output_q610 =
      RunGSULayerQ610(layer0_output_q610, batch_subbands, num_frames, kSbHiddenSize, weights_q610.layers[1]);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensorQ610(layer1_output_q610, num_frames, batch_subbands, kSbHiddenSize));
  }

  std::vector<int16_t> projected_output_q610 =
      RunProjectionQ610(layer1_output_q610, batch_subbands, num_frames, spec.proj_size, weights_q610.proj);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensorQ610(projected_output_q610, num_frames, batch_subbands, spec.proj_size));
  }

  ProjectToDfCoefQ610(spec, projected_output_q610, batch_size, num_frames, &result.df_coef);
  return result;
}

void FreqUnfoldBand0NoisyQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(0), GetBandSpec(0).nbr_freq, input_q610, batch_size, num_frames, output_q610);
}

void FreqUnfoldBand1NoisyQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(1), GetBandSpec(1).nbr_freq, input_q610, batch_size, num_frames, output_q610);
}

void FreqUnfoldBand2NoisyQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(2), GetBandSpec(2).nbr_freq, input_q610, batch_size, num_frames, output_q610);
}

void FreqUnfoldBand0FullbandQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(0), 0, input_q610, batch_size, num_frames, output_q610);
}

void FreqUnfoldBand1FullbandQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(1), 0, input_q610, batch_size, num_frames, output_q610);
}

void FreqUnfoldBand2FullbandQ610(const int16_t* input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  FreqUnfoldImplQ610(GetBandSpec(2), 0, input_q610, batch_size, num_frames, output_q610);
}

void ConcatBand0Q610(
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ConcatImplQ610(GetBandSpec(0), noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, output_q610);
}

void ConcatBand1Q610(
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ConcatImplQ610(GetBandSpec(1), noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, output_q610);
}

void ConcatBand2Q610(
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610) {
  ConcatImplQ610(GetBandSpec(2), noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, output_q610);
}

void PackBand0InputQ610(const int16_t* sb_input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  PackImplQ610(GetBandSpec(0), sb_input_q610, batch_size, num_frames, output_q610);
}

void PackBand1InputQ610(const int16_t* sb_input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  PackImplQ610(GetBandSpec(1), sb_input_q610, batch_size, num_frames, output_q610);
}

void PackBand2InputQ610(const int16_t* sb_input_q610, int batch_size, int num_frames, int16_t* output_q610) {
  PackImplQ610(GetBandSpec(2), sb_input_q610, batch_size, num_frames, output_q610);
}

BandForwardResultQ610 RunBand0Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    bool capture_layer_outputs) {
  return RunBandImplQ610(
      GetBandSpec(0),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      capture_layer_outputs);
}

BandForwardResultQ610 RunBand1Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    bool capture_layer_outputs) {
  return RunBandImplQ610(
      GetBandSpec(1),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      capture_layer_outputs);
}

BandForwardResultQ610 RunBand2Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    bool capture_layer_outputs) {
  return RunBandImplQ610(
      GetBandSpec(2),
      noisy_input_q610,
      fb_output_q610,
      batch_size,
      num_frames,
      weights_q610,
      capture_layer_outputs);
}

std::array<BandForwardResultQ610, kNumBands> RunSubbandModelQ610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const std::array<BandWeightsQ610, kNumBands>& weights_q610,
    bool capture_layer_outputs) {
  return {{
      RunBand0Q610(noisy_input_q610, fb_output_q610, batch_size, num_frames, weights_q610[0], capture_layer_outputs),
      RunBand1Q610(noisy_input_q610, fb_output_q610, batch_size, num_frames, weights_q610[1], capture_layer_outputs),
      RunBand2Q610(noisy_input_q610, fb_output_q610, batch_size, num_frames, weights_q610[2], capture_layer_outputs),
  }};
}

}  // namespace subband_q610
