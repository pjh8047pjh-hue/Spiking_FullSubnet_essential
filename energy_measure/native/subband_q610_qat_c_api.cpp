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

extern "C" int run_qat_subband_sequence_q610(
    int band_index,
    int batch_size,
    int num_frames,
    int num_subbands,
    int ctr_freq,
    int df_order,
    int input_size,
    int proj_size,
    const int16_t* sequence_input_q610,
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
    if (batch_size <= 0 || num_frames <= 0 || num_subbands <= 0 || ctr_freq <= 0 || df_order <= 0 ||
        input_size <= 0 || proj_size <= 0) {
      return 3;
    }
    if (proj_size != 2 * ctr_freq * df_order) {
      return 4;
    }

    const int16_t* required_pointers[] = {
        sequence_input_q610,
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

    const int batch_subbands = batch_size * num_subbands;
    std::vector<int16_t> layer0_hx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer0_cx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer0_output(
        subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
    std::vector<int16_t> layer1_hx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer1_cx_state(subband_q610::GetStateElementCount(batch_subbands));
    std::vector<int16_t> layer1_output(
        subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
    std::vector<int16_t> projected_output(
        subband_q610::GetSequenceElementCount(batch_subbands, proj_size, num_frames));

    subband_q610::ClearBufferQ610(layer0_hx_state.data(), layer0_hx_state.size());
    subband_q610::ClearBufferQ610(layer0_cx_state.data(), layer0_cx_state.size());
    subband_q610::ClearBufferQ610(layer1_hx_state.data(), layer1_hx_state.size());
    subband_q610::ClearBufferQ610(layer1_cx_state.data(), layer1_cx_state.size());

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
    const subband_q610::LinearWeightsQ610 proj_weights = {proj_weight_q610, proj_bias_q610};

    subband_q610::RunGSULayerQ610(
        sequence_input_q610,
        batch_subbands,
        num_frames,
        input_size,
        layer0_weights,
        layer0_hx_state.data(),
        layer0_cx_state.data(),
        layer0_output.data());

    subband_q610::RunGSULayerQ610(
        layer0_output.data(),
        batch_subbands,
        num_frames,
        subband_q610::kSbHiddenSize,
        layer1_weights,
        layer1_hx_state.data(),
        layer1_cx_state.data(),
        layer1_output.data());

    subband_q610::RunProjectionQ610(
        layer1_output.data(),
        batch_subbands,
        num_frames,
        proj_size,
        proj_weights,
        projected_output.data());

    const subband_q610::BandSpec spec = {
        band_index,
        0,
        0,
        ctr_freq,
        0,
        df_order,
        num_subbands,
        input_size - ctr_freq,
        ctr_freq,
        input_size,
        proj_size,
    };
    subband_q610::ProjectToDfCoefQ610(spec, projected_output.data(), batch_size, num_frames, df_coef_q610);
    return 0;
  } catch (const std::exception&) {
    return 100;
  } catch (...) {
    return 101;
  }
}
