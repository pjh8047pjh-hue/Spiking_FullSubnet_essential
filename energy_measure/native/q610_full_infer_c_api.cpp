#include "subband_ref_q610.hpp"

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <exception>
#include <limits>
#include <memory>
#include <stdexcept>
#include <vector>

#if defined(__AVX2__)
#include <immintrin.h>
#endif

namespace {

constexpr int kNumBands = 3;
constexpr int kNumFreqs = 256;
constexpr int kNumStftFreqs = 257;
constexpr int kNfft = 512;
constexpr int kHopLength = 128;
constexpr int kFullInputSize = 64;
constexpr int kFullHiddenSize = 320;
constexpr int kFullProjSize = 64;
constexpr int kSbHiddenSize = 224;
constexpr int kSigmoidLutSize = 1 << 16;
constexpr float kLayerNormEps = 1.0e-5f;

struct ComplexValue {
  double real = 0.0;
  double imag = 0.0;
};

struct InferBandSpec {
  int lower = 0;
  int upper = 0;
  int ctr = 0;
  int nbr = 0;
  int df_order = 0;

  int num_subbands() const {
    return (upper - lower) / ctr;
  }

  int noisy_freq_size() const {
    return ctr + (2 * nbr);
  }

  int packed_input_size() const {
    return noisy_freq_size() + ctr;
  }

  int proj_size() const {
    return 2 * ctr * df_order;
  }

  int total_freqs() const {
    return num_subbands() * ctr;
  }
};

struct BnParams {
  bool enabled = false;
  std::vector<double> mean;
  std::vector<double> denom;
  std::vector<double> gamma;
  std::vector<double> beta;
};

struct OwnedLayer {
  int input_size = 0;
  int hidden_size = 0;
  std::vector<int16_t> weight_ih;
  std::vector<int16_t> weight_hh;
  std::vector<int16_t> bias_ih;
  std::vector<int16_t> bn_running_mean;
  std::vector<int16_t> bn_running_var;
  std::vector<int16_t> bn_weight;
  std::vector<int16_t> bn_bias;
  BnParams bn;
  std::vector<int64_t> forget_bias_q20;
  std::vector<int64_t> cell_bias_q20;
};

struct OwnedLinear {
  int input_size = 0;
  int output_size = 0;
  std::vector<int16_t> weight;
  std::vector<int16_t> bias;
};

struct OwnedSequence {
  std::array<OwnedLayer, 2> layers;
  OwnedLinear proj;
  std::vector<int16_t> ln_weight;
  std::vector<int16_t> ln_bias;
};

struct Q610InferContext {
  bool use_pre_layer_norm_fb = false;
  bool use_pre_layer_norm_sb = false;
  std::array<InferBandSpec, kNumBands> bands;
  std::array<int16_t, kSigmoidLutSize> sigmoid_lut{};
  OwnedSequence fullband;
  std::array<OwnedSequence, kNumBands> subbands;

  int allocated_input_length = 0;
  int allocated_num_frames = 0;
  std::array<float, kNfft> window{};
  std::vector<ComplexValue> fft_buffer;
  std::vector<float> noisy_real;
  std::vector<float> noisy_imag;
  std::vector<int16_t> noisy_mag_q610;
  std::vector<int16_t> full_input;
  std::vector<int16_t> fb_layer0_hx;
  std::vector<int16_t> fb_layer0_cx;
  std::vector<int16_t> fb_layer0_output;
  std::vector<int16_t> fb_layer1_hx;
  std::vector<int16_t> fb_layer1_cx;
  std::vector<int16_t> fb_layer1_output;
  std::vector<int16_t> fb_proj;
  std::vector<int16_t> fb_output;
  std::array<std::vector<int16_t>, kNumBands> sb_sequence_input;
  std::array<std::vector<int16_t>, kNumBands> sb_layer0_hx;
  std::array<std::vector<int16_t>, kNumBands> sb_layer0_cx;
  std::array<std::vector<int16_t>, kNumBands> sb_layer0_output;
  std::array<std::vector<int16_t>, kNumBands> sb_layer1_hx;
  std::array<std::vector<int16_t>, kNumBands> sb_layer1_cx;
  std::array<std::vector<int16_t>, kNumBands> sb_layer1_output;
  std::array<std::vector<int16_t>, kNumBands> sb_df_coef;
  std::vector<float> enhanced_real;
  std::vector<float> enhanced_imag;
  std::vector<double> ola;
  std::vector<double> envelope;
  std::vector<int> active_input_indices;
  std::vector<int> active_recurrent_indices;
};

inline std::size_t TfIndex(int freq_index, int frame_index, int num_frames) {
  return static_cast<std::size_t>(freq_index) * num_frames + frame_index;
}

inline std::size_t SequenceIndex(int frame_index, int sample_index, int feature_index, int num_samples, int feature_size) {
  return static_cast<std::size_t>((frame_index * num_samples + sample_index) * feature_size + feature_index);
}

inline std::size_t DfCoefIndex(
    int df_index,
    int freq_index,
    int frame_index,
    int complex_index,
    int df_order,
    int total_freqs,
    int num_frames) {
  return static_cast<std::size_t>((((df_index * total_freqs + freq_index) * num_frames + frame_index) * 2) +
                                  complex_index);
}

inline std::size_t SigmoidLutIndex(int16_t value) {
  return static_cast<std::size_t>(
      static_cast<int>(value) - static_cast<int>(std::numeric_limits<int16_t>::min()));
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

std::vector<int16_t> CopyInt16(const int16_t* source, std::size_t count) {
  if (source == nullptr) {
    throw std::invalid_argument("null Q6.10 tensor pointer");
  }
  return std::vector<int16_t>(source, source + count);
}

double Q610ToDouble(int16_t value) {
  return static_cast<double>(subband_q610::Q610ToFloat(value));
}

void BuildBnParams(OwnedLayer& layer) {
  layer.bn.enabled = true;
  layer.bn.mean.resize(layer.hidden_size);
  layer.bn.denom.resize(layer.hidden_size);
  layer.bn.gamma.resize(layer.hidden_size);
  layer.bn.beta.resize(layer.hidden_size);
  for (int hidden_index = 0; hidden_index < layer.hidden_size; ++hidden_index) {
    layer.bn.mean[hidden_index] = Q610ToDouble(layer.bn_running_mean[hidden_index]);
    const double var = Q610ToDouble(layer.bn_running_var[hidden_index]);
    layer.bn.denom[hidden_index] = std::sqrt(var + static_cast<double>(subband_q610::kBnEpsFloat));
    layer.bn.gamma[hidden_index] = Q610ToDouble(layer.bn_weight[hidden_index]);
    layer.bn.beta[hidden_index] = Q610ToDouble(layer.bn_bias[hidden_index]);
  }
}

void PrepareLayer(OwnedLayer& layer) {
  BuildBnParams(layer);
  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;
  layer.forget_bias_q20.resize(layer.hidden_size);
  layer.cell_bias_q20.resize(layer.hidden_size);
  for (int hidden_index = 0; hidden_index < layer.hidden_size; ++hidden_index) {
    layer.forget_bias_q20[hidden_index] = static_cast<int64_t>(layer.bias_ih[hidden_index]) * q_scale_q20;
    layer.cell_bias_q20[hidden_index] =
        static_cast<int64_t>(layer.bias_ih[layer.hidden_size + hidden_index]) * q_scale_q20;
  }
}

int16_t BatchNormEvalFast(int16_t input_value_q610, const OwnedLayer& layer, int hidden_index) {
  if (!layer.bn.enabled) {
    return input_value_q610;
  }
  const double x = Q610ToDouble(input_value_q610);
  const double normalized = (x - layer.bn.mean[hidden_index]) / layer.bn.denom[hidden_index];
  return subband_q610::FloatToQ610(
      static_cast<float>((layer.bn.gamma[hidden_index] * normalized) + layer.bn.beta[hidden_index]));
}

void InitializeSigmoidLut(Q610InferContext& context) {
  const int min_value = static_cast<int>(std::numeric_limits<int16_t>::min());
  const int max_value = static_cast<int>(std::numeric_limits<int16_t>::max());
  for (int value = min_value; value <= max_value; ++value) {
    context.sigmoid_lut[static_cast<std::size_t>(value - min_value)] =
        subband_q610::SigmoidQ610HostRef(static_cast<int16_t>(value));
  }
}

void InitializeWindow(Q610InferContext& context) {
  constexpr double pi = 3.141592653589793238462643383279502884;
  for (int index = 0; index < kNfft; ++index) {
    context.window[static_cast<std::size_t>(index)] =
        static_cast<float>(0.5 * (1.0 - std::cos((2.0 * pi * index) / kNfft)));
  }
}

void EnsureBuffers(Q610InferContext& context, int input_length, int num_frames) {
  if (context.allocated_input_length == input_length && context.allocated_num_frames == num_frames) {
    return;
  }
  context.allocated_input_length = input_length;
  context.allocated_num_frames = num_frames;
  context.fft_buffer.resize(kNfft);
  context.noisy_real.resize(static_cast<std::size_t>(kNumStftFreqs) * num_frames);
  context.noisy_imag.resize(static_cast<std::size_t>(kNumStftFreqs) * num_frames);
  context.noisy_mag_q610.resize(static_cast<std::size_t>(kNumFreqs) * num_frames);
  context.full_input.resize(static_cast<std::size_t>(num_frames) * kFullInputSize);
  context.fb_layer0_hx.resize(kFullHiddenSize);
  context.fb_layer0_cx.resize(kFullHiddenSize);
  context.fb_layer0_output.resize(static_cast<std::size_t>(num_frames) * kFullHiddenSize);
  context.fb_layer1_hx.resize(kFullHiddenSize);
  context.fb_layer1_cx.resize(kFullHiddenSize);
  context.fb_layer1_output.resize(static_cast<std::size_t>(num_frames) * kFullHiddenSize);
  context.fb_proj.resize(static_cast<std::size_t>(num_frames) * kFullProjSize);
  context.fb_output.resize(static_cast<std::size_t>(kNumFreqs) * num_frames);
  context.enhanced_real.resize(static_cast<std::size_t>(kNumStftFreqs) * num_frames);
  context.enhanced_imag.resize(static_cast<std::size_t>(kNumStftFreqs) * num_frames);
  context.ola.resize(static_cast<std::size_t>(input_length) + kNfft);
  context.envelope.resize(static_cast<std::size_t>(input_length) + kNfft);

  for (int band_index = 0; band_index < kNumBands; ++band_index) {
    const InferBandSpec& spec = context.bands[static_cast<std::size_t>(band_index)];
    const int batch_subbands = spec.num_subbands();
    context.sb_sequence_input[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(num_frames) * batch_subbands * spec.packed_input_size());
    context.sb_layer0_hx[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(batch_subbands) * kSbHiddenSize);
    context.sb_layer0_cx[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(batch_subbands) * kSbHiddenSize);
    context.sb_layer0_output[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(num_frames) * batch_subbands * kSbHiddenSize);
    context.sb_layer1_hx[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(batch_subbands) * kSbHiddenSize);
    context.sb_layer1_cx[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(batch_subbands) * kSbHiddenSize);
    context.sb_layer1_output[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(num_frames) * batch_subbands * kSbHiddenSize);
    context.sb_df_coef[static_cast<std::size_t>(band_index)].resize(
        static_cast<std::size_t>(spec.df_order) * spec.total_freqs() * num_frames * 2);
  }

  context.active_input_indices.reserve(kFullHiddenSize);
  context.active_recurrent_indices.reserve(kFullHiddenSize);
}

void Fft(std::vector<ComplexValue>& values, bool inverse) {
  const int n = static_cast<int>(values.size());
  for (int i = 1, j = 0; i < n; ++i) {
    int bit = n >> 1;
    for (; j & bit; bit >>= 1) {
      j ^= bit;
    }
    j ^= bit;
    if (i < j) {
      std::swap(values[static_cast<std::size_t>(i)], values[static_cast<std::size_t>(j)]);
    }
  }

  constexpr double pi = 3.141592653589793238462643383279502884;
  for (int len = 2; len <= n; len <<= 1) {
    const double angle = (inverse ? 2.0 : -2.0) * pi / len;
    const double wlen_real = std::cos(angle);
    const double wlen_imag = std::sin(angle);
    for (int i = 0; i < n; i += len) {
      double w_real = 1.0;
      double w_imag = 0.0;
      for (int j = 0; j < len / 2; ++j) {
        ComplexValue& u = values[static_cast<std::size_t>(i + j)];
        ComplexValue& v = values[static_cast<std::size_t>(i + j + (len / 2))];
        const double v_real = v.real * w_real - v.imag * w_imag;
        const double v_imag = v.real * w_imag + v.imag * w_real;
        const double u_real = u.real;
        const double u_imag = u.imag;
        u.real = u_real + v_real;
        u.imag = u_imag + v_imag;
        v.real = u_real - v_real;
        v.imag = u_imag - v_imag;
        const double next_w_real = w_real * wlen_real - w_imag * wlen_imag;
        const double next_w_imag = w_real * wlen_imag + w_imag * wlen_real;
        w_real = next_w_real;
        w_imag = next_w_imag;
      }
    }
  }

  if (inverse) {
    for (ComplexValue& value : values) {
      value.real /= n;
      value.imag /= n;
    }
  }
}

void RunStft(Q610InferContext& context, const float* input, int input_length, int num_frames) {
  const int center_pad = kNfft / 2;
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int n = 0; n < kNfft; ++n) {
      const int source_index = (frame_index * kHopLength) + n - center_pad;
      const float sample = (source_index >= 0 && source_index < input_length) ? input[source_index] : 0.0f;
      context.fft_buffer[static_cast<std::size_t>(n)].real =
          static_cast<double>(sample) * context.window[static_cast<std::size_t>(n)];
      context.fft_buffer[static_cast<std::size_t>(n)].imag = 0.0;
    }
    Fft(context.fft_buffer, false);
    for (int freq_index = 0; freq_index < kNumStftFreqs; ++freq_index) {
      const ComplexValue& value = context.fft_buffer[static_cast<std::size_t>(freq_index)];
      context.noisy_real[TfIndex(freq_index, frame_index, num_frames)] = static_cast<float>(value.real);
      context.noisy_imag[TfIndex(freq_index, frame_index, num_frames)] = static_cast<float>(value.imag);
      if (freq_index < kNumFreqs) {
        const double mag = std::sqrt((value.real * value.real) + (value.imag * value.imag));
        context.noisy_mag_q610[TfIndex(freq_index, frame_index, num_frames)] =
            subband_q610::FloatToQ610(static_cast<float>(std::sqrt(mag)));
      }
    }
  }
}

void BuildActiveIndices(const int16_t* values, int size, std::vector<int>& active_indices) {
  active_indices.clear();
  for (int index = 0; index < size; ++index) {
    if (values[index] != subband_q610::kQZero) {
      active_indices.push_back(index);
    }
  }
}

int64_t DotDenseQ610(const int16_t* input, const int16_t* weights, int size) {
#if defined(__AVX2__)
  __m256i acc = _mm256_setzero_si256();
  int index = 0;
  for (; index <= size - 16; index += 16) {
    const __m256i input_values = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(input + index));
    const __m256i weight_values = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(weights + index));
    acc = _mm256_add_epi32(acc, _mm256_madd_epi16(input_values, weight_values));
  }
  alignas(32) int32_t lanes[8];
  _mm256_store_si256(reinterpret_cast<__m256i*>(lanes), acc);
  int64_t sum_q20 = 0;
  for (int lane = 0; lane < 8; ++lane) {
    sum_q20 += lanes[lane];
  }
  for (; index < size; ++index) {
    sum_q20 += static_cast<int64_t>(input[index]) * static_cast<int64_t>(weights[index]);
  }
  return sum_q20;
#else
  int64_t sum_q20 = 0;
  for (int index = 0; index < size; ++index) {
    sum_q20 += static_cast<int64_t>(input[index]) * static_cast<int64_t>(weights[index]);
  }
  return sum_q20;
#endif
}

int64_t DotSpikeSparseQ610(const std::vector<int>& active_indices, const int16_t* weights) {
  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;
  int64_t sum_q20 = 0;
  for (int active_index : active_indices) {
    sum_q20 += static_cast<int64_t>(weights[active_index]) * q_scale_q20;
  }
  return sum_q20;
}

int64_t DotSpikeQ610(
    const int16_t* input,
    const int16_t* weights,
    int size,
    const std::vector<int>& active_indices) {
  if (static_cast<int>(active_indices.size()) <= size / 2) {
    return DotSpikeSparseQ610(active_indices, weights);
  }
  return DotDenseQ610(input, weights, size);
}

void ApplyLayerNormQ610(
    int16_t* sequence,
    int num_frames,
    int num_samples,
    int feature_size,
    const std::vector<int16_t>& weight,
    const std::vector<int16_t>& bias) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < num_samples; ++sample_index) {
      int16_t* values = &sequence[SequenceIndex(frame_index, sample_index, 0, num_samples, feature_size)];
      double mean = 0.0;
      for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
        mean += Q610ToDouble(values[feature_index]);
      }
      mean /= static_cast<double>(feature_size);

      double var = 0.0;
      for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
        const double diff = Q610ToDouble(values[feature_index]) - mean;
        var += diff * diff;
      }
      var /= static_cast<double>(feature_size);
      const double denom = std::sqrt(var + static_cast<double>(kLayerNormEps));

      for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
        const double normalized = (Q610ToDouble(values[feature_index]) - mean) / denom;
        const double gamma = Q610ToDouble(weight[static_cast<std::size_t>(feature_index)]);
        const double beta = Q610ToDouble(bias[static_cast<std::size_t>(feature_index)]);
        values[feature_index] = subband_q610::FloatToQ610(static_cast<float>((normalized * gamma) + beta));
      }
    }
  }
}

void RunGSULayer(
    const Q610InferContext& context,
    const int16_t* sequence_input_q610,
    int num_samples,
    int num_frames,
    int input_size,
    bool input_is_spike,
    const OwnedLayer& layer,
    std::vector<int16_t>& hx_state_q610,
    std::vector<int16_t>& cx_state_q610,
    std::vector<int16_t>& sequence_output_q610,
    std::vector<int>& active_input_indices,
    std::vector<int>& active_recurrent_indices) {
  std::vector<int16_t> prev_hx(static_cast<std::size_t>(layer.hidden_size));
  std::vector<int16_t> prev_cx(static_cast<std::size_t>(layer.hidden_size));

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < num_samples; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * layer.hidden_size;
      const int16_t* input_ptr = &sequence_input_q610[SequenceIndex(
          frame_index, sample_index, 0, num_samples, input_size)];

      for (int hidden_index = 0; hidden_index < layer.hidden_size; ++hidden_index) {
        prev_hx[static_cast<std::size_t>(hidden_index)] = hx_state_q610[state_offset + hidden_index];
        prev_cx[static_cast<std::size_t>(hidden_index)] = cx_state_q610[state_offset + hidden_index];
      }

      if (input_is_spike) {
        BuildActiveIndices(input_ptr, input_size, active_input_indices);
      }
      BuildActiveIndices(prev_hx.data(), layer.hidden_size, active_recurrent_indices);

      for (int hidden_index = 0; hidden_index < layer.hidden_size; ++hidden_index) {
        const int16_t* weight_ih_ptr = &layer.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
        const int16_t* weight_hh_ptr =
            &layer.weight_hh[static_cast<std::size_t>(hidden_index) * layer.hidden_size];

        int64_t common_q20 = input_is_spike
            ? DotSpikeQ610(input_ptr, weight_ih_ptr, input_size, active_input_indices)
            : DotDenseQ610(input_ptr, weight_ih_ptr, input_size);
        common_q20 += DotSpikeQ610(prev_hx.data(), weight_hh_ptr, layer.hidden_size, active_recurrent_indices);

        const int16_t forget_preact_q610 = subband_q610::SaturateInt16(
            subband_q610::RoundShiftRight(common_q20 + layer.forget_bias_q20[hidden_index], subband_q610::kQFrac));
        const int16_t cell_preact_q610 = subband_q610::SaturateInt16(
            subband_q610::RoundShiftRight(common_q20 + layer.cell_bias_q20[hidden_index], subband_q610::kQFrac));

        const int16_t forget_gate_q610 = context.sigmoid_lut[SigmoidLutIndex(forget_preact_q610)];
        const int16_t one_minus_forget_q610 = subband_q610::SubQ610(subband_q610::kQOne, forget_gate_q610);
        const int16_t retained_q610 =
            subband_q610::MulQ610(forget_gate_q610, prev_cx[static_cast<std::size_t>(hidden_index)]);
        const int16_t injected_q610 = subband_q610::MulQ610(one_minus_forget_q610, cell_preact_q610);

        int16_t cy_q610 = subband_q610::AddQ610(retained_q610, injected_q610);
        cy_q610 = BatchNormEvalFast(cy_q610, layer, hidden_index);
        const int16_t hy_q610 = subband_q610::StepActivationQ610(cy_q610);

        cx_state_q610[state_offset + hidden_index] = cy_q610;
        hx_state_q610[state_offset + hidden_index] = hy_q610;
        sequence_output_q610[SequenceIndex(
            frame_index, sample_index, hidden_index, num_samples, layer.hidden_size)] = hy_q610;
      }
    }
  }
}

void RunProjection(
    const int16_t* sequence_input_q610,
    int num_samples,
    int num_frames,
    const OwnedLinear& weights,
    int16_t* output_q610,
    std::vector<int>& active_input_indices) {
  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < num_samples; ++sample_index) {
      const int16_t* input_ptr =
          &sequence_input_q610[SequenceIndex(frame_index, sample_index, 0, num_samples, weights.input_size)];
      BuildActiveIndices(input_ptr, weights.input_size, active_input_indices);
      for (int output_index = 0; output_index < weights.output_size; ++output_index) {
        int64_t sum_q20 = static_cast<int64_t>(weights.bias[output_index]) * q_scale_q20;
        const int16_t* weight_ptr = &weights.weight[static_cast<std::size_t>(output_index) * weights.input_size];
        sum_q20 += DotSpikeQ610(input_ptr, weight_ptr, weights.input_size, active_input_indices);
        output_q610[SequenceIndex(frame_index, sample_index, output_index, num_samples, weights.output_size)] =
            subband_q610::SaturateInt16(subband_q610::RoundShiftRight(sum_q20, subband_q610::kQFrac));
      }
    }
  }
}

void BuildFullbandInput(Q610InferContext& context, int num_frames) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int freq_index = 0; freq_index < kFullInputSize; ++freq_index) {
      context.full_input[SequenceIndex(frame_index, 0, freq_index, 1, kFullInputSize)] =
          context.noisy_mag_q610[TfIndex(freq_index, frame_index, num_frames)];
    }
  }
  if (context.use_pre_layer_norm_fb) {
    ApplyLayerNormQ610(
        context.full_input.data(),
        num_frames,
        1,
        kFullInputSize,
        context.fullband.ln_weight,
        context.fullband.ln_bias);
  }
}

void RunFullband(Q610InferContext& context, int num_frames) {
  BuildFullbandInput(context, num_frames);
  std::fill(context.fb_layer0_hx.begin(), context.fb_layer0_hx.end(), subband_q610::kQZero);
  std::fill(context.fb_layer0_cx.begin(), context.fb_layer0_cx.end(), subband_q610::kQZero);
  std::fill(context.fb_layer1_hx.begin(), context.fb_layer1_hx.end(), subband_q610::kQZero);
  std::fill(context.fb_layer1_cx.begin(), context.fb_layer1_cx.end(), subband_q610::kQZero);

  RunGSULayer(
      context,
      context.full_input.data(),
      1,
      num_frames,
      kFullInputSize,
      false,
      context.fullband.layers[0],
      context.fb_layer0_hx,
      context.fb_layer0_cx,
      context.fb_layer0_output,
      context.active_input_indices,
      context.active_recurrent_indices);
  RunGSULayer(
      context,
      context.fb_layer0_output.data(),
      1,
      num_frames,
      kFullHiddenSize,
      true,
      context.fullband.layers[1],
      context.fb_layer1_hx,
      context.fb_layer1_cx,
      context.fb_layer1_output,
      context.active_input_indices,
      context.active_recurrent_indices);
  RunProjection(
      context.fb_layer1_output.data(),
      1,
      num_frames,
      context.fullband.proj,
      context.fb_proj.data(),
      context.active_input_indices);

  for (int freq_index = 0; freq_index < kNumFreqs; ++freq_index) {
    const int source_freq = freq_index % kFullProjSize;
    for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
      context.fb_output[TfIndex(freq_index, frame_index, num_frames)] =
          context.fb_proj[SequenceIndex(frame_index, 0, source_freq, 1, kFullProjSize)];
    }
  }
}

void BuildSubbandSequenceInput(
    Q610InferContext& context,
    const InferBandSpec& spec,
    int band_index,
    int num_frames) {
  const int batch_subbands = spec.num_subbands();
  std::vector<int16_t>& sequence = context.sb_sequence_input[static_cast<std::size_t>(band_index)];
  const int noisy_freq_size = spec.noisy_freq_size();

  for (int subband_index = 0; subband_index < spec.num_subbands(); ++subband_index) {
    const int center_start = spec.lower + (subband_index * spec.ctr);
    for (int feature_index = 0; feature_index < spec.packed_input_size(); ++feature_index) {
      const bool is_noisy_feature = feature_index < noisy_freq_size;
      int source_freq = 0;
      if (is_noisy_feature) {
        source_freq = ReflectFrequencyIndex(center_start + feature_index - spec.nbr, kNumFreqs);
      } else {
        source_freq = center_start + (feature_index - noisy_freq_size);
      }
      const std::vector<int16_t>& source = is_noisy_feature ? context.noisy_mag_q610 : context.fb_output;
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        sequence[SequenceIndex(frame_index, subband_index, feature_index, batch_subbands, spec.packed_input_size())] =
            source[TfIndex(source_freq, frame_index, num_frames)];
      }
    }
  }

  if (context.use_pre_layer_norm_sb) {
    ApplyLayerNormQ610(
        sequence.data(),
        num_frames,
        batch_subbands,
        spec.packed_input_size(),
        context.subbands[static_cast<std::size_t>(band_index)].ln_weight,
        context.subbands[static_cast<std::size_t>(band_index)].ln_bias);
  }
}

void RunSubband(Q610InferContext& context, int band_index, int num_frames) {
  const InferBandSpec& spec = context.bands[static_cast<std::size_t>(band_index)];
  const int batch_subbands = spec.num_subbands();
  OwnedSequence& sequence = context.subbands[static_cast<std::size_t>(band_index)];

  BuildSubbandSequenceInput(context, spec, band_index, num_frames);

  std::vector<int16_t>& layer0_hx = context.sb_layer0_hx[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& layer0_cx = context.sb_layer0_cx[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& layer0_output = context.sb_layer0_output[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& layer1_hx = context.sb_layer1_hx[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& layer1_cx = context.sb_layer1_cx[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& layer1_output = context.sb_layer1_output[static_cast<std::size_t>(band_index)];
  std::vector<int16_t>& df_coef = context.sb_df_coef[static_cast<std::size_t>(band_index)];

  std::fill(layer0_hx.begin(), layer0_hx.end(), subband_q610::kQZero);
  std::fill(layer0_cx.begin(), layer0_cx.end(), subband_q610::kQZero);
  std::fill(layer1_hx.begin(), layer1_hx.end(), subband_q610::kQZero);
  std::fill(layer1_cx.begin(), layer1_cx.end(), subband_q610::kQZero);

  RunGSULayer(
      context,
      context.sb_sequence_input[static_cast<std::size_t>(band_index)].data(),
      batch_subbands,
      num_frames,
      spec.packed_input_size(),
      false,
      sequence.layers[0],
      layer0_hx,
      layer0_cx,
      layer0_output,
      context.active_input_indices,
      context.active_recurrent_indices);
  RunGSULayer(
      context,
      layer0_output.data(),
      batch_subbands,
      num_frames,
      kSbHiddenSize,
      true,
      sequence.layers[1],
      layer1_hx,
      layer1_cx,
      layer1_output,
      context.active_input_indices,
      context.active_recurrent_indices);

  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const int subband_index = sample_index;
      const int16_t* input_ptr = &layer1_output[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];
      BuildActiveIndices(input_ptr, kSbHiddenSize, context.active_input_indices);
      for (int proj_index = 0; proj_index < spec.proj_size(); ++proj_index) {
        int64_t sum_q20 = static_cast<int64_t>(sequence.proj.bias[proj_index]) * q_scale_q20;
        const int16_t* weight_ptr = &sequence.proj.weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        sum_q20 += DotSpikeQ610(input_ptr, weight_ptr, kSbHiddenSize, context.active_input_indices);
        const int16_t projected_q610 =
            subband_q610::SaturateInt16(subband_q610::RoundShiftRight(sum_q20, subband_q610::kQFrac));

        const int df_index = proj_index % spec.df_order;
        const int ctr_and_complex = proj_index / spec.df_order;
        const int ctr_index = ctr_and_complex % spec.ctr;
        const int complex_index = ctr_and_complex / spec.ctr;
        const int merged_freq_index = subband_index * spec.ctr + ctr_index;
        df_coef[DfCoefIndex(
            df_index,
            merged_freq_index,
            frame_index,
            complex_index,
            spec.df_order,
            spec.total_freqs(),
            num_frames)] = projected_q610;
      }
    }
  }
}

void RunDeepFiltering(Q610InferContext& context, int num_frames) {
  context.enhanced_real = context.noisy_real;
  context.enhanced_imag = context.noisy_imag;

  for (int band_index = 0; band_index < kNumBands; ++band_index) {
    const InferBandSpec& spec = context.bands[static_cast<std::size_t>(band_index)];
    const std::vector<int16_t>& df_coef = context.sb_df_coef[static_cast<std::size_t>(band_index)];
    for (int local_freq = 0; local_freq < spec.total_freqs(); ++local_freq) {
      const int global_freq = spec.lower + local_freq;
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        double out_real = 0.0;
        double out_imag = 0.0;
        for (int df_index = 0; df_index < spec.df_order; ++df_index) {
          const int source_frame = frame_index + df_index - spec.df_order + 1;
          if (source_frame < 0) {
            continue;
          }
          const double noisy_real = context.noisy_real[TfIndex(global_freq, source_frame, num_frames)];
          const double noisy_imag = context.noisy_imag[TfIndex(global_freq, source_frame, num_frames)];
          const double coef_real = Q610ToDouble(df_coef[DfCoefIndex(
              df_index, local_freq, frame_index, 0, spec.df_order, spec.total_freqs(), num_frames)]);
          const double coef_imag = Q610ToDouble(df_coef[DfCoefIndex(
              df_index, local_freq, frame_index, 1, spec.df_order, spec.total_freqs(), num_frames)]);
          out_real += (noisy_real * coef_real) - (noisy_imag * coef_imag);
          out_imag += (noisy_real * coef_imag) + (noisy_imag * coef_real);
        }
        context.enhanced_real[TfIndex(global_freq, frame_index, num_frames)] = static_cast<float>(out_real);
        context.enhanced_imag[TfIndex(global_freq, frame_index, num_frames)] = static_cast<float>(out_imag);
      }
    }
  }
}

void RunIstft(Q610InferContext& context, int input_length, int num_frames, float* output) {
  std::fill(context.ola.begin(), context.ola.end(), 0.0);
  std::fill(context.envelope.begin(), context.envelope.end(), 0.0);

  std::vector<ComplexValue> spectrum(static_cast<std::size_t>(kNfft));
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int freq_index = 0; freq_index < kNumStftFreqs; ++freq_index) {
      spectrum[static_cast<std::size_t>(freq_index)].real =
          context.enhanced_real[TfIndex(freq_index, frame_index, num_frames)];
      spectrum[static_cast<std::size_t>(freq_index)].imag =
          context.enhanced_imag[TfIndex(freq_index, frame_index, num_frames)];
    }
    for (int freq_index = 1; freq_index < kNfft / 2; ++freq_index) {
      spectrum[static_cast<std::size_t>(kNfft - freq_index)].real =
          spectrum[static_cast<std::size_t>(freq_index)].real;
      spectrum[static_cast<std::size_t>(kNfft - freq_index)].imag =
          -spectrum[static_cast<std::size_t>(freq_index)].imag;
    }
    spectrum[0].imag = 0.0;
    spectrum[kNfft / 2].imag = 0.0;
    Fft(spectrum, true);

    const int output_start = frame_index * kHopLength;
    for (int n = 0; n < kNfft; ++n) {
      const std::size_t padded_index = static_cast<std::size_t>(output_start + n);
      const double win = context.window[static_cast<std::size_t>(n)];
      context.ola[padded_index] += spectrum[static_cast<std::size_t>(n)].real * win;
      context.envelope[padded_index] += win * win;
    }
  }

  const int center_pad = kNfft / 2;
  for (int sample_index = 0; sample_index < input_length; ++sample_index) {
    const std::size_t padded_index = static_cast<std::size_t>(sample_index + center_pad);
    const double denom = context.envelope[padded_index];
    output[sample_index] = denom > 1.0e-12 ? static_cast<float>(context.ola[padded_index] / denom) : 0.0f;
  }
}

OwnedLayer ReadLayer(const int16_t* const* tensors, int& tensor_index, int input_size, int hidden_size) {
  OwnedLayer layer;
  layer.input_size = input_size;
  layer.hidden_size = hidden_size;
  layer.weight_ih = CopyInt16(tensors[tensor_index++], static_cast<std::size_t>(hidden_size) * input_size);
  layer.weight_hh = CopyInt16(tensors[tensor_index++], static_cast<std::size_t>(hidden_size) * hidden_size);
  layer.bias_ih = CopyInt16(tensors[tensor_index++], static_cast<std::size_t>(2) * hidden_size);
  layer.bn_running_mean = CopyInt16(tensors[tensor_index++], hidden_size);
  layer.bn_running_var = CopyInt16(tensors[tensor_index++], hidden_size);
  layer.bn_weight = CopyInt16(tensors[tensor_index++], hidden_size);
  layer.bn_bias = CopyInt16(tensors[tensor_index++], hidden_size);
  PrepareLayer(layer);
  return layer;
}

OwnedLinear ReadLinear(const int16_t* const* tensors, int& tensor_index, int input_size, int output_size) {
  OwnedLinear linear;
  linear.input_size = input_size;
  linear.output_size = output_size;
  linear.weight = CopyInt16(tensors[tensor_index++], static_cast<std::size_t>(output_size) * input_size);
  linear.bias = CopyInt16(tensors[tensor_index++], output_size);
  return linear;
}

}  // namespace

extern "C" void* create_q610_infer_context(
    const int* band_specs,
    int use_pre_layer_norm_fb,
    int use_pre_layer_norm_sb,
    const int16_t* const* tensors) {
  try {
    if (band_specs == nullptr || tensors == nullptr) {
      return nullptr;
    }
    std::unique_ptr<Q610InferContext> context(new Q610InferContext());
    context->use_pre_layer_norm_fb = use_pre_layer_norm_fb != 0;
    context->use_pre_layer_norm_sb = use_pre_layer_norm_sb != 0;
    InitializeSigmoidLut(*context);
    InitializeWindow(*context);

    for (int band_index = 0; band_index < kNumBands; ++band_index) {
      const int offset = band_index * 5;
      InferBandSpec spec;
      spec.lower = band_specs[offset + 0];
      spec.upper = band_specs[offset + 1];
      spec.ctr = band_specs[offset + 2];
      spec.nbr = band_specs[offset + 3];
      spec.df_order = band_specs[offset + 4];
      if (spec.lower < 0 || spec.upper > kNumFreqs || spec.lower >= spec.upper ||
          spec.ctr <= 0 || spec.nbr < 0 || spec.df_order <= 0 ||
          ((spec.upper - spec.lower) % spec.ctr) != 0) {
        return nullptr;
      }
      context->bands[static_cast<std::size_t>(band_index)] = spec;
    }

    int tensor_index = 0;
    context->fullband.ln_weight = CopyInt16(tensors[tensor_index++], kFullInputSize);
    context->fullband.ln_bias = CopyInt16(tensors[tensor_index++], kFullInputSize);
    context->fullband.layers[0] = ReadLayer(tensors, tensor_index, kFullInputSize, kFullHiddenSize);
    context->fullband.layers[1] = ReadLayer(tensors, tensor_index, kFullHiddenSize, kFullHiddenSize);
    context->fullband.proj = ReadLinear(tensors, tensor_index, kFullHiddenSize, kFullProjSize);

    for (int band_index = 0; band_index < kNumBands; ++band_index) {
      const InferBandSpec& spec = context->bands[static_cast<std::size_t>(band_index)];
      OwnedSequence& subband = context->subbands[static_cast<std::size_t>(band_index)];
      subband.ln_weight = CopyInt16(tensors[tensor_index++], spec.packed_input_size());
      subband.ln_bias = CopyInt16(tensors[tensor_index++], spec.packed_input_size());
      subband.layers[0] = ReadLayer(tensors, tensor_index, spec.packed_input_size(), kSbHiddenSize);
      subband.layers[1] = ReadLayer(tensors, tensor_index, kSbHiddenSize, kSbHiddenSize);
      subband.proj = ReadLinear(tensors, tensor_index, kSbHiddenSize, spec.proj_size());
    }

    return context.release();
  } catch (...) {
    return nullptr;
  }
}

extern "C" void destroy_q610_infer_context(void* context_ptr) {
  Q610InferContext* context = static_cast<Q610InferContext*>(context_ptr);
  delete context;
}

extern "C" int run_q610_infer(
    void* context_ptr,
    const float* input,
    int input_length,
    float* output) {
  try {
    if (context_ptr == nullptr || input == nullptr || output == nullptr || input_length <= 0) {
      return 2;
    }
    Q610InferContext& context = *static_cast<Q610InferContext*>(context_ptr);
    const int num_frames = (input_length / kHopLength) + 1;
    EnsureBuffers(context, input_length, num_frames);

    RunStft(context, input, input_length, num_frames);
    RunFullband(context, num_frames);
    for (int band_index = 0; band_index < kNumBands; ++band_index) {
      RunSubband(context, band_index, num_frames);
    }
    RunDeepFiltering(context, num_frames);
    RunIstft(context, input_length, num_frames, output);
    return 0;
  } catch (const std::exception&) {
    return 100;
  } catch (...) {
    return 101;
  }
}
