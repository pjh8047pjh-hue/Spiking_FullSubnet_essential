#include "subband_ref_q610.hpp"

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <exception>
#include <limits>
#include <memory>
#include <vector>

namespace {

constexpr int kSigmoidLutSize = 1 << 16;

inline std::size_t InputIndex(int batch_index, int freq_index, int frame_index, int num_frames) {
  return static_cast<std::size_t>((batch_index * subband_q610::kNumFreqs + freq_index) * num_frames + frame_index);
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

inline std::size_t SigmoidLutIndex(int16_t value) {
  return static_cast<std::size_t>(
      static_cast<int>(value) - static_cast<int>(std::numeric_limits<int16_t>::min()));
}

double Q610ToDouble(int16_t value) {
  return static_cast<double>(subband_q610::Q610ToFloat(value));
}

struct BnParams {
  bool enabled = false;
  std::array<double, subband_q610::kSbHiddenSize> mean{};
  std::array<double, subband_q610::kSbHiddenSize> denom{};
  std::array<double, subband_q610::kSbHiddenSize> gamma{};
  std::array<double, subband_q610::kSbHiddenSize> beta{};
};

struct PreparedLayer {
  const subband_q610::GSUWeightsQ610* weights = nullptr;
  BnParams bn;
  std::array<int64_t, subband_q610::kSbHiddenSize> forget_bias_q20{};
  std::array<int64_t, subband_q610::kSbHiddenSize> cell_bias_q20{};
};

struct FastBandBuffers {
  int batch_size = 0;
  int num_frames = 0;
  int band_index = -1;
  std::vector<int16_t> sequence_input;
  std::vector<int16_t> layer0_hx_state;
  std::vector<int16_t> layer0_cx_state;
  std::vector<int16_t> layer0_output;
  std::vector<int16_t> layer1_hx_state;
  std::vector<int16_t> layer1_cx_state;
  std::vector<int16_t> layer1_output;
  std::vector<int> active_input_indices;
  std::vector<int> active_recurrent_indices;
};

struct Q610FastContext {
  int batch_size = 0;
  int num_frames = 0;
  std::array<int16_t, kSigmoidLutSize> sigmoid_lut{};
  std::array<FastBandBuffers, subband_q610::kNumBands> bands;
};

bool HasNullPointer(const int16_t* const* pointers, int count) {
  for (int index = 0; index < count; ++index) {
    if (pointers[index] == nullptr) {
      return true;
    }
  }
  return false;
}

void InitializeSigmoidLut(Q610FastContext& context) {
  const int min_value = static_cast<int>(std::numeric_limits<int16_t>::min());
  const int max_value = static_cast<int>(std::numeric_limits<int16_t>::max());
  for (int value = min_value; value <= max_value; ++value) {
    context.sigmoid_lut[static_cast<std::size_t>(value - min_value)] =
        subband_q610::SigmoidQ610HostRef(static_cast<int16_t>(value));
  }
}

BnParams BuildBnParams(const subband_q610::GSUWeightsQ610& weights) {
  BnParams params;
  params.enabled = weights.bn_running_mean != nullptr && weights.bn_running_var != nullptr &&
      weights.bn_weight != nullptr && weights.bn_bias != nullptr;
  if (!params.enabled) {
    return params;
  }

  for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
    params.mean[hidden_index] = Q610ToDouble(weights.bn_running_mean[hidden_index]);
    const double var = Q610ToDouble(weights.bn_running_var[hidden_index]);
    params.denom[hidden_index] = std::sqrt(var + static_cast<double>(subband_q610::kBnEpsFloat));
    params.gamma[hidden_index] = Q610ToDouble(weights.bn_weight[hidden_index]);
    params.beta[hidden_index] = Q610ToDouble(weights.bn_bias[hidden_index]);
  }
  return params;
}

PreparedLayer PrepareLayer(const subband_q610::GSUWeightsQ610& weights) {
  PreparedLayer prepared;
  prepared.weights = &weights;
  prepared.bn = BuildBnParams(weights);
  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;
  for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
    prepared.forget_bias_q20[hidden_index] = static_cast<int64_t>(weights.bias_ih[hidden_index]) * q_scale_q20;
    prepared.cell_bias_q20[hidden_index] =
        static_cast<int64_t>(weights.bias_ih[subband_q610::kSbHiddenSize + hidden_index]) * q_scale_q20;
  }
  return prepared;
}

int16_t BatchNormEvalFast(int16_t input_value_q610, const BnParams& params, int hidden_index) {
  if (!params.enabled) {
    return input_value_q610;
  }

  const double x = Q610ToDouble(input_value_q610);
  const double normalized = (x - params.mean[hidden_index]) / params.denom[hidden_index];
  return subband_q610::FloatToQ610(
      static_cast<float>((params.gamma[hidden_index] * normalized) + params.beta[hidden_index]));
}

void EnsureBandBuffers(FastBandBuffers& buffers, const subband_q610::BandSpec& spec, int batch_size, int num_frames) {
  if (buffers.batch_size == batch_size && buffers.num_frames == num_frames && buffers.band_index == spec.band_index) {
    return;
  }

  buffers.batch_size = batch_size;
  buffers.num_frames = num_frames;
  buffers.band_index = spec.band_index;
  const int batch_subbands = batch_size * spec.num_subbands;
  buffers.sequence_input.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, spec.packed_input_size, num_frames));
  buffers.layer0_hx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer0_cx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer0_output.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
  buffers.layer1_hx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer1_cx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer1_output.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
  buffers.active_input_indices.reserve(subband_q610::kSbHiddenSize);
  buffers.active_recurrent_indices.reserve(subband_q610::kSbHiddenSize);
}

void PrepareContextBuffers(Q610FastContext& context, int batch_size, int num_frames) {
  context.batch_size = batch_size;
  context.num_frames = num_frames;
  for (int band_index = 0; band_index < subband_q610::kNumBands; ++band_index) {
    EnsureBandBuffers(context.bands[static_cast<std::size_t>(band_index)], subband_q610::GetBandSpec(band_index),
        batch_size, num_frames);
  }
}

void BuildSequenceInputQ610(
    const subband_q610::BandSpec& spec,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    int16_t* sequence_input_q610) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const int noisy_freq_size = spec.ctr_freq + (2 * spec.nbr_freq);

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      const int center_start = spec.lower_cutoff_freq + subband_index * spec.ctr_freq;
      for (int feature_index = 0; feature_index < spec.packed_input_size; ++feature_index) {
        const bool is_noisy_feature = feature_index < noisy_freq_size;
        int source_freq = 0;
        if (is_noisy_feature) {
          source_freq = center_start + feature_index - spec.nbr_freq;
          source_freq = subband_q610::ReflectFrequencyIndex(source_freq, subband_q610::kNumFreqs);
        } else {
          source_freq = center_start + (feature_index - noisy_freq_size);
        }

        const int16_t* source = is_noisy_feature ? noisy_input_q610 : fb_output_q610;
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          sequence_input_q610[SequenceIndex(
              frame_index, sample_index, feature_index, batch_subbands, spec.packed_input_size)] =
              source[InputIndex(batch_index, source_freq, frame_index, num_frames)];
        }
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
  int64_t sum_q20 = 0;
  for (int index = 0; index < size; ++index) {
    sum_q20 += static_cast<int64_t>(input[index]) * static_cast<int64_t>(weights[index]);
  }
  return sum_q20;
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

void RunGSULayerFast(
    const Q610FastContext& context,
    const int16_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    bool input_is_spike,
    const PreparedLayer& prepared,
    int16_t* hx_state_q610,
    int16_t* cx_state_q610,
    int16_t* sequence_output_q610,
    std::vector<int>& active_input_indices,
    std::vector<int>& active_recurrent_indices) {
  const subband_q610::GSUWeightsQ610& weights = *prepared.weights;
  std::array<int16_t, subband_q610::kSbHiddenSize> prev_hx_q610{};
  std::array<int16_t, subband_q610::kSbHiddenSize> prev_cx_q610{};

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * subband_q610::kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const int16_t* input_ptr = &sequence_input_q610[input_offset];

      for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
        prev_hx_q610[hidden_index] = hx_state_q610[state_offset + hidden_index];
        prev_cx_q610[hidden_index] = cx_state_q610[state_offset + hidden_index];
      }

      if (input_is_spike) {
        BuildActiveIndices(input_ptr, input_size, active_input_indices);
      }
      BuildActiveIndices(prev_hx_q610.data(), subband_q610::kSbHiddenSize, active_recurrent_indices);

      for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
        const int16_t* weight_ih_ptr = &weights.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
        const int16_t* weight_hh_ptr =
            &weights.weight_hh[static_cast<std::size_t>(hidden_index) * subband_q610::kSbHiddenSize];

        int64_t common_q20 = input_is_spike
            ? DotSpikeQ610(input_ptr, weight_ih_ptr, input_size, active_input_indices)
            : DotDenseQ610(input_ptr, weight_ih_ptr, input_size);
        common_q20 += DotSpikeQ610(
            prev_hx_q610.data(), weight_hh_ptr, subband_q610::kSbHiddenSize, active_recurrent_indices);

        const int64_t forget_q20 = common_q20 + prepared.forget_bias_q20[hidden_index];
        const int64_t cell_q20 = common_q20 + prepared.cell_bias_q20[hidden_index];

        const int16_t forget_preact_q610 =
            subband_q610::SaturateInt16(subband_q610::RoundShiftRight(forget_q20, subband_q610::kQFrac));
        const int16_t cell_preact_q610 =
            subband_q610::SaturateInt16(subband_q610::RoundShiftRight(cell_q20, subband_q610::kQFrac));

        const int16_t forget_gate_q610 = context.sigmoid_lut[SigmoidLutIndex(forget_preact_q610)];
        const int16_t one_minus_forget_q610 = subband_q610::SubQ610(subband_q610::kQOne, forget_gate_q610);
        const int16_t retained_q610 = subband_q610::MulQ610(forget_gate_q610, prev_cx_q610[hidden_index]);
        const int16_t injected_q610 = subband_q610::MulQ610(one_minus_forget_q610, cell_preact_q610);

        int16_t cy_q610 = subband_q610::AddQ610(retained_q610, injected_q610);
        cy_q610 = BatchNormEvalFast(cy_q610, prepared.bn, hidden_index);
        const int16_t hy_q610 = subband_q610::StepActivationQ610(cy_q610);

        cx_state_q610[state_offset + hidden_index] = cy_q610;
        hx_state_q610[state_offset + hidden_index] = hy_q610;
        sequence_output_q610[SequenceIndex(
            frame_index, sample_index, hidden_index, batch_subbands, subband_q610::kSbHiddenSize)] = hy_q610;
      }
    }
  }
}

void RunProjectionToDfCoefFast(
    const subband_q610::BandSpec& spec,
    const int16_t* sequence_input_q610,
    int batch_size,
    int num_frames,
    const subband_q610::LinearWeightsQ610& weights,
    int16_t* df_coef_q610,
    std::vector<int>& active_input_indices) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const int total_freqs = spec.num_subbands * spec.ctr_freq;
  const int64_t q_scale_q20 = static_cast<int64_t>(1) << subband_q610::kQFrac;

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const int batch_index = sample_index / spec.num_subbands;
      const int subband_index = sample_index % spec.num_subbands;
      const int16_t* input_ptr =
          &sequence_input_q610[SequenceIndex(
              frame_index, sample_index, 0, batch_subbands, subband_q610::kSbHiddenSize)];
      BuildActiveIndices(input_ptr, subband_q610::kSbHiddenSize, active_input_indices);

      for (int proj_index = 0; proj_index < spec.proj_size; ++proj_index) {
        int64_t sum_q20 = static_cast<int64_t>(weights.bias[proj_index]) * q_scale_q20;
        const int16_t* weight_ptr =
            &weights.weight[static_cast<std::size_t>(proj_index) * subband_q610::kSbHiddenSize];
        sum_q20 += DotSpikeQ610(input_ptr, weight_ptr, subband_q610::kSbHiddenSize, active_input_indices);
        const int16_t projected_q610 =
            subband_q610::SaturateInt16(subband_q610::RoundShiftRight(sum_q20, subband_q610::kQFrac));

        const int df_index = proj_index % spec.df_order;
        const int ctr_and_complex = proj_index / spec.df_order;
        const int ctr_index = ctr_and_complex % spec.ctr_freq;
        const int complex_index = ctr_and_complex / spec.ctr_freq;
        const int merged_freq_index = subband_index * spec.ctr_freq + ctr_index;
        df_coef_q610[DfCoefIndex(
            batch_index,
            df_index,
            merged_freq_index,
            frame_index,
            complex_index,
            spec.df_order,
            total_freqs,
            num_frames)] = projected_q610;
      }
    }
  }
}

int RunBandFast(
    Q610FastContext& context,
    int band_index,
    int batch_size,
    int num_frames,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    const subband_q610::BandWeightsQ610& weights,
    int16_t* df_coef_q610) {
  if (band_index < 0 || band_index >= subband_q610::kNumBands || batch_size <= 0 || num_frames <= 0) {
    return 3;
  }

  const subband_q610::BandSpec& spec = subband_q610::GetBandSpec(band_index);
  FastBandBuffers& buffers = context.bands[static_cast<std::size_t>(band_index)];
  EnsureBandBuffers(buffers, spec, batch_size, num_frames);
  const int batch_subbands = batch_size * spec.num_subbands;

  BuildSequenceInputQ610(
      spec, noisy_input_q610, fb_output_q610, batch_size, num_frames, buffers.sequence_input.data());

  std::fill(buffers.layer0_hx_state.begin(), buffers.layer0_hx_state.end(), subband_q610::kQZero);
  std::fill(buffers.layer0_cx_state.begin(), buffers.layer0_cx_state.end(), subband_q610::kQZero);
  std::fill(buffers.layer1_hx_state.begin(), buffers.layer1_hx_state.end(), subband_q610::kQZero);
  std::fill(buffers.layer1_cx_state.begin(), buffers.layer1_cx_state.end(), subband_q610::kQZero);

  const PreparedLayer layer0 = PrepareLayer(weights.layers[0]);
  const PreparedLayer layer1 = PrepareLayer(weights.layers[1]);

  RunGSULayerFast(
      context,
      buffers.sequence_input.data(),
      batch_subbands,
      num_frames,
      spec.packed_input_size,
      false,
      layer0,
      buffers.layer0_hx_state.data(),
      buffers.layer0_cx_state.data(),
      buffers.layer0_output.data(),
      buffers.active_input_indices,
      buffers.active_recurrent_indices);

  RunGSULayerFast(
      context,
      buffers.layer0_output.data(),
      batch_subbands,
      num_frames,
      subband_q610::kSbHiddenSize,
      true,
      layer1,
      buffers.layer1_hx_state.data(),
      buffers.layer1_cx_state.data(),
      buffers.layer1_output.data(),
      buffers.active_input_indices,
      buffers.active_recurrent_indices);

  RunProjectionToDfCoefFast(
      spec,
      buffers.layer1_output.data(),
      batch_size,
      num_frames,
      weights.proj,
      df_coef_q610,
      buffers.active_input_indices);

  return 0;
}

}  // namespace

extern "C" void* create_q610_context(int batch_size, int num_frames) {
  try {
    if (batch_size <= 0 || num_frames <= 0) {
      return nullptr;
    }
    std::unique_ptr<Q610FastContext> context(new Q610FastContext());
    InitializeSigmoidLut(*context);
    PrepareContextBuffers(*context, batch_size, num_frames);
    return context.release();
  } catch (...) {
    return nullptr;
  }
}

extern "C" void destroy_q610_context(void* context_ptr) {
  Q610FastContext* context = static_cast<Q610FastContext*>(context_ptr);
  delete context;
}

extern "C" int run_q610_fast(
    void* context_ptr,
    int band_index,
    int batch_size,
    int num_frames,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    const int16_t* layer0_weight_ih_q610,
    const int16_t* layer0_weight_hh_q610,
    const int16_t* layer0_bias_ih_q610,
    const int16_t* layer0_bn_running_mean_q610,
    const int16_t* layer0_bn_running_var_q610,
    const int16_t* layer0_bn_weight_q610,
    const int16_t* layer0_bn_bias_q610,
    const int16_t* layer1_weight_ih_q610,
    const int16_t* layer1_weight_hh_q610,
    const int16_t* layer1_bias_ih_q610,
    const int16_t* layer1_bn_running_mean_q610,
    const int16_t* layer1_bn_running_var_q610,
    const int16_t* layer1_bn_weight_q610,
    const int16_t* layer1_bn_bias_q610,
    const int16_t* proj_weight_q610,
    const int16_t* proj_bias_q610,
    int16_t* df_coef_q610) {
  try {
    if (context_ptr == nullptr) {
      return 4;
    }
    const int16_t* required_pointers[] = {
        noisy_input_q610,
        fb_output_q610,
        layer0_weight_ih_q610,
        layer0_weight_hh_q610,
        layer0_bias_ih_q610,
        layer0_bn_running_mean_q610,
        layer0_bn_running_var_q610,
        layer0_bn_weight_q610,
        layer0_bn_bias_q610,
        layer1_weight_ih_q610,
        layer1_weight_hh_q610,
        layer1_bias_ih_q610,
        layer1_bn_running_mean_q610,
        layer1_bn_running_var_q610,
        layer1_bn_weight_q610,
        layer1_bn_bias_q610,
        proj_weight_q610,
        proj_bias_q610,
        df_coef_q610,
    };
    if (HasNullPointer(required_pointers, static_cast<int>(sizeof(required_pointers) / sizeof(required_pointers[0])))) {
      return 2;
    }

    const subband_q610::GSUWeightsQ610 layer0_weights = {
        layer0_weight_ih_q610,
        layer0_weight_hh_q610,
        layer0_bias_ih_q610,
        layer0_bn_running_mean_q610,
        layer0_bn_running_var_q610,
        layer0_bn_weight_q610,
        layer0_bn_bias_q610,
    };
    const subband_q610::GSUWeightsQ610 layer1_weights = {
        layer1_weight_ih_q610,
        layer1_weight_hh_q610,
        layer1_bias_ih_q610,
        layer1_bn_running_mean_q610,
        layer1_bn_running_var_q610,
        layer1_bn_weight_q610,
        layer1_bn_bias_q610,
    };
    const subband_q610::BandWeightsQ610 weights = {{{layer0_weights, layer1_weights}}, {proj_weight_q610, proj_bias_q610}};
    Q610FastContext& context = *static_cast<Q610FastContext*>(context_ptr);
    return RunBandFast(context, band_index, batch_size, num_frames, noisy_input_q610, fb_output_q610, weights, df_coef_q610);
  } catch (const std::exception&) {
    return 100;
  } catch (...) {
    return 101;
  }
}
