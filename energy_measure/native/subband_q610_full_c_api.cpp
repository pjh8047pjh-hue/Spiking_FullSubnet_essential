#include "subband_ref_q610.hpp"

#include <cstdint>
#include <exception>
#include <vector>

namespace {

bool HasNullPointer(const int16_t* const* pointers, int count) {
  for (int index = 0; index < count; ++index) {
    if (pointers[index] == nullptr) {
      return true;
    }
  }
  return false;
}

}  // namespace

extern "C" int run_full_band_q610(
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
    if (band_index < 0 || band_index >= subband_q610::kNumBands || batch_size <= 0 || num_frames <= 0) {
      return 3;
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

    const subband_q610::BandSpec& spec = subband_q610::GetBandSpec(band_index);
    const int batch_subbands = batch_size * spec.num_subbands;

    std::vector<int16_t> noisy_subbands(subband_q610::GetNoisySubbandsElementCount(spec, batch_size, num_frames));
    std::vector<int16_t> fb_subbands(subband_q610::GetFbSubbandsElementCount(spec, batch_size, num_frames));
    std::vector<int16_t> sb_input(subband_q610::GetSbInputElementCount(spec, batch_size, num_frames));
    std::vector<int16_t> packed_input(subband_q610::GetPackedInputElementCount(spec, batch_size, num_frames));
    std::vector<int16_t> sequence_input(
        subband_q610::GetSequenceElementCount(batch_subbands, spec.packed_input_size, num_frames));
    std::vector<int16_t> layer0_hx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer0_cx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer0_output(
        subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
    std::vector<int16_t> layer1_hx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer1_cx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer1_output(
        subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
    std::vector<int16_t> projected_output(
        subband_q610::GetSequenceElementCount(batch_subbands, spec.proj_size, num_frames));

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

    subband_q610::RunBandQ610(
        spec,
        noisy_input_q610,
        fb_output_q610,
        batch_size,
        num_frames,
        weights,
        noisy_subbands.data(),
        fb_subbands.data(),
        sb_input.data(),
        packed_input.data(),
        sequence_input.data(),
        layer0_hx_state.data(),
        layer0_cx_state.data(),
        layer0_output.data(),
        layer1_hx_state.data(),
        layer1_cx_state.data(),
        layer1_output.data(),
        projected_output.data(),
        df_coef_q610);
    return 0;
  } catch (const std::exception&) {
    return 100;
  } catch (...) {
    return 101;
  }
}
