#include "subband_ref.hpp"

#include <cmath>
#include <stdexcept>
#include <string>
#include <utility>

namespace subband_ref {

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

void ValidateBatchAndFrames(int batch_size, int num_frames) {
  if (batch_size <= 0) {
    throw std::invalid_argument("batch_size must be positive.");
  }
  if (num_frames <= 0) {
    throw std::invalid_argument("num_frames must be positive.");
  }
}

void ValidatePointer(const float* pointer, const char* name) {
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

void ValidateBandWeights(const BandSpec& spec, const BandWeights& weights) {
  ValidateSize(
      weights.layers[0].weight_ih.size(),
      static_cast<std::size_t>(kSbHiddenSize * spec.packed_input_size),
      "layer0.weight_ih");
  ValidateSize(
      weights.layers[0].weight_hh.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer0.weight_hh");
  ValidateSize(weights.layers[0].bias_ih.size(), static_cast<std::size_t>(2 * kSbHiddenSize), "layer0.bias_ih");
  ValidateSize(
      weights.layers[1].weight_ih.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer1.weight_ih");
  ValidateSize(
      weights.layers[1].weight_hh.size(),
      static_cast<std::size_t>(kSbHiddenSize * kSbHiddenSize),
      "layer1.weight_hh");
  ValidateSize(weights.layers[1].bias_ih.size(), static_cast<std::size_t>(2 * kSbHiddenSize), "layer1.bias_ih");
  ValidateSize(
      weights.proj.weight.size(),
      static_cast<std::size_t>(spec.proj_size * kSbHiddenSize),
      "proj.weight");
  ValidateSize(weights.proj.bias.size(), static_cast<std::size_t>(spec.proj_size), "proj.bias");

  for (int layer_index = 0; layer_index < kSbNumLayers; ++layer_index) {
    const GSUWeights& layer_weights = weights.layers[layer_index];
    if (!layer_weights.bn_running_mean.empty()) {
      ValidateSize(
          layer_weights.bn_running_mean.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.running_mean");
      ValidateSize(
          layer_weights.bn_running_var.size(),
          static_cast<std::size_t>(kSbHiddenSize),
          "batchnorm.running_var");
      ValidateSize(layer_weights.bn_weight.size(), static_cast<std::size_t>(kSbHiddenSize), "batchnorm.weight");
      ValidateSize(layer_weights.bn_bias.size(), static_cast<std::size_t>(kSbHiddenSize), "batchnorm.bias");
    }
  }
}

TensorBuffer MakeTensorBuffer(std::vector<float> data, std::vector<int> shape) {
  TensorBuffer tensor;
  tensor.data = std::move(data);
  tensor.shape = std::move(shape);
  return tensor;
}

void FreqUnfoldImpl(const BandSpec& spec, int nbr_freq, const float* input, int batch_size, int num_frames, float* output) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(input, "input");
  ValidatePointer(output, "output");

  const int freq_size = spec.ctr_freq + (2 * nbr_freq);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int center_start = spec.lower_cutoff_freq + subband_index * spec.ctr_freq;
      for (int sb_freq_index = 0; sb_freq_index < freq_size; ++sb_freq_index) {
        int source_freq = center_start + sb_freq_index - nbr_freq;
        source_freq = ReflectFrequencyIndex(source_freq, kNumFreqs);
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output[SubbandIndex(
              batch_index,
              subband_index,
              sb_freq_index,
              frame_index,
              spec.num_subbands,
              freq_size,
              num_frames)] = input[InputIndex(batch_index, source_freq, frame_index, num_frames)];
        }
      }
    }
  }
}

void ConcatImpl(
    const BandSpec& spec,
    const float* noisy_subbands,
    const float* fb_subbands,
    int batch_size,
    int num_frames,
    float* output) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(noisy_subbands, "noisy_subbands");
  ValidatePointer(fb_subbands, "fb_subbands");
  ValidatePointer(output, "output");

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      for (int freq_index = 0; freq_index < spec.noisy_freq_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output[SubbandIndex(
              batch_index,
              subband_index,
              freq_index,
              frame_index,
              spec.num_subbands,
              spec.packed_input_size,
              num_frames)] = noisy_subbands[SubbandIndex(
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
          output[SubbandIndex(
              batch_index,
              subband_index,
              spec.noisy_freq_size + freq_index,
              frame_index,
              spec.num_subbands,
              spec.packed_input_size,
              num_frames)] = fb_subbands[SubbandIndex(
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

void PackImpl(const BandSpec& spec, const float* sb_input, int batch_size, int num_frames, float* output) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(sb_input, "sb_input");
  ValidatePointer(output, "output");

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int freq_index = 0; freq_index < spec.packed_input_size; ++freq_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          output[PackedIndex(sample_index, freq_index, frame_index, spec.packed_input_size, num_frames)] =
              sb_input[SubbandIndex(
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

std::vector<float> PackedToSequence(
    const std::vector<float>& packed_input,
    int batch_subbands,
    int feature_size,
    int num_frames) {
  std::vector<float> sequence_input(static_cast<std::size_t>(num_frames) * batch_subbands * feature_size, 0.0f);

  for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
    for (int feature_index = 0; feature_index < feature_size; ++feature_index) {
      for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
        sequence_input[SequenceIndex(frame_index, sample_index, feature_index, batch_subbands, feature_size)] =
            packed_input[PackedIndex(sample_index, feature_index, frame_index, feature_size, num_frames)];
      }
    }
  }

  return sequence_input;
}

float StepActivation(float input_value) {
  return input_value >= 0.0f ? 1.0f : 0.0f;
}

float BatchNormEval(float input_value, const GSUWeights& weights, int hidden_index) {
  if (weights.bn_running_mean.empty()) {
    return input_value;
  }

  const float centered = input_value - weights.bn_running_mean[hidden_index];
  const float inv_std = 1.0f / std::sqrt(weights.bn_running_var[hidden_index] + weights.bn_eps);
  return (weights.bn_weight[hidden_index] * centered * inv_std) + weights.bn_bias[hidden_index];
}

float Sigmoid(float input_value) {
  return 1.0f / (1.0f + std::exp(-input_value));
}

std::vector<float> RunGSULayer(
    const std::vector<float>& sequence_input,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeights& weights) {
  std::vector<float> sequence_output(static_cast<std::size_t>(num_frames) * batch_subbands * kSbHiddenSize, 0.0f);
  std::vector<float> hx(static_cast<std::size_t>(batch_subbands) * kSbHiddenSize, 0.0f);
  std::vector<float> cx(static_cast<std::size_t>(batch_subbands) * kSbHiddenSize, 0.0f);

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const float* input_ptr = &sequence_input[input_offset];

      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        float forget_pre_activation = weights.bias_ih[hidden_index];
        float cell_pre_activation = weights.bias_ih[kSbHiddenSize + hidden_index];
        const float* weight_ih_ptr = &weights.weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
        const float* weight_hh_ptr = &weights.weight_hh[static_cast<std::size_t>(hidden_index) * kSbHiddenSize];

        for (int input_index = 0; input_index < input_size; ++input_index) {
          const float product = input_ptr[input_index] * weight_ih_ptr[input_index];
          forget_pre_activation += product;
          cell_pre_activation += product;
        }

        for (int recurrent_index = 0; recurrent_index < kSbHiddenSize; ++recurrent_index) {
          const float product = hx[state_offset + recurrent_index] * weight_hh_ptr[recurrent_index];
          forget_pre_activation += product;
          cell_pre_activation += product;
        }

        const float forget_gate = Sigmoid(forget_pre_activation);
        float cy_value =
            (forget_gate * cx[state_offset + hidden_index]) + ((1.0f - forget_gate) * cell_pre_activation);
        cy_value = BatchNormEval(cy_value, weights, hidden_index);
        const float hy_value = StepActivation(cy_value);

        cx[state_offset + hidden_index] = cy_value;
        hx[state_offset + hidden_index] = hy_value;
        sequence_output[SequenceIndex(frame_index, sample_index, hidden_index, batch_subbands, kSbHiddenSize)] =
            hy_value;
      }
    }
  }

  return sequence_output;
}

std::vector<float> RunProjection(
    const std::vector<float>& sequence_input,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeights& weights) {
  std::vector<float> sequence_output(static_cast<std::size_t>(num_frames) * batch_subbands * proj_size, 0.0f);

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const float* input_ptr =
          &sequence_input[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];
      for (int proj_index = 0; proj_index < proj_size; ++proj_index) {
        float sum = weights.bias[proj_index];
        const float* weight_ptr = &weights.weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum += input_ptr[hidden_index] * weight_ptr[hidden_index];
        }
        sequence_output[SequenceIndex(frame_index, sample_index, proj_index, batch_subbands, proj_size)] = sum;
      }
    }
  }

  return sequence_output;
}

TensorBuffer MakeLayerTensor(const std::vector<float>& data, int dim0, int dim1, int dim2) {
  return MakeTensorBuffer(data, {dim0, dim1, dim2});
}

void ProjectToDfCoef(
    const BandSpec& spec,
    const std::vector<float>& projected_sequence,
    int batch_size,
    int num_frames,
    TensorBuffer* output_tensor) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const int total_freqs = spec.num_subbands * spec.ctr_freq;
  output_tensor->shape = {batch_size, spec.df_order, kNumSpks, total_freqs, num_frames, 2};
  output_tensor->data.assign(GetDfCoefElementCount(spec, batch_size, num_frames), 0.0f);

  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int complex_index = 0; complex_index < 2; ++complex_index) {
        for (int ctr_index = 0; ctr_index < spec.ctr_freq; ++ctr_index) {
          for (int df_index = 0; df_index < spec.df_order; ++df_index) {
            const int feature_index = ((complex_index * spec.ctr_freq + ctr_index) * spec.df_order) + df_index;
            const int merged_freq_index = subband_index * spec.ctr_freq + ctr_index;
            for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
              output_tensor->data[DfCoefIndex(
                  batch_index,
                  df_index,
                  merged_freq_index,
                  frame_index,
                  complex_index,
                  spec.df_order,
                  total_freqs,
                  num_frames)] = projected_sequence[SequenceIndex(
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

BandForwardResult RunBandImpl(
    const BandSpec& spec,
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs) {
  ValidateBatchAndFrames(batch_size, num_frames);
  ValidatePointer(noisy_input, "noisy_input");
  ValidatePointer(fb_output, "fb_output");
  ValidateBandWeights(spec, weights);

  BandForwardResult result;
  result.noisy_subbands.shape = {batch_size, spec.num_subbands, kNumChannels, spec.noisy_freq_size, num_frames};
  result.noisy_subbands.data.assign(GetNoisySubbandsElementCount(spec, batch_size, num_frames), 0.0f);
  FreqUnfoldImpl(spec, spec.nbr_freq, noisy_input, batch_size, num_frames, result.noisy_subbands.data.data());

  result.fb_subbands.shape = {batch_size, spec.num_subbands, kNumChannels, spec.fb_freq_size, num_frames};
  result.fb_subbands.data.assign(GetFbSubbandsElementCount(spec, batch_size, num_frames), 0.0f);
  FreqUnfoldImpl(spec, 0, fb_output, batch_size, num_frames, result.fb_subbands.data.data());

  result.sb_input.shape = {batch_size, spec.num_subbands, kNumChannels, spec.packed_input_size, num_frames};
  result.sb_input.data.assign(GetSbInputElementCount(spec, batch_size, num_frames), 0.0f);
  ConcatImpl(
      spec,
      result.noisy_subbands.data.data(),
      result.fb_subbands.data.data(),
      batch_size,
      num_frames,
      result.sb_input.data.data());

  result.packed_input.shape = {batch_size * spec.num_subbands, spec.packed_input_size, num_frames};
  result.packed_input.data.assign(GetPackedInputElementCount(spec, batch_size, num_frames), 0.0f);
  PackImpl(spec, result.sb_input.data.data(), batch_size, num_frames, result.packed_input.data.data());

  const int batch_subbands = batch_size * spec.num_subbands;
  std::vector<float> sequence_input =
      PackedToSequence(result.packed_input.data, batch_subbands, spec.packed_input_size, num_frames);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensor(sequence_input, num_frames, batch_subbands, spec.packed_input_size));
  }

  std::vector<float> layer0_output =
      RunGSULayer(sequence_input, batch_subbands, num_frames, spec.packed_input_size, weights.layers[0]);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensor(layer0_output, num_frames, batch_subbands, kSbHiddenSize));
  }

  std::vector<float> layer1_output =
      RunGSULayer(layer0_output, batch_subbands, num_frames, kSbHiddenSize, weights.layers[1]);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensor(layer1_output, num_frames, batch_subbands, kSbHiddenSize));
  }

  std::vector<float> projected_output =
      RunProjection(layer1_output, batch_subbands, num_frames, spec.proj_size, weights.proj);
  if (capture_layer_outputs) {
    result.layer_outputs.push_back(MakeLayerTensor(projected_output, num_frames, batch_subbands, spec.proj_size));
  }

  ProjectToDfCoef(spec, projected_output, batch_size, num_frames, &result.df_coef);
  return result;
}

}  // namespace

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
  return static_cast<std::size_t>(batch_size) * spec.df_order * kNumSpks * (spec.num_subbands * spec.ctr_freq) *
      num_frames * 2;
}

void FreqUnfoldBand0Noisy(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(0), GetBandSpec(0).nbr_freq, input, batch_size, num_frames, output);
}

void FreqUnfoldBand1Noisy(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(1), GetBandSpec(1).nbr_freq, input, batch_size, num_frames, output);
}

void FreqUnfoldBand2Noisy(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(2), GetBandSpec(2).nbr_freq, input, batch_size, num_frames, output);
}

void FreqUnfoldBand0Fullband(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(0), 0, input, batch_size, num_frames, output);
}

void FreqUnfoldBand1Fullband(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(1), 0, input, batch_size, num_frames, output);
}

void FreqUnfoldBand2Fullband(const float* input, int batch_size, int num_frames, float* output) {
  FreqUnfoldImpl(GetBandSpec(2), 0, input, batch_size, num_frames, output);
}

void ConcatBand0(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output) {
  ConcatImpl(GetBandSpec(0), noisy_subbands, fb_subbands, batch_size, num_frames, output);
}

void ConcatBand1(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output) {
  ConcatImpl(GetBandSpec(1), noisy_subbands, fb_subbands, batch_size, num_frames, output);
}

void ConcatBand2(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output) {
  ConcatImpl(GetBandSpec(2), noisy_subbands, fb_subbands, batch_size, num_frames, output);
}

void PackBand0Input(const float* sb_input, int batch_size, int num_frames, float* output) {
  PackImpl(GetBandSpec(0), sb_input, batch_size, num_frames, output);
}

void PackBand1Input(const float* sb_input, int batch_size, int num_frames, float* output) {
  PackImpl(GetBandSpec(1), sb_input, batch_size, num_frames, output);
}

void PackBand2Input(const float* sb_input, int batch_size, int num_frames, float* output) {
  PackImpl(GetBandSpec(2), sb_input, batch_size, num_frames, output);
}

BandForwardResult RunBand0(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs) {
  return RunBandImpl(GetBandSpec(0), noisy_input, fb_output, batch_size, num_frames, weights, capture_layer_outputs);
}

BandForwardResult RunBand1(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs) {
  return RunBandImpl(GetBandSpec(1), noisy_input, fb_output, batch_size, num_frames, weights, capture_layer_outputs);
}

BandForwardResult RunBand2(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs) {
  return RunBandImpl(GetBandSpec(2), noisy_input, fb_output, batch_size, num_frames, weights, capture_layer_outputs);
}

std::array<BandForwardResult, kNumBands> RunSubbandModel(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const std::array<BandWeights, kNumBands>& weights,
    bool capture_layer_outputs) {
  return {{
      RunBand0(noisy_input, fb_output, batch_size, num_frames, weights[0], capture_layer_outputs),
      RunBand1(noisy_input, fb_output, batch_size, num_frames, weights[1], capture_layer_outputs),
      RunBand2(noisy_input, fb_output, batch_size, num_frames, weights[2], capture_layer_outputs),
  }};
}

}  // namespace subband_ref
