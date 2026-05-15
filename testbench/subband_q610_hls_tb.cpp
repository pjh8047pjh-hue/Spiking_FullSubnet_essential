#include "subband_ref_q610.hpp"

#include <cstddef>
#include <cstdint>
#include <iostream>
#include <vector>

namespace {

using subband_q610::BandSpec;
using subband_q610::BandWeightsQ610;
using subband_q610::GetBandSpec;
using subband_q610::GetDfCoefElementCount;
using subband_q610::GetFbSubbandsElementCount;
using subband_q610::GetNoisySubbandsElementCount;
using subband_q610::GetPackedInputElementCount;
using subband_q610::GetSbInputElementCount;
using subband_q610::GetSequenceElementCount;
using subband_q610::GetStateElementCount;
using subband_q610::RunBand0OptimizedSmokeQ610;
using subband_q610::RunBand0Q610;
using subband_q610::kBand0PackedInputSize;
using subband_q610::kBand0ProjSize;
using subband_q610::kNumFreqs;
using subband_q610::kQOne;
using subband_q610::kSbHiddenSize;
using subband_q610::q_data_t;

constexpr int kSmokeFrames = 8;

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

}  // namespace

int main() {
  const BandSpec& spec = GetBandSpec(0);
  const int batch_size = 1;
  const int batch_subbands = spec.num_subbands * batch_size;
  uint32_t rng_state = 0x12345678u;

  std::vector<q_data_t> noisy_input(kNumFreqs * kSmokeFrames);
  std::vector<q_data_t> fb_output(kNumFreqs * kSmokeFrames);
  std::vector<q_data_t> layer0_weight_ih(kSbHiddenSize * kBand0PackedInputSize);
  std::vector<q_data_t> layer0_weight_hh(kSbHiddenSize * kSbHiddenSize);
  std::vector<q_data_t> layer0_bias_ih(2 * kSbHiddenSize);
  std::vector<q_data_t> layer0_bn_mul(kSbHiddenSize);
  std::vector<q_data_t> layer0_bn_add(kSbHiddenSize);
  std::vector<q_data_t> layer1_weight_ih(kSbHiddenSize * kSbHiddenSize);
  std::vector<q_data_t> layer1_weight_hh(kSbHiddenSize * kSbHiddenSize);
  std::vector<q_data_t> layer1_bias_ih(2 * kSbHiddenSize);
  std::vector<q_data_t> layer1_bn_mul(kSbHiddenSize);
  std::vector<q_data_t> layer1_bn_add(kSbHiddenSize);
  std::vector<q_data_t> proj_weight(kBand0ProjSize * kSbHiddenSize);
  std::vector<q_data_t> proj_bias(kBand0ProjSize);

  FillVector(noisy_input, rng_state);
  FillVector(fb_output, rng_state);
  FillVector(layer0_weight_ih, rng_state);
  FillVector(layer0_weight_hh, rng_state);
  FillVector(layer0_bias_ih, rng_state);
  FillBatchNorm(layer0_bn_mul, layer0_bn_add);
  FillVector(layer1_weight_ih, rng_state);
  FillVector(layer1_weight_hh, rng_state);
  FillVector(layer1_bias_ih, rng_state);
  FillBatchNorm(layer1_bn_mul, layer1_bn_add);
  FillVector(proj_weight, rng_state);
  FillVector(proj_bias, rng_state);

  BandWeightsQ610 weights{};
  weights.layers[0] = {
      layer0_weight_ih.data(),
      layer0_weight_hh.data(),
      layer0_bias_ih.data(),
      layer0_bn_mul.data(),
      layer0_bn_add.data(),
  };
  weights.layers[1] = {
      layer1_weight_ih.data(),
      layer1_weight_hh.data(),
      layer1_bias_ih.data(),
      layer1_bn_mul.data(),
      layer1_bn_add.data(),
  };
  weights.proj = {
      proj_weight.data(),
      proj_bias.data(),
  };

  std::vector<q_data_t> noisy_subbands(GetNoisySubbandsElementCount(spec, batch_size, kSmokeFrames));
  std::vector<q_data_t> fb_subbands(GetFbSubbandsElementCount(spec, batch_size, kSmokeFrames));
  std::vector<q_data_t> sb_input(GetSbInputElementCount(spec, batch_size, kSmokeFrames));
  std::vector<q_data_t> packed_input(GetPackedInputElementCount(spec, batch_size, kSmokeFrames));
  std::vector<q_data_t> sequence_input(GetSequenceElementCount(batch_subbands, spec.packed_input_size, kSmokeFrames));
  std::vector<q_data_t> layer0_hx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer0_cx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer0_output(GetSequenceElementCount(batch_subbands, kSbHiddenSize, kSmokeFrames));
  std::vector<q_data_t> layer1_hx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer1_cx(GetStateElementCount(batch_subbands));
  std::vector<q_data_t> layer1_output(GetSequenceElementCount(batch_subbands, kSbHiddenSize, kSmokeFrames));
  std::vector<q_data_t> projected_output(GetSequenceElementCount(batch_subbands, spec.proj_size, kSmokeFrames));
  std::vector<q_data_t> reference_df(GetDfCoefElementCount(spec, batch_size, kSmokeFrames));
  std::vector<q_data_t> optimized_df(reference_df.size());

  RunBand0Q610(
      noisy_input.data(),
      fb_output.data(),
      batch_size,
      kSmokeFrames,
      weights,
      noisy_subbands.data(),
      fb_subbands.data(),
      sb_input.data(),
      packed_input.data(),
      sequence_input.data(),
      layer0_hx.data(),
      layer0_cx.data(),
      layer0_output.data(),
      layer1_hx.data(),
      layer1_cx.data(),
      layer1_output.data(),
      projected_output.data(),
      reference_df.data());

  RunBand0OptimizedSmokeQ610(
      noisy_input.data(),
      fb_output.data(),
      kSmokeFrames,
      layer0_weight_ih.data(),
      layer0_weight_hh.data(),
      layer0_bias_ih.data(),
      layer0_bn_mul.data(),
      layer0_bn_add.data(),
      layer1_weight_ih.data(),
      layer1_weight_hh.data(),
      layer1_bias_ih.data(),
      layer1_bn_mul.data(),
      layer1_bn_add.data(),
      proj_weight.data(),
      proj_bias.data(),
      optimized_df.data());

  for (std::size_t index = 0; index < reference_df.size(); ++index) {
    if (reference_df[index] != optimized_df[index]) {
      std::cerr << "Mismatch at " << index << ": ref=" << static_cast<int>(reference_df[index])
                << " opt=" << static_cast<int>(optimized_df[index]) << '\n';
      return 1;
    }
  }

  std::cout << "Band0 optimized smoke test passed for " << kSmokeFrames << " frames.\n";
  return 0;
}
