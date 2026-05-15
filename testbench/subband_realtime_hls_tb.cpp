#include "subband_ref_q610.hpp"

#include <cstddef>
#include <cstdint>
#include <iostream>
#include <vector>

namespace {

using subband_q610::axis_q610_t;
using subband_q610::BandSpec;
using subband_q610::BandWeightsQ610;
using subband_q610::GetBandSpec;
using subband_q610::GetDfCoefElementCount;
using subband_q610::GetFbSubbandsElementCount;
using subband_q610::GetNoisySubbandsElementCount;
using subband_q610::GetPackedInputElementCount;
using subband_q610::GetRealtimeBandWeightCount;
using subband_q610::GetSbInputElementCount;
using subband_q610::GetSequenceElementCount;
using subband_q610::GetStateElementCount;
using subband_q610::ConcatQ610;
using subband_q610::FreqUnfoldQ610;
using subband_q610::kBand0RealtimeDfCoefPerFrame;
using subband_q610::kBand0PackedInputSize;
using subband_q610::kBand0ProjSize;
using subband_q610::kBand0RealtimeWeightCount;
using subband_q610::kBand1RealtimeDfCoefPerFrame;
using subband_q610::kBand2RealtimeDfCoefPerFrame;
using subband_q610::kNumFreqs;
using subband_q610::kQOne;
using subband_q610::kRealtimeChunkFrames;
using subband_q610::kRealtimeDfCoefPerFrame;
using subband_q610::kRealtimeWeightsElementCount;
using subband_q610::kRealtimeWeightsWordCount;
using subband_q610::kRealtimeWeightWordLanes;
using subband_q610::kSbHiddenSize;
using subband_q610::packed_weight_word_t;
using subband_q610::PackQ610;
using subband_q610::PackedToSequenceQ610;
using subband_q610::ProjectToDfCoefQ610;
using subband_q610::q_data_t;
using subband_q610::RoundUpRealtimeWeightElements;
using subband_q610::RunGSULayerQ610;
using subband_q610::RunProjectionQ610;

constexpr int kScenarioFrames = 4;

struct BandStorage {
  std::vector<q_data_t> layer0_weight_ih;
  std::vector<q_data_t> layer0_weight_hh;
  std::vector<q_data_t> layer0_bias_ih;
  std::vector<q_data_t> layer0_bn_mul;
  std::vector<q_data_t> layer0_bn_add;
  std::vector<q_data_t> layer1_weight_ih;
  std::vector<q_data_t> layer1_weight_hh;
  std::vector<q_data_t> layer1_bias_ih;
  std::vector<q_data_t> layer1_bn_mul;
  std::vector<q_data_t> layer1_bn_add;
  std::vector<q_data_t> proj_weight;
  std::vector<q_data_t> proj_bias;
  BandWeightsQ610 view;
};

int16_t NextSmallQ610(uint32_t& state) {
  state = (1664525u * state) + 1013904223u;
  return static_cast<int16_t>((static_cast<int32_t>((state >> 24) & 0x7f) - 64) * 4);
}

void FillVector(std::vector<q_data_t>& values, uint32_t& state) {
  for (q_data_t& value : values) {
    value = NextSmallQ610(state);
  }
}

void FillBatchNorm(std::vector<q_data_t>& mul, std::vector<q_data_t>& add) {
  for (q_data_t& value : mul) {
    value = kQOne;
  }
  for (q_data_t& value : add) {
    value = 0;
  }
}

void InitBandStorage(const BandSpec& spec, uint32_t& rng_state, BandStorage& storage) {
  storage.layer0_weight_ih.resize(kSbHiddenSize * spec.packed_input_size);
  storage.layer0_weight_hh.resize(kSbHiddenSize * kSbHiddenSize);
  storage.layer0_bias_ih.resize(2 * kSbHiddenSize);
  storage.layer0_bn_mul.resize(kSbHiddenSize);
  storage.layer0_bn_add.resize(kSbHiddenSize);
  storage.layer1_weight_ih.resize(kSbHiddenSize * kSbHiddenSize);
  storage.layer1_weight_hh.resize(kSbHiddenSize * kSbHiddenSize);
  storage.layer1_bias_ih.resize(2 * kSbHiddenSize);
  storage.layer1_bn_mul.resize(kSbHiddenSize);
  storage.layer1_bn_add.resize(kSbHiddenSize);
  storage.proj_weight.resize(spec.proj_size * kSbHiddenSize);
  storage.proj_bias.resize(spec.proj_size);

  FillVector(storage.layer0_weight_ih, rng_state);
  FillVector(storage.layer0_weight_hh, rng_state);
  FillVector(storage.layer0_bias_ih, rng_state);
  FillBatchNorm(storage.layer0_bn_mul, storage.layer0_bn_add);
  FillVector(storage.layer1_weight_ih, rng_state);
  FillVector(storage.layer1_weight_hh, rng_state);
  FillVector(storage.layer1_bias_ih, rng_state);
  FillBatchNorm(storage.layer1_bn_mul, storage.layer1_bn_add);
  FillVector(storage.proj_weight, rng_state);
  FillVector(storage.proj_bias, rng_state);

  storage.view.layers[0] = {
      storage.layer0_weight_ih.data(),
      storage.layer0_weight_hh.data(),
      storage.layer0_bias_ih.data(),
      storage.layer0_bn_mul.data(),
      storage.layer0_bn_add.data(),
  };
  storage.view.layers[1] = {
      storage.layer1_weight_ih.data(),
      storage.layer1_weight_hh.data(),
      storage.layer1_bias_ih.data(),
      storage.layer1_bn_mul.data(),
      storage.layer1_bn_add.data(),
  };
  storage.view.proj = {
      storage.proj_weight.data(),
      storage.proj_bias.data(),
  };
}

void AppendVector(const std::vector<q_data_t>& source, std::vector<q_data_t>& target) {
  target.insert(target.end(), source.begin(), source.end());
}

void AppendInputWeightMatrixPadded(
    const std::vector<q_data_t>& source,
    int logical_cols,
    std::vector<q_data_t>& target) {
  for (int row = 0; row < kSbHiddenSize; ++row) {
    for (int col = 0; col < kSbHiddenSize; ++col) {
      q_data_t value = 0;
      if (col < logical_cols) {
        value = source[(row * logical_cols) + col];
      }
      target.push_back(value);
    }
  }
}

void AppendProjectionBiasPadded(const std::vector<q_data_t>& source, std::vector<q_data_t>& target) {
  AppendVector(source, target);
  const int padded_count = RoundUpRealtimeWeightElements(static_cast<int>(source.size()));
  for (int index = static_cast<int>(source.size()); index < padded_count; ++index) {
    target.push_back(0);
  }
}

std::vector<packed_weight_word_t> PackWeightWords(const std::vector<q_data_t>& elements) {
  std::vector<packed_weight_word_t> words(elements.size() / kRealtimeWeightWordLanes);
  for (std::size_t word_index = 0; word_index < words.size(); ++word_index) {
    packed_weight_word_t word = 0;
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      const std::size_t element_index = (word_index * kRealtimeWeightWordLanes) + lane;
      word.range((lane * 16) + 15, lane * 16) = elements[element_index].range(15, 0);
    }
    words[word_index] = word;
  }
  return words;
}

void PackBandWeights(const BandSpec& spec, const BandStorage& storage, std::vector<q_data_t>& packed) {
  AppendInputWeightMatrixPadded(storage.layer0_weight_ih, spec.packed_input_size, packed);
  AppendVector(storage.layer0_weight_hh, packed);
  AppendVector(storage.layer0_bias_ih, packed);
  AppendVector(storage.layer0_bn_mul, packed);
  AppendVector(storage.layer0_bn_add, packed);
  AppendInputWeightMatrixPadded(storage.layer1_weight_ih, kSbHiddenSize, packed);
  AppendVector(storage.layer1_weight_hh, packed);
  AppendVector(storage.layer1_bias_ih, packed);
  AppendVector(storage.layer1_bn_mul, packed);
  AppendVector(storage.layer1_bn_add, packed);
  AppendVector(storage.proj_weight, packed);
  AppendProjectionBiasPadded(storage.proj_bias, packed);
}

std::size_t InputIndex(int freq_index, int frame_index, int num_frames) {
  return static_cast<std::size_t>(freq_index) * num_frames + frame_index;
}

std::size_t DfIndex(int df_index, int freq_index, int frame_index, int complex_index, int df_order, int total_freqs,
                    int num_frames) {
  return static_cast<std::size_t>((((df_index * total_freqs + freq_index) * num_frames + frame_index) * 2) +
                                  complex_index);
}

axis_q610_t MakeAxis(q_data_t value, bool last) {
  axis_q610_t word;
  word.data.range(15, 0) = value.range(15, 0);
  word.keep = 3;
  word.strb = 3;
  word.last = last ? 1 : 0;
  return word;
}

q_data_t AxisToQ(axis_q610_t word) {
  q_data_t value;
  value.range(15, 0) = word.data.range(15, 0);
  return value;
}

void RunReferenceBand(
    const BandSpec& spec,
    const BandStorage& storage,
    const std::vector<q_data_t>& noisy_input,
    const std::vector<q_data_t>& fb_output,
    std::vector<q_data_t>& df_coef) {
  const int batch_size = 1;
  const int batch_subbands = spec.num_subbands * batch_size;
  std::vector<q_data_t> noisy_subbands(GetNoisySubbandsElementCount(spec, batch_size, kScenarioFrames));
  std::vector<q_data_t> fb_subbands(GetFbSubbandsElementCount(spec, batch_size, kScenarioFrames));
  std::vector<q_data_t> sb_input(GetSbInputElementCount(spec, batch_size, kScenarioFrames));
  std::vector<q_data_t> packed_input(GetPackedInputElementCount(spec, batch_size, kScenarioFrames));
  std::vector<q_data_t> sequence_input(GetSequenceElementCount(batch_subbands, spec.packed_input_size, kScenarioFrames));
  std::vector<q_data_t> layer0_hx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer0_cx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer0_output(GetSequenceElementCount(batch_subbands, kSbHiddenSize, kScenarioFrames));
  std::vector<q_data_t> layer1_hx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer1_cx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer1_output(GetSequenceElementCount(batch_subbands, kSbHiddenSize, kScenarioFrames));
  std::vector<q_data_t> projected_output(GetSequenceElementCount(batch_subbands, spec.proj_size, kScenarioFrames));
  df_coef.assign(GetDfCoefElementCount(spec, batch_size, kScenarioFrames), 0);

  FreqUnfoldQ610(spec, spec.nbr_freq, noisy_input.data(), batch_size, kScenarioFrames, noisy_subbands.data());
  FreqUnfoldQ610(spec, 0, fb_output.data(), batch_size, kScenarioFrames, fb_subbands.data());
  ConcatQ610(spec, noisy_subbands.data(), fb_subbands.data(), batch_size, kScenarioFrames, sb_input.data());
  PackQ610(spec, sb_input.data(), batch_size, kScenarioFrames, packed_input.data());
  PackedToSequenceQ610(packed_input.data(), batch_subbands, spec.packed_input_size, kScenarioFrames,
                       sequence_input.data());
  RunGSULayerQ610(sequence_input.data(), batch_subbands, kScenarioFrames, spec.packed_input_size, storage.view.layers[0],
                  layer0_hx.data(), layer0_cx.data(), layer0_output.data());
  RunGSULayerQ610(layer0_output.data(), batch_subbands, kScenarioFrames, kSbHiddenSize, storage.view.layers[1],
                  layer1_hx.data(), layer1_cx.data(), layer1_output.data());
  RunProjectionQ610(layer1_output.data(), batch_subbands, kScenarioFrames, spec.proj_size, storage.view.proj,
                    projected_output.data());
  ProjectToDfCoefQ610(spec, projected_output.data(), batch_size, kScenarioFrames, df_coef.data());
}

void BuildExpectedFrameOrder(
    const std::vector<q_data_t> band_df[3],
    std::vector<q_data_t>& expected) {
  expected.clear();
  expected.reserve(kScenarioFrames * kRealtimeDfCoefPerFrame);
  for (int frame_index = 0; frame_index < kScenarioFrames; ++frame_index) {
    for (int band_index = 0; band_index < 3; ++band_index) {
      const BandSpec& spec = GetBandSpec(band_index);
      const int total_freqs = spec.num_subbands * spec.ctr_freq;
      for (int df_index = 0; df_index < spec.df_order; ++df_index) {
        for (int freq_index = 0; freq_index < total_freqs; ++freq_index) {
          for (int complex_index = 0; complex_index < 2; ++complex_index) {
            expected.push_back(
                band_df[band_index][DfIndex(df_index, freq_index, frame_index, complex_index, spec.df_order,
                                            total_freqs, kScenarioFrames)]);
          }
        }
      }
    }
  }
}

bool RunRealtimeScenario(
    const char* name,
    const int* chunk_sizes,
    int num_chunks,
    const std::vector<q_data_t>& noisy_input,
    const std::vector<q_data_t>& fb_output,
    const std::vector<packed_weight_word_t>& weights,
    const std::vector<q_data_t>& expected) {
  hls::stream<axis_q610_t> noisy_stream;
  hls::stream<axis_q610_t> fb_stream;
  hls::stream<axis_q610_t> df_stream;
  std::vector<q_data_t> actual;
  actual.reserve(expected.size());

  int frame_base = 0;
  for (int chunk_index = 0; chunk_index < num_chunks; ++chunk_index) {
    const int chunk_frames = chunk_sizes[chunk_index];
    for (int local_frame = 0; local_frame < chunk_frames; ++local_frame) {
      const int global_frame = frame_base + local_frame;
      for (int freq_index = 0; freq_index < kNumFreqs; ++freq_index) {
        const bool last = (local_frame == (chunk_frames - 1)) && (freq_index == (kNumFreqs - 1));
        noisy_stream.write(MakeAxis(noisy_input[InputIndex(freq_index, global_frame, kScenarioFrames)], last));
      }
      for (int freq_index = 0; freq_index < kNumFreqs; ++freq_index) {
        const bool last = (local_frame == (chunk_frames - 1)) && (freq_index == (kNumFreqs - 1));
        fb_stream.write(MakeAxis(fb_output[InputIndex(freq_index, global_frame, kScenarioFrames)], last));
      }
    }

    SubbandRealtimeTopQ610Ip(noisy_stream, fb_stream, weights.data(), chunk_frames, chunk_index == 0, df_stream);

    for (int output_index = 0; output_index < chunk_frames * kRealtimeDfCoefPerFrame; ++output_index) {
      const axis_q610_t word = df_stream.read();
      const bool expected_last = output_index == (chunk_frames * kRealtimeDfCoefPerFrame - 1);
      if (static_cast<bool>(word.last) != expected_last) {
        std::cerr << name << " TLAST mismatch at chunk " << chunk_index << " output " << output_index << '\n';
        return false;
      }
      actual.push_back(AxisToQ(word));
    }
    frame_base += chunk_frames;
  }

  if (actual.size() != expected.size()) {
    std::cerr << name << " size mismatch: actual=" << actual.size() << " expected=" << expected.size() << '\n';
    return false;
  }

  for (std::size_t index = 0; index < expected.size(); ++index) {
    if (actual[index] != expected[index]) {
      std::cerr << name << " mismatch at " << index << ": actual=" << static_cast<int>(actual[index])
                << " expected=" << static_cast<int>(expected[index]) << '\n';
      return false;
    }
  }

  std::cout << name << " passed.\n";
  return true;
}

}  // namespace

int main() {
  static_assert(kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame + kBand2RealtimeDfCoefPerFrame ==
                    kRealtimeDfCoefPerFrame,
                "Realtime output frame size mismatch.");

  uint32_t rng_state = 0x31415926u;
  std::vector<q_data_t> noisy_input(kNumFreqs * kScenarioFrames);
  std::vector<q_data_t> fb_output(kNumFreqs * kScenarioFrames);
  FillVector(noisy_input, rng_state);
  FillVector(fb_output, rng_state);

  BandStorage band_storage[3];
  for (int band_index = 0; band_index < 3; ++band_index) {
    InitBandStorage(GetBandSpec(band_index), rng_state, band_storage[band_index]);
  }

  std::vector<q_data_t> weight_elements;
  weight_elements.reserve(kRealtimeWeightsElementCount);
  for (int band_index = 0; band_index < 3; ++band_index) {
    PackBandWeights(GetBandSpec(band_index), band_storage[band_index], weight_elements);
  }
  if (weight_elements.size() != static_cast<std::size_t>(kRealtimeWeightsElementCount)) {
    std::cerr << "Weight pack size mismatch: actual=" << weight_elements.size()
              << " expected=" << kRealtimeWeightsElementCount << '\n';
    return 1;
  }
  std::vector<packed_weight_word_t> weights = PackWeightWords(weight_elements);
  if (weights.size() != static_cast<std::size_t>(kRealtimeWeightsWordCount)) {
    std::cerr << "Packed weight word mismatch: actual=" << weights.size()
              << " expected=" << kRealtimeWeightsWordCount << '\n';
    return 1;
  }
  if (GetRealtimeBandWeightCount(kBand0PackedInputSize, kBand0ProjSize) != kBand0RealtimeWeightCount) {
    std::cerr << "Band0 weight count helper mismatch.\n";
    return 1;
  }

  std::vector<q_data_t> band_df[3];
  for (int band_index = 0; band_index < 3; ++band_index) {
    RunReferenceBand(GetBandSpec(band_index), band_storage[band_index], noisy_input, fb_output, band_df[band_index]);
  }

  std::vector<q_data_t> expected;
  BuildExpectedFrameOrder(band_df, expected);

  const int chunks_4[] = {4};
  const int chunks_2[] = {2, 2};
  const int chunks_1[] = {1, 1, 1, 1};
  if (!RunRealtimeScenario("chunk4", chunks_4, 1, noisy_input, fb_output, weights, expected)) {
    return 1;
  }
#ifndef SUBBAND_TB_CHUNK4_ONLY
  if (!RunRealtimeScenario("chunk2", chunks_2, 2, noisy_input, fb_output, weights, expected)) {
    return 1;
  }
  if (!RunRealtimeScenario("chunk1", chunks_1, 4, noisy_input, fb_output, weights, expected)) {
    return 1;
  }
#endif

  std::cout << "Realtime 3-band stream smoke test passed.\n";
  return 0;
}
