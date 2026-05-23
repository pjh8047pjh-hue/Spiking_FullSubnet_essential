#include "subband_ref_q610.hpp"

#include <array>
#include <cstdlib>
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <vector>
#ifdef USE_PROJECTION_EXTERNAL
#include <thread>
#include "ap_int.h"
#endif

namespace {

using subband_q610::axis_q610_t;
using subband_q610::BandSpec;
using subband_q610::BandWeightsQ610;
using subband_q610::ConcatQ610;
using subband_q610::FreqUnfoldQ610;
using subband_q610::GetBandSpec;
using subband_q610::GetDfCoefElementCount;
using subband_q610::GetFbSubbandsElementCount;
using subband_q610::GetNoisySubbandsElementCount;
using subband_q610::GetPackedInputElementCount;
using subband_q610::GetRealtimeBandWeightCount;
using subband_q610::GetSbInputElementCount;
using subband_q610::GetSequenceElementCount;
using subband_q610::GetStateElementCount;
using subband_q610::PackQ610;
using subband_q610::PackedToSequenceQ610;
using subband_q610::ProjectToDfCoefQ610;
using subband_q610::RoundUpRealtimeWeightElements;
using subband_q610::RunGSULayerQ610;
using subband_q610::RunProjectionQ610;
using subband_q610::kBand0PackedInputSize;
using subband_q610::kBand0ProjSize;
using subband_q610::kBand0RealtimeDfCoefPerFrame;
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
using subband_q610::q_data_t;

constexpr int kScenarioFrames = 4;
constexpr int kNumSeeds = 32;
constexpr int kNumProfiles = 5;
constexpr int kNumChunkPatterns = 5;
constexpr int kMaxMismatchPrints = 20;

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

struct ChunkPattern {
  const char* name;
  int chunks[4];
  int count;
};

struct OutputCoord {
  int frame;
  int band;
  int df;
  int freq;
  int complex;
};

struct CoverageStats {
  long long primary_scenarios = 0;
  long long reset_replay_scenarios = 0;
  long long df_elements_compared = 0;
  long long df_mismatches = 0;
  long long tlast_mismatches = 0;
  long long size_mismatches = 0;
  long long extra_output_errors = 0;
};

const ChunkPattern kChunkPatterns[kNumChunkPatterns] = {
    {"chunk4", {4, 0, 0, 0}, 1},
    {"chunk2_2", {2, 2, 0, 0}, 2},
    {"chunk1_1_1_1", {1, 1, 1, 1}, 4},
    {"chunk3_1", {3, 1, 0, 0}, 2},
    {"chunk1_3", {1, 3, 0, 0}, 2},
};

const char* kProfileNames[kNumProfiles] = {
    "small_random",
    "full_input_zero_recurrent",
    "sparse_identity_bn",
    "alternating_nontrivial_bn",
    "edge_projection_bias",
};

uint32_t NextU32(uint32_t& state) {
  state = (1664525u * state) + 1013904223u;
  return state;
}

q_data_t ToQ(int32_t value) {
  return static_cast<q_data_t>(static_cast<int16_t>(value));
}

q_data_t SmallRandomQ610(uint32_t& state) {
  return ToQ((static_cast<int32_t>((NextU32(state) >> 24) & 0x7f) - 64) * 4);
}

q_data_t MediumRandomQ610(uint32_t& state) {
  return ToQ((static_cast<int32_t>((NextU32(state) >> 23) & 0xff) - 128) * 8);
}

q_data_t FullRandomQ610(uint32_t& state) {
  return ToQ(static_cast<int16_t>(NextU32(state) >> 16));
}

q_data_t EdgeValueQ610(uint32_t& state, std::size_t index) {
  static const int16_t kValues[] = {
      -32768, -24576, -16384, -8192, -1024, 0, 1024, 8192, 16384, 24576, 32767,
  };
  const std::size_t value_index = (index + (NextU32(state) & 0x3u)) % (sizeof(kValues) / sizeof(kValues[0]));
  return ToQ(kValues[value_index]);
}

void FillInputVector(std::vector<q_data_t>& values, int profile_index, uint32_t& state, bool feedback_path) {
  for (std::size_t index = 0; index < values.size(); ++index) {
    q_data_t value = 0;
    switch (profile_index) {
      case 0:
        value = SmallRandomQ610(state);
        break;
      case 1:
        value = FullRandomQ610(state);
        break;
      case 2:
        value = ((NextU32(state) & 0x7u) < 6u) ? ToQ(0) : MediumRandomQ610(state);
        break;
      case 3: {
        const int sign = ((index + (feedback_path ? 1u : 0u)) & 1u) ? -1 : 1;
        value = ToQ((sign * 1024) + static_cast<int32_t>((NextU32(state) >> 28) & 0xf) - 8);
        break;
      }
      default:
        value = EdgeValueQ610(state, index);
        break;
    }
    values[index] = value;
  }
}

void ResizeBandStorage(const BandSpec& spec, BandStorage& storage) {
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
}

void FillRandomVector(std::vector<q_data_t>& values, uint32_t& state, bool medium) {
  for (q_data_t& value : values) {
    value = medium ? MediumRandomQ610(state) : SmallRandomQ610(state);
  }
}

void FillZeroVector(std::vector<q_data_t>& values) {
  for (q_data_t& value : values) {
    value = 0;
  }
}

void FillIdentityBatchNorm(std::vector<q_data_t>& mul, std::vector<q_data_t>& add) {
  for (q_data_t& value : mul) {
    value = kQOne;
  }
  FillZeroVector(add);
}

void FillNontrivialBatchNorm(std::vector<q_data_t>& mul, std::vector<q_data_t>& add, uint32_t& state) {
  for (q_data_t& value : mul) {
    const int32_t offset = static_cast<int32_t>((NextU32(state) >> 25) & 0x7f) - 64;
    value = ToQ(1024 + (offset * 4));
  }
  for (q_data_t& value : add) {
    value = ToQ((static_cast<int32_t>((NextU32(state) >> 24) & 0x7f) - 64) * 8);
  }
}

void FillProjectionBiasStress(std::vector<q_data_t>& bias, uint32_t& state) {
  for (std::size_t index = 0; index < bias.size(); ++index) {
    bias[index] = EdgeValueQ610(state, index);
  }
}

void BindBandStorage(BandStorage& storage) {
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

void InitBandStorage(const BandSpec& spec, int profile_index, uint32_t& state, BandStorage& storage) {
  ResizeBandStorage(spec, storage);

  const bool medium_input_weights = (profile_index == 1) || (profile_index == 4);
  FillRandomVector(storage.layer0_weight_ih, state, medium_input_weights);
  FillRandomVector(storage.layer1_weight_ih, state, medium_input_weights);

  if (profile_index == 1) {
    FillZeroVector(storage.layer0_weight_hh);
    FillZeroVector(storage.layer1_weight_hh);
  } else {
    FillRandomVector(storage.layer0_weight_hh, state, false);
    FillRandomVector(storage.layer1_weight_hh, state, false);
  }

  FillRandomVector(storage.layer0_bias_ih, state, false);
  FillRandomVector(storage.layer1_bias_ih, state, false);

  if (profile_index == 3) {
    FillNontrivialBatchNorm(storage.layer0_bn_mul, storage.layer0_bn_add, state);
    FillNontrivialBatchNorm(storage.layer1_bn_mul, storage.layer1_bn_add, state);
  } else {
    FillIdentityBatchNorm(storage.layer0_bn_mul, storage.layer0_bn_add);
    FillIdentityBatchNorm(storage.layer1_bn_mul, storage.layer1_bn_add);
  }

  FillRandomVector(storage.proj_weight, state, profile_index == 4);
  if (profile_index == 4) {
    FillProjectionBiasStress(storage.proj_bias, state);
  } else {
    FillRandomVector(storage.proj_bias, state, false);
  }

  BindBandStorage(storage);
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

std::size_t DfIndex(
    int df_index,
    int freq_index,
    int frame_index,
    int complex_index,
    int total_freqs,
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

void BuildExpectedFrameOrder(const std::vector<q_data_t> band_df[3], std::vector<q_data_t>& expected) {
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
                band_df[band_index][DfIndex(df_index, freq_index, frame_index, complex_index, total_freqs,
                                            kScenarioFrames)]);
          }
        }
      }
    }
  }
}

OutputCoord DecodeOutputIndex(std::size_t output_index) {
  OutputCoord coord = {0, 0, 0, 0, 0};
  coord.frame = static_cast<int>(output_index / kRealtimeDfCoefPerFrame);
  int local = static_cast<int>(output_index % kRealtimeDfCoefPerFrame);
  if (local >= kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame) {
    coord.band = 2;
    local -= kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame;
  } else if (local >= kBand0RealtimeDfCoefPerFrame) {
    coord.band = 1;
    local -= kBand0RealtimeDfCoefPerFrame;
  }

  const BandSpec& spec = GetBandSpec(coord.band);
  const int total_freqs = spec.num_subbands * spec.ctr_freq;
  coord.complex = local % 2;
  local /= 2;
  coord.freq = local % total_freqs;
  local /= total_freqs;
  coord.df = local;
  return coord;
}

void PrintValueMismatch(
    int seed_index,
    int profile_index,
    const char* pattern_name,
    int chunk_index,
    std::size_t output_index,
    q_data_t actual,
    q_data_t expected) {
  const OutputCoord coord = DecodeOutputIndex(output_index);
  std::cerr << "df_coef mismatch"
            << " seed=" << seed_index
            << " profile=" << kProfileNames[profile_index]
            << " pattern=" << pattern_name
            << " chunk=" << chunk_index
            << " output_index=" << output_index
            << " frame=" << coord.frame
            << " band=" << coord.band
            << " df=" << coord.df
            << " freq=" << coord.freq
            << " complex=" << coord.complex
            << " actual=" << static_cast<int>(actual)
            << " expected=" << static_cast<int>(expected) << '\n';
}

#ifdef USE_PROJECTION_EXTERNAL
// C단계 외부 projection IP 모사 (subband_realtime_hls_tb.cpp와 동일 프로토콜)
inline int ProjectionDotCountPerChunkQ610(int frames) {
  using subband_q610::kBand0NumSubbands;
  using subband_q610::kBand1NumSubbands;
  using subband_q610::kBand2NumSubbands;
  using subband_q610::kBand0ProjSize;
  using subband_q610::kBand1ProjSize;
  using subband_q610::kBand2ProjSize;
  return frames * (kBand0ProjSize * kBand0NumSubbands +
                   kBand1ProjSize * kBand1NumSubbands +
                   kBand2ProjSize * kBand2NumSubbands);
}

void ExternalProjectionIpThreadQ610(
    hls::stream<axis_q610_t>* request_stream,
    hls::stream<axis_q610_t>* response_stream,
    int dot_count) {
  using subband_q610::kSbHiddenSize;
  using subband_q610::accum_q_t;
  for (int dot = 0; dot < dot_count; ++dot) {
    q_data_t input_lanes[kSbHiddenSize];
    q_data_t proj_row[kSbHiddenSize];
    for (int i = 0; i < kSbHiddenSize; ++i) {
      input_lanes[i] = AxisToQ(request_stream->read());
    }
    for (int i = 0; i < kSbHiddenSize; ++i) {
      proj_row[i] = AxisToQ(request_stream->read());
    }
    accum_q_t acc = 0;
    for (int i = 0; i < kSbHiddenSize; ++i) {
      acc += static_cast<accum_q_t>(input_lanes[i]) * static_cast<accum_q_t>(proj_row[i]);
    }
    q_data_t lo, mid, hi;
    lo.range(15, 0) = acc.range(15, 0);
    mid.range(15, 0) = acc.range(31, 16);
    hi.range(15, 0) = acc.range(47, 32);
    response_stream->write(MakeAxis(lo, false));
    response_stream->write(MakeAxis(mid, false));
    response_stream->write(MakeAxis(hi, true));
  }
}
#endif  // USE_PROJECTION_EXTERNAL

bool RunRealtimePattern(
    int seed_index,
    int profile_index,
    const ChunkPattern& pattern,
    bool count_as_reset_replay,
    const std::vector<q_data_t>& noisy_input,
    const std::vector<q_data_t>& fb_output,
    const std::vector<packed_weight_word_t>& weights,
    const std::vector<q_data_t>& expected,
    CoverageStats& stats) {
  hls::stream<axis_q610_t> noisy_stream;
  hls::stream<axis_q610_t> fb_stream;
  hls::stream<axis_q610_t> df_stream;

  std::size_t global_output_index = 0;
  int frame_base = 0;
  int mismatch_prints = 0;
  bool failed = false;

  for (int chunk_index = 0; chunk_index < pattern.count; ++chunk_index) {
    const int chunk_frames = pattern.chunks[chunk_index];
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

#ifdef USE_PROJECTION_EXTERNAL
    // csim에서 cpp가 stream 통신을 우회(직접 dot product 호출)하므로 stream은 empty placeholder
    hls::stream<axis_q610_t> projection_request_stream;
    hls::stream<axis_q610_t> projection_response_stream;
    SubbandRealtimeTopQ610Ip(noisy_stream, fb_stream, weights.data(), chunk_frames, chunk_index == 0,
                              projection_request_stream, projection_response_stream, df_stream);
#else
    SubbandRealtimeTopQ610Ip(noisy_stream, fb_stream, weights.data(), chunk_frames, chunk_index == 0, df_stream);
#endif

    const int chunk_output_count = chunk_frames * kRealtimeDfCoefPerFrame;
    for (int output_index = 0; output_index < chunk_output_count; ++output_index) {
      const axis_q610_t word = df_stream.read();
      const bool expected_last = output_index == (chunk_output_count - 1);
      if (static_cast<bool>(word.last) != expected_last) {
        ++stats.tlast_mismatches;
        failed = true;
        if (mismatch_prints < kMaxMismatchPrints) {
          std::cerr << "TLAST mismatch"
                    << " seed=" << seed_index
                    << " profile=" << kProfileNames[profile_index]
                    << " pattern=" << pattern.name
                    << " chunk=" << chunk_index
                    << " output=" << output_index
                    << " actual=" << static_cast<int>(word.last)
                    << " expected=" << static_cast<int>(expected_last) << '\n';
          ++mismatch_prints;
        }
      }

      const q_data_t actual_value = AxisToQ(word);
      const q_data_t expected_value = expected[global_output_index];
      ++stats.df_elements_compared;
      if (actual_value != expected_value) {
        ++stats.df_mismatches;
        failed = true;
        if (mismatch_prints < kMaxMismatchPrints) {
          PrintValueMismatch(seed_index, profile_index, pattern.name, chunk_index, global_output_index, actual_value,
                             expected_value);
          ++mismatch_prints;
        }
      }
      ++global_output_index;
    }

    if (!df_stream.empty()) {
      ++stats.extra_output_errors;
      failed = true;
      if (mismatch_prints < kMaxMismatchPrints) {
        std::cerr << "extra df stream output after chunk"
                  << " seed=" << seed_index
                  << " profile=" << kProfileNames[profile_index]
                  << " pattern=" << pattern.name
                  << " chunk=" << chunk_index << '\n';
        ++mismatch_prints;
      }
    }

    frame_base += chunk_frames;
  }

  if (global_output_index != expected.size()) {
    ++stats.size_mismatches;
    failed = true;
    std::cerr << "output count mismatch"
              << " seed=" << seed_index
              << " profile=" << kProfileNames[profile_index]
              << " pattern=" << pattern.name
              << " actual=" << global_output_index
              << " expected=" << expected.size() << '\n';
  }

  if (count_as_reset_replay) {
    ++stats.reset_replay_scenarios;
  } else {
    ++stats.primary_scenarios;
  }
  return !failed;
}

bool BuildWeights(
    int seed_index,
    int profile_index,
    BandStorage band_storage[3],
    std::vector<packed_weight_word_t>& packed_words) {
  uint32_t rng_state = 0xC001D00Du ^ (static_cast<uint32_t>(seed_index) * 0x9E3779B9u) ^
                       (static_cast<uint32_t>(profile_index) * 0x85EBCA6Bu);

  for (int band_index = 0; band_index < 3; ++band_index) {
    InitBandStorage(GetBandSpec(band_index), profile_index, rng_state, band_storage[band_index]);
  }

  std::vector<q_data_t> weight_elements;
  weight_elements.reserve(kRealtimeWeightsElementCount);
  for (int band_index = 0; band_index < 3; ++band_index) {
    PackBandWeights(GetBandSpec(band_index), band_storage[band_index], weight_elements);
  }
  if (weight_elements.size() != static_cast<std::size_t>(kRealtimeWeightsElementCount)) {
    std::cerr << "Weight pack size mismatch: actual=" << weight_elements.size()
              << " expected=" << kRealtimeWeightsElementCount << '\n';
    return false;
  }

  packed_words = PackWeightWords(weight_elements);
  if (packed_words.size() != static_cast<std::size_t>(kRealtimeWeightsWordCount)) {
    std::cerr << "Packed weight word mismatch: actual=" << packed_words.size()
              << " expected=" << kRealtimeWeightsWordCount << '\n';
    return false;
  }
  return true;
}

void BuildInputs(
    int seed_index,
    int profile_index,
    std::vector<q_data_t>& noisy_input,
    std::vector<q_data_t>& fb_output) {
  uint32_t rng_state = 0x31415926u ^ (static_cast<uint32_t>(seed_index) * 0x7F4A7C15u) ^
                       (static_cast<uint32_t>(profile_index) * 0x94D049BBu);
  noisy_input.assign(kNumFreqs * kScenarioFrames, 0);
  fb_output.assign(kNumFreqs * kScenarioFrames, 0);
  FillInputVector(noisy_input, profile_index, rng_state, false);
  FillInputVector(fb_output, profile_index, rng_state, true);
}

bool BuildExpected(
    const BandStorage band_storage[3],
    const std::vector<q_data_t>& noisy_input,
    const std::vector<q_data_t>& fb_output,
    std::vector<q_data_t>& expected) {
  std::vector<q_data_t> band_df[3];
  for (int band_index = 0; band_index < 3; ++band_index) {
    RunReferenceBand(GetBandSpec(band_index), band_storage[band_index], noisy_input, fb_output, band_df[band_index]);
  }
  BuildExpectedFrameOrder(band_df, expected);
  if (expected.size() != static_cast<std::size_t>(kScenarioFrames * kRealtimeDfCoefPerFrame)) {
    std::cerr << "Expected output count mismatch: actual=" << expected.size()
              << " expected=" << (kScenarioFrames * kRealtimeDfCoefPerFrame) << '\n';
    return false;
  }
  return true;
}

int GetEnvIntClamped(const char* name, int default_value, int min_value, int max_value) {
  const char* value_text = std::getenv(name);
  if (value_text == nullptr || value_text[0] == '\0') {
    return default_value;
  }
  int value = std::atoi(value_text);
  if (value < min_value) {
    value = min_value;
  }
  if (value > max_value) {
    value = max_value;
  }
  return value;
}

}  // namespace

int main() {
  static_assert(kRealtimeChunkFrames == kScenarioFrames, "Coverage test expects the realtime max chunk size.");
  static_assert(kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame + kBand2RealtimeDfCoefPerFrame ==
                    kRealtimeDfCoefPerFrame,
                "Realtime output frame size mismatch.");
  static_assert(kRealtimeDfCoefPerFrame == 1152, "Expected realtime df_coef elements per frame.");
  static_assert(GetRealtimeBandWeightCount(kBand0PackedInputSize, kBand0ProjSize) == kBand0RealtimeWeightCount,
                "Band0 weight count helper mismatch.");

  CoverageStats stats;
  bool pass = true;
  const int seed_begin = GetEnvIntClamped("SUBBAND_COVERAGE_SEED_BEGIN", 0, 0, kNumSeeds);
  int seed_end = GetEnvIntClamped("SUBBAND_COVERAGE_SEED_END", kNumSeeds, 0, kNumSeeds);
  if (seed_end < seed_begin) {
    seed_end = seed_begin;
  }

  for (int seed_index = seed_begin; seed_index < seed_end; ++seed_index) {
    for (int profile_index = 0; profile_index < kNumProfiles; ++profile_index) {
      std::vector<q_data_t> noisy_input;
      std::vector<q_data_t> fb_output;
      BuildInputs(seed_index, profile_index, noisy_input, fb_output);

      BandStorage band_storage[3];
      std::vector<packed_weight_word_t> weights;
      if (!BuildWeights(seed_index, profile_index, band_storage, weights)) {
        return 1;
      }

      std::vector<q_data_t> expected;
      if (!BuildExpected(band_storage, noisy_input, fb_output, expected)) {
        return 1;
      }

      for (int pattern_index = 0; pattern_index < kNumChunkPatterns; ++pattern_index) {
        if (!RunRealtimePattern(seed_index, profile_index, kChunkPatterns[pattern_index], false, noisy_input, fb_output,
                                weights, expected, stats)) {
          pass = false;
          break;
        }
      }

      if (pass) {
        if (!RunRealtimePattern(seed_index, profile_index, kChunkPatterns[0], true, noisy_input, fb_output, weights,
                                expected, stats)) {
          pass = false;
        }
      }

      std::cout << "coverage progress seed=" << seed_index
                << " profile=" << kProfileNames[profile_index]
                << " status=" << (pass ? "ok" : "failed") << '\n';
      if (!pass) {
        break;
      }
    }
    if (!pass) {
      break;
    }
  }

  const long long total_scenarios = stats.primary_scenarios + stats.reset_replay_scenarios;
  std::cout << "COVERAGE SUMMARY\n";
  std::cout << "seeds=" << kNumSeeds << '\n';
  std::cout << "seed_begin=" << seed_begin << '\n';
  std::cout << "seed_end=" << seed_end << '\n';
  std::cout << "seeds_executed=" << (seed_end - seed_begin) << '\n';
  std::cout << "profiles=" << kNumProfiles << '\n';
  std::cout << "chunk_patterns=" << kNumChunkPatterns << '\n';
  std::cout << "primary_scenarios=" << stats.primary_scenarios << '\n';
  std::cout << "reset_replay_scenarios=" << stats.reset_replay_scenarios << '\n';
  std::cout << "total_scenarios=" << total_scenarios << '\n';
  std::cout << "df_coef_elements_compared=" << stats.df_elements_compared << '\n';
  std::cout << "df_coef_mismatches=" << stats.df_mismatches << '\n';
  std::cout << "tlast_mismatches=" << stats.tlast_mismatches << '\n';
  std::cout << "size_mismatches=" << stats.size_mismatches << '\n';
  std::cout << "extra_output_errors=" << stats.extra_output_errors << '\n';
  std::cout << "result=" << (pass ? "PASS" : "FAIL") << '\n';

  if (!pass || stats.df_mismatches != 0 || stats.tlast_mismatches != 0 || stats.size_mismatches != 0 ||
      stats.extra_output_errors != 0) {
    return 1;
  }

  std::cout << "Realtime df_coef high-coverage golden comparison passed.\n";
  return 0;
}
