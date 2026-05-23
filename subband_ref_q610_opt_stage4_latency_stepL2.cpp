#include "subband_ref_q610.hpp"

#include <cassert>
#include <cstdint>
#include <limits>
#include <iostream>

#if defined(USE_SV_GSU_FULL_USE_HLS_PROJECTION) && !defined(USE_SV_GSU_FULL_HLS_PROJECTION)
#define USE_SV_GSU_FULL_HLS_PROJECTION 1
#endif

namespace {

using SvQDataT = subband_q610::q_data_t;
using SvAccumT = subband_q610::accum_q_t;
using SvPack32T = subband_q610::q_pack32_t;
using SvPackedWeightWordT = subband_q610::packed_weight_word_t;
constexpr int kSvGsuHiddenGroupPar = 2;

SvQDataT SvGetPack32LaneQ610(const SvPack32T& word, int lane) {
  SvQDataT value;
  value.range(15, 0) = word.range((lane * 16) + 15, lane * 16);
  return value;
}

void SvSetPack32LaneQ610(SvPack32T& word, int lane, SvQDataT value) {
  word.range((lane * 16) + 15, lane * 16) = value.range(15, 0);
}

SvQDataT SvExtractPackedWeightWordLaneQ610(const SvPackedWeightWordT& word, int lane) {
  SvQDataT value;
  value.range(15, 0) = word.range((lane * 16) + 15, lane * 16);
  return value;
}

SvQDataT SvLoadPackedWeightElementQ610(
    const SvPackedWeightWordT weights_q610[subband_q610::kRealtimeWeightsWordCount],
    int element_offset) {
  return SvExtractPackedWeightWordLaneQ610(
      weights_q610[element_offset / subband_q610::kRealtimeWeightWordLanes],
      element_offset % subband_q610::kRealtimeWeightWordLanes);
}

SvPack32T SvLoadPackedWeightTileQ610(
    const SvPackedWeightWordT weights_q610[subband_q610::kRealtimeWeightsWordCount],
    int element_offset) {
  SvPack32T tile = 0;
  const SvPackedWeightWordT word_lo =
      weights_q610[element_offset / subband_q610::kRealtimeWeightWordLanes];
  const SvPackedWeightWordT word_hi =
      weights_q610[(element_offset + subband_q610::kRealtimeWeightWordLanes) /
                   subband_q610::kRealtimeWeightWordLanes];
  tile.range(255, 0) = word_lo.range(255, 0);
  tile.range(511, 256) = word_hi.range(255, 0);
  return tile;
}

int SvSeqTileIndexQ610(int frame_index, int subband_index, int tile_index) {
  return (((frame_index * subband_q610::kMaxNumSubbands) + subband_index) * subband_q610::kSvGsuHiddenTiles) +
         tile_index;
}

int SvStateTileIndexQ610(int state_subband_index, int tile_index) {
  return (state_subband_index * subband_q610::kSvGsuHiddenTiles) + tile_index;
}

int SvWeightTileIndexQ610(int hidden_index, int tile_index) {
  return (hidden_index * subband_q610::kSvGsuHiddenTiles) + tile_index;
}

SvQDataT SvSaturateInt16Q610(SvAccumT value) {
  if (value > static_cast<SvAccumT>(32767)) {
    return static_cast<SvQDataT>(32767);
  }
  if (value < static_cast<SvAccumT>(-32768)) {
    return static_cast<SvQDataT>(-32768);
  }
  return static_cast<SvQDataT>(value);
}

SvAccumT SvRoundShiftRightQ610(SvAccumT value, int shift_bits) {
  if (shift_bits <= 0) {
    return value;
  }
  const SvAccumT half = static_cast<SvAccumT>(1) << (shift_bits - 1);
  if (value >= 0) {
    return (value + half) >> shift_bits;
  }
  const SvAccumT magnitude = -value;
  return -((magnitude + half) >> shift_bits);
}

SvQDataT SvAddQ610(SvQDataT lhs, SvQDataT rhs) {
  return SvSaturateInt16Q610(static_cast<SvAccumT>(lhs) + static_cast<SvAccumT>(rhs));
}

SvQDataT SvSubQ610(SvQDataT lhs, SvQDataT rhs) {
  return SvSaturateInt16Q610(static_cast<SvAccumT>(lhs) - static_cast<SvAccumT>(rhs));
}

SvAccumT SvMulForMacQ610(SvQDataT lhs, SvQDataT rhs) {
  return static_cast<SvAccumT>(lhs) * static_cast<SvAccumT>(rhs);
}

SvQDataT SvMulQ610(SvQDataT lhs, SvQDataT rhs) {
  const SvAccumT product_q20 = static_cast<SvAccumT>(lhs) * static_cast<SvAccumT>(rhs);
  return SvSaturateInt16Q610(SvRoundShiftRightQ610(product_q20, subband_q610::kQFrac));
}

SvQDataT SvStepActivationQ610(SvQDataT input_value) {
  return (input_value >= 0) ? static_cast<SvQDataT>(subband_q610::kQScale) : static_cast<SvQDataT>(0);
}

int SvSigmoidKnotQ610(int index) {
  static const int kKnots[subband_q610::kSvGsuTileLanes / 2 + 1] = {
      0, 256, 512, 768, 1024, 1280, 1536, 1792, 2048, 2560, 3072, 3584, 4096, 5120, 6144, 7168, 8192,
  };
  return kKnots[index];
}

int SvSigmoidValueQ610(int index) {
  static const int kValues[subband_q610::kSvGsuTileLanes / 2 + 1] = {
      512, 576, 637, 695, 749, 796, 837, 872, 902, 946, 975, 994, 1006, 1017, 1021, 1023, 1024,
  };
  return kValues[index];
}

SvQDataT SvSigmoidPwlQ610(SvQDataT input_value_q610) {
  constexpr int kSegments = subband_q610::kSvGsuTileLanes / 2;
  if (input_value_q610 >= static_cast<SvQDataT>(SvSigmoidKnotQ610(kSegments))) {
    return static_cast<SvQDataT>(subband_q610::kQScale);
  }
  if (input_value_q610 <= static_cast<SvQDataT>(-SvSigmoidKnotQ610(kSegments))) {
    return static_cast<SvQDataT>(0);
  }

  const bool is_negative = input_value_q610 < 0;
  const int abs_input_int = is_negative ? -static_cast<int>(input_value_q610) : static_cast<int>(input_value_q610);
  int segment_index = 0;
  if (abs_input_int <= 256) {
    segment_index = 0;
  } else if (abs_input_int <= 2048) {
    segment_index = (abs_input_int - 1) >> 8;
  } else if (abs_input_int <= 4096) {
    segment_index = 8 + ((abs_input_int - 2049) >> 9);
  } else {
    segment_index = 12 + ((abs_input_int - 4097) >> 10);
  }

  const int x0_q610 = SvSigmoidKnotQ610(segment_index);
  const int y0_q610 = SvSigmoidValueQ610(segment_index);
  const int y1_q610 = SvSigmoidValueQ610(segment_index + 1);
  const int shift_bits = (segment_index < 8) ? 8 : ((segment_index < 12) ? 9 : 10);
  const int delta_y_q610 = y1_q610 - y0_q610;
  const int offset_x_q610 = abs_input_int - x0_q610;
  const int interp_product_q610 = offset_x_q610 * delta_y_q610;
  const int interpolated_q610 =
      y0_q610 + ((interp_product_q610 + (1 << (shift_bits - 1))) >> shift_bits);
  const SvQDataT positive_value_q610 = SvSaturateInt16Q610(static_cast<SvAccumT>(interpolated_q610));
  return is_negative ? SvSubQ610(static_cast<SvQDataT>(subband_q610::kQScale), positive_value_q610)
                     : positive_value_q610;
}

}  // namespace

extern "C" void RunSvGsuLayerPackedQ610(
    int num_frames,
    int num_subbands,
    int input_size,
    int state_subband_offset,
    const subband_q610::q_pack32_t sequence_input_tiles[subband_q610::kSvGsuSequenceTileCount],
    const subband_q610::q_pack32_t weight_ih_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t weight_hh_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t bias_ih_tiles[subband_q610::kSvGsuBiasTileCount],
    const subband_q610::q_pack32_t bn_mul_tiles[subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t bn_add_tiles[subband_q610::kSvGsuHiddenTiles],
    subband_q610::q_pack32_t hx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t cx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t sequence_output_tiles[subband_q610::kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_memory port=sequence_input_tiles
  #pragma HLS interface ap_memory port=weight_ih_tiles
  #pragma HLS interface ap_memory port=weight_hh_tiles
  #pragma HLS interface ap_memory port=bias_ih_tiles
  #pragma HLS interface ap_memory port=bn_mul_tiles
  #pragma HLS interface ap_memory port=bn_add_tiles
  #pragma HLS interface ap_memory port=hx_state_tiles
  #pragma HLS interface ap_memory port=cx_state_tiles
  #pragma HLS interface ap_memory port=sequence_output_tiles

#ifndef __SYNTHESIS__
  SvQDataT prev_hx[subband_q610::kSbHiddenSize];
  SvQDataT prev_cx[subband_q610::kSbHiddenSize];

  for (int frame_index = 0; frame_index < subband_q610::kRealtimeChunkFrames; ++frame_index) {
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < subband_q610::kMaxNumSubbands; ++subband_index) {
        if (subband_index < num_subbands) {
          const int state_subband_index = state_subband_offset + subband_index;
          for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
            const SvPack32T hx_tile = hx_state_tiles[SvStateTileIndexQ610(state_subband_index, tile_index)];
            const SvPack32T cx_tile = cx_state_tiles[SvStateTileIndexQ610(state_subband_index, tile_index)];
            for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
              const int hidden_index = (tile_index * subband_q610::kSvGsuTileLanes) + lane;
              prev_hx[hidden_index] = SvGetPack32LaneQ610(hx_tile, lane);
              prev_cx[hidden_index] = SvGetPack32LaneQ610(cx_tile, lane);
            }
          }

          for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
            SvAccumT input_sum_q20 = 0;
            SvAccumT recurrent_sum_q20 = 0;
            for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
              const SvPack32T input_tile =
                  sequence_input_tiles[SvSeqTileIndexQ610(frame_index, subband_index, tile_index)];
              const SvPack32T weight_ih_tile = weight_ih_tiles[SvWeightTileIndexQ610(hidden_index, tile_index)];
              const SvPack32T weight_hh_tile = weight_hh_tiles[SvWeightTileIndexQ610(hidden_index, tile_index)];
              for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
                const int feature_index = (tile_index * subband_q610::kSvGsuTileLanes) + lane;
                if (feature_index < input_size) {
                  input_sum_q20 += SvMulForMacQ610(
                      SvGetPack32LaneQ610(input_tile, lane), SvGetPack32LaneQ610(weight_ih_tile, lane));
                }
                recurrent_sum_q20 += SvMulForMacQ610(prev_hx[feature_index], SvGetPack32LaneQ610(weight_hh_tile, lane));
              }
            }

            const int hidden_tile_index = hidden_index / subband_q610::kSvGsuTileLanes;
            const int hidden_lane = hidden_index % subband_q610::kSvGsuTileLanes;
            const SvQDataT forget_bias_q610 = SvGetPack32LaneQ610(bias_ih_tiles[hidden_tile_index], hidden_lane);
            const SvQDataT cell_bias_q610 =
                SvGetPack32LaneQ610(bias_ih_tiles[subband_q610::kSvGsuHiddenTiles + hidden_tile_index], hidden_lane);
            const SvAccumT common_q20 = input_sum_q20 + recurrent_sum_q20;
            const SvAccumT q_scale_q20 = static_cast<SvAccumT>(1) << subband_q610::kQFrac;
            const SvAccumT forget_q20 = common_q20 + (static_cast<SvAccumT>(forget_bias_q610) * q_scale_q20);
            const SvAccumT cell_q20 = common_q20 + (static_cast<SvAccumT>(cell_bias_q610) * q_scale_q20);
            const SvQDataT forget_preact_q610 =
                SvSaturateInt16Q610(SvRoundShiftRightQ610(forget_q20, subband_q610::kQFrac));
            const SvQDataT cell_preact_q610 =
                SvSaturateInt16Q610(SvRoundShiftRightQ610(cell_q20, subband_q610::kQFrac));
            const SvQDataT forget_gate_q610 = SvSigmoidPwlQ610(forget_preact_q610);
            const SvQDataT one_minus_forget_q610 =
                SvSubQ610(static_cast<SvQDataT>(subband_q610::kQScale), forget_gate_q610);
            const SvQDataT retained_q610 = SvMulQ610(forget_gate_q610, prev_cx[hidden_index]);
            const SvQDataT injected_q610 = SvMulQ610(one_minus_forget_q610, cell_preact_q610);
            SvQDataT cy_q610 = SvAddQ610(retained_q610, injected_q610);
            const SvQDataT bn_mul_q610 = SvGetPack32LaneQ610(bn_mul_tiles[hidden_tile_index], hidden_lane);
            const SvQDataT bn_add_q610 = SvGetPack32LaneQ610(bn_add_tiles[hidden_tile_index], hidden_lane);
            const SvQDataT scaled_q610 = SvMulQ610(cy_q610, bn_mul_q610);
            cy_q610 = SvAddQ610(scaled_q610, bn_add_q610);
            const SvQDataT hy_q610 = SvStepActivationQ610(cy_q610);

            SvPack32T hx_tile = hx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)];
            SvPack32T cx_tile = cx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)];
            SvPack32T output_tile =
                sequence_output_tiles[SvSeqTileIndexQ610(frame_index, subband_index, hidden_tile_index)];
            SvSetPack32LaneQ610(hx_tile, hidden_lane, hy_q610);
            SvSetPack32LaneQ610(cx_tile, hidden_lane, cy_q610);
            SvSetPack32LaneQ610(output_tile, hidden_lane, hy_q610);
            hx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)] = hx_tile;
            cx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)] = cx_tile;
            sequence_output_tiles[SvSeqTileIndexQ610(frame_index, subband_index, hidden_tile_index)] = output_tile;
          }
        }
      }
    }
  }
#else
  (void)num_frames;
  (void)num_subbands;
  (void)input_size;
  (void)state_subband_offset;
  (void)sequence_input_tiles;
  (void)weight_ih_tiles;
  (void)weight_hh_tiles;
  (void)bias_ih_tiles;
  (void)bn_mul_tiles;
  (void)bn_add_tiles;
  (void)hx_state_tiles;
  (void)cx_state_tiles;
  (void)sequence_output_tiles;
#endif
}

extern "C" void RunSvGsuHiddenGroupPackedQ610(
    int input_size,
    int hidden_base,
    const subband_q610::q_pack32_t input_tiles[subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t prev_hx_tiles[subband_q610::kSvGsuHiddenTiles],
    subband_q610::q_pack32_t hx_tile_in,
    subband_q610::q_pack32_t cx_tile_in,
    subband_q610::q_pack32_t output_tile_in,
    const subband_q610::q_pack32_t weight_ih_group[kSvGsuHiddenGroupPar * subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t weight_hh_group[kSvGsuHiddenGroupPar * subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_data_t forget_bias[kSvGsuHiddenGroupPar],
    const subband_q610::q_data_t cell_bias[kSvGsuHiddenGroupPar],
    const subband_q610::q_data_t bn_mul[kSvGsuHiddenGroupPar],
    const subband_q610::q_data_t bn_add[kSvGsuHiddenGroupPar],
    subband_q610::q_pack32_t result_tiles[3]) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_memory port=input_tiles
  #pragma HLS interface ap_memory port=prev_hx_tiles
  #pragma HLS interface ap_memory port=weight_ih_group
  #pragma HLS interface ap_memory port=weight_hh_group
  #pragma HLS interface ap_memory port=forget_bias
  #pragma HLS interface ap_memory port=cell_bias
  #pragma HLS interface ap_memory port=bn_mul
  #pragma HLS interface ap_memory port=bn_add
  #pragma HLS interface ap_memory port=result_tiles

#ifndef __SYNTHESIS__
  SvPack32T hx_tile = hx_tile_in;
  SvPack32T cx_tile = cx_tile_in;
  SvPack32T output_tile = output_tile_in;
  const int hidden_tile_index = hidden_base / subband_q610::kSvGsuTileLanes;
  const int hidden_lane_base = hidden_base % subband_q610::kSvGsuTileLanes;

  for (int hidden_lane = 0; hidden_lane < kSvGsuHiddenGroupPar; ++hidden_lane) {
    #pragma HLS unroll
    SvAccumT input_sum_q20 = 0;
    SvAccumT recurrent_sum_q20 = 0;
    for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
      const SvPack32T input_tile = input_tiles[tile_index];
      const SvPack32T prev_hx_tile = prev_hx_tiles[tile_index];
      const SvPack32T weight_ih_tile = weight_ih_group[(hidden_lane * subband_q610::kSvGsuHiddenTiles) + tile_index];
      const SvPack32T weight_hh_tile = weight_hh_group[(hidden_lane * subband_q610::kSvGsuHiddenTiles) + tile_index];
      for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
        const int feature_index = (tile_index * subband_q610::kSvGsuTileLanes) + lane;
        if (feature_index < input_size) {
          input_sum_q20 += SvMulForMacQ610(
              SvGetPack32LaneQ610(input_tile, lane), SvGetPack32LaneQ610(weight_ih_tile, lane));
        }
        recurrent_sum_q20 += SvMulForMacQ610(
            SvGetPack32LaneQ610(prev_hx_tile, lane), SvGetPack32LaneQ610(weight_hh_tile, lane));
      }
    }

    const int hidden_lane_in_tile = hidden_lane_base + hidden_lane;
    const SvAccumT common_q20 = input_sum_q20 + recurrent_sum_q20;
    const SvAccumT q_scale_q20 = static_cast<SvAccumT>(1) << subband_q610::kQFrac;
    const SvAccumT forget_q20 = common_q20 + (static_cast<SvAccumT>(forget_bias[hidden_lane]) * q_scale_q20);
    const SvAccumT cell_q20 = common_q20 + (static_cast<SvAccumT>(cell_bias[hidden_lane]) * q_scale_q20);
    const SvQDataT forget_preact_q610 =
        SvSaturateInt16Q610(SvRoundShiftRightQ610(forget_q20, subband_q610::kQFrac));
    const SvQDataT cell_preact_q610 =
        SvSaturateInt16Q610(SvRoundShiftRightQ610(cell_q20, subband_q610::kQFrac));
    const SvQDataT forget_gate_q610 = SvSigmoidPwlQ610(forget_preact_q610);
    const SvQDataT one_minus_forget_q610 =
        SvSubQ610(static_cast<SvQDataT>(subband_q610::kQScale), forget_gate_q610);
    const SvQDataT prev_cx = SvGetPack32LaneQ610(cx_tile, hidden_lane_in_tile);
    const SvQDataT retained_q610 = SvMulQ610(forget_gate_q610, prev_cx);
    const SvQDataT injected_q610 = SvMulQ610(one_minus_forget_q610, cell_preact_q610);
    SvQDataT cy_q610 = SvAddQ610(retained_q610, injected_q610);
    const SvQDataT scaled_q610 = SvMulQ610(cy_q610, bn_mul[hidden_lane]);
    cy_q610 = SvAddQ610(scaled_q610, bn_add[hidden_lane]);
    const SvQDataT hy_q610 = SvStepActivationQ610(cy_q610);

    SvSetPack32LaneQ610(hx_tile, hidden_lane_in_tile, hy_q610);
    SvSetPack32LaneQ610(cx_tile, hidden_lane_in_tile, cy_q610);
    SvSetPack32LaneQ610(output_tile, hidden_lane_in_tile, hy_q610);
  }

  result_tiles[0] = hx_tile;
  result_tiles[1] = cx_tile;
  result_tiles[2] = output_tile;
#else
  result_tiles[0] = 0;
  result_tiles[1] = 0;
  result_tiles[2] = 0;
#endif
}

extern "C" void RunSvGsuLayerFullTilesQ610(
    int num_frames,
    int num_subbands,
    int input_size,
    int state_subband_offset,
    const subband_q610::q_pack32_t sequence_input_tiles[subband_q610::kSvGsuSequenceTileCount],
    const subband_q610::q_pack32_t weight_ih_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t weight_hh_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t bias_ih_tiles[subband_q610::kSvGsuBiasTileCount],
    const subband_q610::q_pack32_t bn_mul_tiles[subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t bn_add_tiles[subband_q610::kSvGsuHiddenTiles],
    subband_q610::q_pack32_t hx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t cx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t sequence_output_tiles[subband_q610::kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_memory port=sequence_input_tiles
  #pragma HLS interface ap_memory port=weight_ih_tiles
  #pragma HLS interface ap_memory port=weight_hh_tiles
  #pragma HLS interface ap_memory port=bias_ih_tiles
  #pragma HLS interface ap_memory port=bn_mul_tiles
  #pragma HLS interface ap_memory port=bn_add_tiles
  #pragma HLS interface ap_memory port=hx_state_tiles
  #pragma HLS interface ap_memory port=cx_state_tiles
  #pragma HLS interface ap_memory port=sequence_output_tiles

#ifndef __SYNTHESIS__
  RunSvGsuLayerPackedQ610(
      num_frames, num_subbands, input_size, state_subband_offset, sequence_input_tiles, weight_ih_tiles,
      weight_hh_tiles, bias_ih_tiles, bn_mul_tiles, bn_add_tiles, hx_state_tiles, cx_state_tiles,
      sequence_output_tiles);
#else
  (void)num_frames;
  (void)num_subbands;
  (void)input_size;
  (void)state_subband_offset;
  (void)sequence_input_tiles;
  (void)weight_ih_tiles;
  (void)weight_hh_tiles;
  (void)bias_ih_tiles;
  (void)bn_mul_tiles;
  (void)bn_add_tiles;
  (void)hx_state_tiles;
  (void)cx_state_tiles;
  (void)sequence_output_tiles;
#endif
}

#ifdef GSU_LAYER_BB_DIAG_TOP
extern "C" void GsuLayerFullTilesBlackboxTopQ610(
    int num_frames,
    int num_subbands,
    int input_size,
    int state_subband_offset,
    const subband_q610::q_pack32_t sequence_input_tiles[subband_q610::kSvGsuSequenceTileCount],
    const subband_q610::q_pack32_t weight_ih_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t weight_hh_tiles[subband_q610::kSvGsuWeightTileCount],
    const subband_q610::q_pack32_t bias_ih_tiles[subband_q610::kSvGsuBiasTileCount],
    const subband_q610::q_pack32_t bn_mul_tiles[subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t bn_add_tiles[subband_q610::kSvGsuHiddenTiles],
    subband_q610::q_pack32_t hx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t cx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t sequence_output_tiles[subband_q610::kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_hs port=return
  #pragma HLS interface ap_memory port=sequence_input_tiles
  #pragma HLS interface ap_memory port=weight_ih_tiles
  #pragma HLS interface ap_memory port=weight_hh_tiles
  #pragma HLS interface ap_memory port=bias_ih_tiles
  #pragma HLS interface ap_memory port=bn_mul_tiles
  #pragma HLS interface ap_memory port=bn_add_tiles
  #pragma HLS interface ap_memory port=hx_state_tiles
  #pragma HLS interface ap_memory port=cx_state_tiles
  #pragma HLS interface ap_memory port=sequence_output_tiles
  #pragma HLS allocation function instances=RunSvGsuLayerFullTilesQ610 limit=1

  subband_q610::q_pack32_t sequence_input_local[subband_q610::kSvGsuSequenceTileCount];
  subband_q610::q_pack32_t weight_ih_local[subband_q610::kSvGsuWeightTileCount];
  subband_q610::q_pack32_t weight_hh_local[subband_q610::kSvGsuWeightTileCount];
  subband_q610::q_pack32_t bias_ih_local[subband_q610::kSvGsuBiasTileCount];
  subband_q610::q_pack32_t bn_mul_local[subband_q610::kSvGsuHiddenTiles];
  subband_q610::q_pack32_t bn_add_local[subband_q610::kSvGsuHiddenTiles];
  subband_q610::q_pack32_t hx_state_local[subband_q610::kSvGsuStateTileCount];
  subband_q610::q_pack32_t cx_state_local[subband_q610::kSvGsuStateTileCount];
  subband_q610::q_pack32_t sequence_output_local[subband_q610::kSvGsuSequenceTileCount];

  #pragma HLS bind_storage variable=sequence_input_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=weight_ih_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=weight_hh_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=bias_ih_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=bn_mul_local type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=bn_add_local type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=hx_state_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=cx_state_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sequence_output_local type=ram_2p impl=bram

  for (int i = 0; i < subband_q610::kSvGsuSequenceTileCount; ++i) {
    #pragma HLS pipeline II=1
    sequence_input_local[i] = sequence_input_tiles[i];
    sequence_output_local[i] = 0;
  }
  for (int i = 0; i < subband_q610::kSvGsuWeightTileCount; ++i) {
    #pragma HLS pipeline II=1
    weight_ih_local[i] = weight_ih_tiles[i];
    weight_hh_local[i] = weight_hh_tiles[i];
  }
  for (int i = 0; i < subband_q610::kSvGsuBiasTileCount; ++i) {
    #pragma HLS pipeline II=1
    bias_ih_local[i] = bias_ih_tiles[i];
  }
  for (int i = 0; i < subband_q610::kSvGsuHiddenTiles; ++i) {
    #pragma HLS pipeline II=1
    bn_mul_local[i] = bn_mul_tiles[i];
    bn_add_local[i] = bn_add_tiles[i];
  }
  for (int i = 0; i < subband_q610::kSvGsuStateTileCount; ++i) {
    #pragma HLS pipeline II=1
    hx_state_local[i] = hx_state_tiles[i];
    cx_state_local[i] = cx_state_tiles[i];
  }

  RunSvGsuLayerFullTilesQ610(
      num_frames, num_subbands, input_size, state_subband_offset, sequence_input_local, weight_ih_local,
      weight_hh_local, bias_ih_local, bn_mul_local, bn_add_local, hx_state_local, cx_state_local,
      sequence_output_local);

  for (int i = 0; i < subband_q610::kSvGsuStateTileCount; ++i) {
    #pragma HLS pipeline II=1
    hx_state_tiles[i] = hx_state_local[i];
    cx_state_tiles[i] = cx_state_local[i];
  }
  for (int i = 0; i < subband_q610::kSvGsuSequenceTileCount; ++i) {
    #pragma HLS pipeline II=1
    sequence_output_tiles[i] = sequence_output_local[i];
  }
}
#endif

extern "C" void RunSvGsuHiddenGroupScalarQ610(
    int input_size,
    int hidden_lane_base,
    subband_q610::q_pack32_t input_tile_0,
    subband_q610::q_pack32_t input_tile_1,
    subband_q610::q_pack32_t input_tile_2,
    subband_q610::q_pack32_t input_tile_3,
    subband_q610::q_pack32_t input_tile_4,
    subband_q610::q_pack32_t input_tile_5,
    subband_q610::q_pack32_t input_tile_6,
    subband_q610::q_pack32_t prev_hx_tile_0,
    subband_q610::q_pack32_t prev_hx_tile_1,
    subband_q610::q_pack32_t prev_hx_tile_2,
    subband_q610::q_pack32_t prev_hx_tile_3,
    subband_q610::q_pack32_t prev_hx_tile_4,
    subband_q610::q_pack32_t prev_hx_tile_5,
    subband_q610::q_pack32_t prev_hx_tile_6,
    subband_q610::q_pack32_t hx_tile_in,
    subband_q610::q_pack32_t cx_tile_in,
    subband_q610::q_pack32_t output_tile_in,
    subband_q610::q_pack32_t weight_ih_row0_tile_0,
    subband_q610::q_pack32_t weight_ih_row0_tile_1,
    subband_q610::q_pack32_t weight_ih_row0_tile_2,
    subband_q610::q_pack32_t weight_ih_row0_tile_3,
    subband_q610::q_pack32_t weight_ih_row0_tile_4,
    subband_q610::q_pack32_t weight_ih_row0_tile_5,
    subband_q610::q_pack32_t weight_ih_row0_tile_6,
    subband_q610::q_pack32_t weight_ih_row1_tile_0,
    subband_q610::q_pack32_t weight_ih_row1_tile_1,
    subband_q610::q_pack32_t weight_ih_row1_tile_2,
    subband_q610::q_pack32_t weight_ih_row1_tile_3,
    subband_q610::q_pack32_t weight_ih_row1_tile_4,
    subband_q610::q_pack32_t weight_ih_row1_tile_5,
    subband_q610::q_pack32_t weight_ih_row1_tile_6,
    subband_q610::q_pack32_t weight_hh_row0_tile_0,
    subband_q610::q_pack32_t weight_hh_row0_tile_1,
    subband_q610::q_pack32_t weight_hh_row0_tile_2,
    subband_q610::q_pack32_t weight_hh_row0_tile_3,
    subband_q610::q_pack32_t weight_hh_row0_tile_4,
    subband_q610::q_pack32_t weight_hh_row0_tile_5,
    subband_q610::q_pack32_t weight_hh_row0_tile_6,
    subband_q610::q_pack32_t weight_hh_row1_tile_0,
    subband_q610::q_pack32_t weight_hh_row1_tile_1,
    subband_q610::q_pack32_t weight_hh_row1_tile_2,
    subband_q610::q_pack32_t weight_hh_row1_tile_3,
    subband_q610::q_pack32_t weight_hh_row1_tile_4,
    subband_q610::q_pack32_t weight_hh_row1_tile_5,
    subband_q610::q_pack32_t weight_hh_row1_tile_6,
    subband_q610::q_data_t forget_bias_0,
    subband_q610::q_data_t forget_bias_1,
    subband_q610::q_data_t cell_bias_0,
    subband_q610::q_data_t cell_bias_1,
    subband_q610::q_data_t bn_mul_0,
    subband_q610::q_data_t bn_mul_1,
    subband_q610::q_data_t bn_add_0,
    subband_q610::q_data_t bn_add_1,
    subband_q610::q_pack32_t* hx_tile_out,
    subband_q610::q_pack32_t* cx_tile_out,
    subband_q610::q_pack32_t* output_tile_out) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_vld port=hx_tile_out
  #pragma HLS interface ap_vld port=cx_tile_out
  #pragma HLS interface ap_vld port=output_tile_out

#ifndef __SYNTHESIS__
  subband_q610::q_pack32_t input_tiles[subband_q610::kSvGsuHiddenTiles] = {
      input_tile_0, input_tile_1, input_tile_2, input_tile_3, input_tile_4, input_tile_5, input_tile_6};
  subband_q610::q_pack32_t prev_hx_tiles[subband_q610::kSvGsuHiddenTiles] = {
      prev_hx_tile_0, prev_hx_tile_1, prev_hx_tile_2, prev_hx_tile_3, prev_hx_tile_4, prev_hx_tile_5, prev_hx_tile_6};
  subband_q610::q_pack32_t weight_ih_group[kSvGsuHiddenGroupPar * subband_q610::kSvGsuHiddenTiles] = {
      weight_ih_row0_tile_0, weight_ih_row0_tile_1, weight_ih_row0_tile_2, weight_ih_row0_tile_3,
      weight_ih_row0_tile_4, weight_ih_row0_tile_5, weight_ih_row0_tile_6, weight_ih_row1_tile_0,
      weight_ih_row1_tile_1, weight_ih_row1_tile_2, weight_ih_row1_tile_3, weight_ih_row1_tile_4,
      weight_ih_row1_tile_5, weight_ih_row1_tile_6};
  subband_q610::q_pack32_t weight_hh_group[kSvGsuHiddenGroupPar * subband_q610::kSvGsuHiddenTiles] = {
      weight_hh_row0_tile_0, weight_hh_row0_tile_1, weight_hh_row0_tile_2, weight_hh_row0_tile_3,
      weight_hh_row0_tile_4, weight_hh_row0_tile_5, weight_hh_row0_tile_6, weight_hh_row1_tile_0,
      weight_hh_row1_tile_1, weight_hh_row1_tile_2, weight_hh_row1_tile_3, weight_hh_row1_tile_4,
      weight_hh_row1_tile_5, weight_hh_row1_tile_6};
  subband_q610::q_data_t forget_bias[kSvGsuHiddenGroupPar] = {forget_bias_0, forget_bias_1};
  subband_q610::q_data_t cell_bias[kSvGsuHiddenGroupPar] = {cell_bias_0, cell_bias_1};
  subband_q610::q_data_t bn_mul[kSvGsuHiddenGroupPar] = {bn_mul_0, bn_mul_1};
  subband_q610::q_data_t bn_add[kSvGsuHiddenGroupPar] = {bn_add_0, bn_add_1};

  subband_q610::q_pack32_t hx_result = 0;
  subband_q610::q_pack32_t cx_result = 0;
  subband_q610::q_pack32_t output_result = 0;
  subband_q610::q_pack32_t result_tiles[3];
  RunSvGsuHiddenGroupPackedQ610(
      input_size, hidden_lane_base, input_tiles, prev_hx_tiles, hx_tile_in, cx_tile_in, output_tile_in,
      weight_ih_group, weight_hh_group, forget_bias, cell_bias, bn_mul, bn_add, result_tiles);
  hx_result = result_tiles[0];
  cx_result = result_tiles[1];
  output_result = result_tiles[2];

  *hx_tile_out = hx_result;
  *cx_tile_out = cx_result;
  *output_tile_out = output_result;
#else
  (void)input_size;
  (void)hidden_lane_base;
  (void)input_tile_0;
  (void)input_tile_1;
  (void)input_tile_2;
  (void)input_tile_3;
  (void)input_tile_4;
  (void)input_tile_5;
  (void)input_tile_6;
  (void)prev_hx_tile_0;
  (void)prev_hx_tile_1;
  (void)prev_hx_tile_2;
  (void)prev_hx_tile_3;
  (void)prev_hx_tile_4;
  (void)prev_hx_tile_5;
  (void)prev_hx_tile_6;
  (void)hx_tile_in;
  (void)cx_tile_in;
  (void)output_tile_in;
  (void)weight_ih_row0_tile_0;
  (void)weight_ih_row0_tile_1;
  (void)weight_ih_row0_tile_2;
  (void)weight_ih_row0_tile_3;
  (void)weight_ih_row0_tile_4;
  (void)weight_ih_row0_tile_5;
  (void)weight_ih_row0_tile_6;
  (void)weight_ih_row1_tile_0;
  (void)weight_ih_row1_tile_1;
  (void)weight_ih_row1_tile_2;
  (void)weight_ih_row1_tile_3;
  (void)weight_ih_row1_tile_4;
  (void)weight_ih_row1_tile_5;
  (void)weight_ih_row1_tile_6;
  (void)weight_hh_row0_tile_0;
  (void)weight_hh_row0_tile_1;
  (void)weight_hh_row0_tile_2;
  (void)weight_hh_row0_tile_3;
  (void)weight_hh_row0_tile_4;
  (void)weight_hh_row0_tile_5;
  (void)weight_hh_row0_tile_6;
  (void)weight_hh_row1_tile_0;
  (void)weight_hh_row1_tile_1;
  (void)weight_hh_row1_tile_2;
  (void)weight_hh_row1_tile_3;
  (void)weight_hh_row1_tile_4;
  (void)weight_hh_row1_tile_5;
  (void)weight_hh_row1_tile_6;
  (void)forget_bias_0;
  (void)forget_bias_1;
  (void)cell_bias_0;
  (void)cell_bias_1;
  (void)bn_mul_0;
  (void)bn_mul_1;
  (void)bn_add_0;
  (void)bn_add_1;
  *hx_tile_out = 0;
  *cx_tile_out = 0;
  *output_tile_out = 0;
#endif
}

extern "C" void ProjectionDotProductPackedTilesSvQ610(
    const subband_q610::q_pack32_t input_tiles[subband_q610::kSvGsuHiddenTiles],
    const subband_q610::q_pack32_t proj_row_tiles[subband_q610::kSvGsuHiddenTiles],
    subband_q610::accum_q_t* sum_q20) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_memory port=input_tiles
  #pragma HLS interface ap_memory port=proj_row_tiles
  #pragma HLS interface ap_vld port=sum_q20

#ifndef __SYNTHESIS__
  SvAccumT total_q20 = 0;
  for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
    const SvPack32T input_tile = input_tiles[tile_index];
    const SvPack32T proj_tile = proj_row_tiles[tile_index];
    for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
      total_q20 += SvMulForMacQ610(SvGetPack32LaneQ610(input_tile, lane), SvGetPack32LaneQ610(proj_tile, lane));
    }
  }
  *sum_q20 = total_q20;
#else
  (void)input_tiles;
  (void)proj_row_tiles;
  *sum_q20 = 0;
#endif
}

extern "C" void ProjectionDotProductPackedScalarSvQ610(
    subband_q610::q_pack32_t input_tile_0,
    subband_q610::q_pack32_t input_tile_1,
    subband_q610::q_pack32_t input_tile_2,
    subband_q610::q_pack32_t input_tile_3,
    subband_q610::q_pack32_t input_tile_4,
    subband_q610::q_pack32_t input_tile_5,
    subband_q610::q_pack32_t input_tile_6,
    subband_q610::q_pack32_t proj_tile_0,
    subband_q610::q_pack32_t proj_tile_1,
    subband_q610::q_pack32_t proj_tile_2,
    subband_q610::q_pack32_t proj_tile_3,
    subband_q610::q_pack32_t proj_tile_4,
    subband_q610::q_pack32_t proj_tile_5,
    subband_q610::q_pack32_t proj_tile_6,
    subband_q610::accum_q_t* sum_q20) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_vld port=sum_q20

#ifndef __SYNTHESIS__
  const SvPack32T input_tiles[subband_q610::kSvGsuHiddenTiles] = {
      input_tile_0, input_tile_1, input_tile_2, input_tile_3, input_tile_4, input_tile_5, input_tile_6};
  const SvPack32T proj_tiles[subband_q610::kSvGsuHiddenTiles] = {
      proj_tile_0, proj_tile_1, proj_tile_2, proj_tile_3, proj_tile_4, proj_tile_5, proj_tile_6};
  SvAccumT total_q20 = 0;
  for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
    for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
      total_q20 += SvMulForMacQ610(
          SvGetPack32LaneQ610(input_tiles[tile_index], lane), SvGetPack32LaneQ610(proj_tiles[tile_index], lane));
    }
  }
  *sum_q20 = total_q20;
#else
  (void)input_tile_0;
  (void)input_tile_1;
  (void)input_tile_2;
  (void)input_tile_3;
  (void)input_tile_4;
  (void)input_tile_5;
  (void)input_tile_6;
  (void)proj_tile_0;
  (void)proj_tile_1;
  (void)proj_tile_2;
  (void)proj_tile_3;
  (void)proj_tile_4;
  (void)proj_tile_5;
  (void)proj_tile_6;
  *sum_q20 = 0;
#endif
}

extern "C" void RunSvGsuLayerStreamEngineQ610(
    int num_frames,
    int num_subbands,
    int input_size,
    int state_subband_offset,
    int weight_ih_offset,
    int weight_hh_offset,
    int bias_offset,
    int bn_mul_offset,
    int bn_add_offset,
    const subband_q610::packed_weight_word_t weights_q610[subband_q610::kRealtimeWeightsWordCount],
    const subband_q610::q_pack32_t sequence_input_tiles[subband_q610::kSvGsuSequenceTileCount],
    subband_q610::q_pack32_t hx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t cx_state_tiles[subband_q610::kSvGsuStateTileCount],
    subband_q610::q_pack32_t sequence_output_tiles[subband_q610::kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  #pragma HLS interface ap_ctrl_chain port=return
  #pragma HLS interface ap_memory port=weights_q610
  #pragma HLS interface ap_memory port=sequence_input_tiles
  #pragma HLS interface ap_memory port=hx_state_tiles
  #pragma HLS interface ap_memory port=cx_state_tiles
  #pragma HLS interface ap_memory port=sequence_output_tiles

#ifndef __SYNTHESIS__
  SvQDataT prev_hx[subband_q610::kSbHiddenSize];
  SvQDataT prev_cx[subband_q610::kSbHiddenSize];

  for (int frame_index = 0; frame_index < subband_q610::kRealtimeChunkFrames; ++frame_index) {
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < subband_q610::kMaxNumSubbands; ++subband_index) {
        if (subband_index < num_subbands) {
          const int state_subband_index = state_subband_offset + subband_index;
          for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
            const SvPack32T hx_tile = hx_state_tiles[SvStateTileIndexQ610(state_subband_index, tile_index)];
            const SvPack32T cx_tile = cx_state_tiles[SvStateTileIndexQ610(state_subband_index, tile_index)];
            for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
              const int hidden_index = (tile_index * subband_q610::kSvGsuTileLanes) + lane;
              prev_hx[hidden_index] = SvGetPack32LaneQ610(hx_tile, lane);
              prev_cx[hidden_index] = SvGetPack32LaneQ610(cx_tile, lane);
            }
          }

          for (int hidden_index = 0; hidden_index < subband_q610::kSbHiddenSize; ++hidden_index) {
            SvAccumT input_sum_q20 = 0;
            SvAccumT recurrent_sum_q20 = 0;
            for (int tile_index = 0; tile_index < subband_q610::kSvGsuHiddenTiles; ++tile_index) {
              const SvPack32T input_tile =
                  sequence_input_tiles[SvSeqTileIndexQ610(frame_index, subband_index, tile_index)];
              const int feature_base = tile_index * subband_q610::kSvGsuTileLanes;
              const SvPack32T weight_ih_tile =
                  SvLoadPackedWeightTileQ610(weights_q610, weight_ih_offset +
                                                           (hidden_index * subband_q610::kSbHiddenSize) +
                                                           feature_base);
              const SvPack32T weight_hh_tile =
                  SvLoadPackedWeightTileQ610(weights_q610, weight_hh_offset +
                                                           (hidden_index * subband_q610::kSbHiddenSize) +
                                                           feature_base);
              for (int lane = 0; lane < subband_q610::kSvGsuTileLanes; ++lane) {
                const int feature_index = feature_base + lane;
                if (feature_index < input_size) {
                  input_sum_q20 += SvMulForMacQ610(
                      SvGetPack32LaneQ610(input_tile, lane), SvGetPack32LaneQ610(weight_ih_tile, lane));
                }
                recurrent_sum_q20 +=
                    SvMulForMacQ610(prev_hx[feature_index], SvGetPack32LaneQ610(weight_hh_tile, lane));
              }
            }

            const int hidden_tile_index = hidden_index / subband_q610::kSvGsuTileLanes;
            const int hidden_lane = hidden_index % subband_q610::kSvGsuTileLanes;
            const SvQDataT forget_bias_q610 =
                SvLoadPackedWeightElementQ610(weights_q610, bias_offset + hidden_index);
            const SvQDataT cell_bias_q610 =
                SvLoadPackedWeightElementQ610(weights_q610, bias_offset + subband_q610::kSbHiddenSize + hidden_index);
            const SvQDataT bn_mul_q610 = SvLoadPackedWeightElementQ610(weights_q610, bn_mul_offset + hidden_index);
            const SvQDataT bn_add_q610 = SvLoadPackedWeightElementQ610(weights_q610, bn_add_offset + hidden_index);
            const SvAccumT common_q20 = input_sum_q20 + recurrent_sum_q20;
            const SvAccumT q_scale_q20 = static_cast<SvAccumT>(1) << subband_q610::kQFrac;
            const SvAccumT forget_q20 = common_q20 + (static_cast<SvAccumT>(forget_bias_q610) * q_scale_q20);
            const SvAccumT cell_q20 = common_q20 + (static_cast<SvAccumT>(cell_bias_q610) * q_scale_q20);
            const SvQDataT forget_preact_q610 =
                SvSaturateInt16Q610(SvRoundShiftRightQ610(forget_q20, subband_q610::kQFrac));
            const SvQDataT cell_preact_q610 =
                SvSaturateInt16Q610(SvRoundShiftRightQ610(cell_q20, subband_q610::kQFrac));
            const SvQDataT forget_gate_q610 = SvSigmoidPwlQ610(forget_preact_q610);
            const SvQDataT one_minus_forget_q610 =
                SvSubQ610(static_cast<SvQDataT>(subband_q610::kQScale), forget_gate_q610);
            const SvQDataT retained_q610 = SvMulQ610(forget_gate_q610, prev_cx[hidden_index]);
            const SvQDataT injected_q610 = SvMulQ610(one_minus_forget_q610, cell_preact_q610);
            SvQDataT cy_q610 = SvAddQ610(retained_q610, injected_q610);
            const SvQDataT scaled_q610 = SvMulQ610(cy_q610, bn_mul_q610);
            cy_q610 = SvAddQ610(scaled_q610, bn_add_q610);
            const SvQDataT hy_q610 = SvStepActivationQ610(cy_q610);

            SvPack32T hx_tile = hx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)];
            SvPack32T cx_tile = cx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)];
            SvPack32T output_tile =
                sequence_output_tiles[SvSeqTileIndexQ610(frame_index, subband_index, hidden_tile_index)];
            SvSetPack32LaneQ610(hx_tile, hidden_lane, hy_q610);
            SvSetPack32LaneQ610(cx_tile, hidden_lane, cy_q610);
            SvSetPack32LaneQ610(output_tile, hidden_lane, hy_q610);
            hx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)] = hx_tile;
            cx_state_tiles[SvStateTileIndexQ610(state_subband_index, hidden_tile_index)] = cx_tile;
            sequence_output_tiles[SvSeqTileIndexQ610(frame_index, subband_index, hidden_tile_index)] = output_tile;
          }
        }
      }
    }
  }
#else
  (void)num_frames;
  (void)num_subbands;
  (void)input_size;
  (void)state_subband_offset;
  (void)weight_ih_offset;
  (void)weight_hh_offset;
  (void)bias_offset;
  (void)bn_mul_offset;
  (void)bn_add_offset;
  (void)weights_q610;
  (void)sequence_input_tiles;
  (void)hx_state_tiles;
  (void)cx_state_tiles;
  (void)sequence_output_tiles;
#endif
}

namespace subband_q610 {

const BandSpec kBandSpecs[kNumBands] = {
    {0, 0, 32, 4, 15, 5, 8, 34, 4, 38, 40},
    {1, 32, 128, 32, 15, 3, 3, 62, 32, 94, 192},
    {2, 128, 256, 64, 15, 1, 2, 94, 64, 158, 128},
};

namespace {

constexpr int kSigmoidPwlSegmentCount = 16;
const q_data_t kSigmoidPwlKnotsQ610[kSigmoidPwlSegmentCount + 1] = {
    0, 256, 512, 768, 1024, 1280, 1536, 1792, 2048, 2560, 3072, 3584, 4096, 5120, 6144, 7168, 8192,
};
const q_data_t kSigmoidPwlValuesQ610[kSigmoidPwlSegmentCount + 1] = {
    512, 576, 637, 695, 749, 796, 837, 872, 902, 946, 975, 994, 1006, 1017, 1021, 1023, 1024,
};

static_assert(kBand0ProjSize == (2 * kBand0CtrFreq * kBand0DfOrder), "Band0 projection layout must match DF layout.");
static_assert(kBand1ProjSize == (2 * kBand1CtrFreq * kBand1DfOrder), "Band1 projection layout must match DF layout.");
static_assert(kBand2ProjSize == (2 * kBand2CtrFreq * kBand2DfOrder), "Band2 projection layout must match DF layout.");
static_assert((static_cast<long long>(2 * kSbHiddenSize) * 32767LL * 32767LL +
               32767LL * (1LL << kQFrac)) < (1LL << 47),
              "Q6.10 MAC accumulation must fit in accum_q_t.");

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

void SbInputToSequenceQ610(
    const BandSpec& spec,
    const q_data_t* sb_input_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610) {
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  const int batch_subbands = batch_size * spec.num_subbands;
  AssertBatchSubbandsBounds(batch_subbands);
  for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = batch_index * spec.num_subbands + subband_index;
      for (int feature_index = 0; feature_index < spec.packed_input_size; ++feature_index) {
        for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
          #pragma HLS loop_tripcount min=1 max=kMaxNumFrames
          #pragma HLS pipeline II=1
          output_q610[SequenceIndex(frame_index, sample_index, feature_index, batch_subbands, spec.packed_input_size)] =
              sb_input_q610[SubbandIndex(
                  batch_index,
                  subband_index,
                  feature_index,
                  frame_index,
                  spec.num_subbands,
                  spec.packed_input_size,
                  num_frames)];
        }
      }
    }
  }
}

namespace {

void RunProjectionToDfCoefBand0DirectQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    const q_data_t* proj_weight_q610,
    const q_data_t* proj_bias_q610,
    q_data_t* df_coef_q610);

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

    accum_q_t input_sum_even_q20 = 0;
    accum_q_t input_sum_odd_q20 = 0;
    for (int input_index = 0; input_index < input_size; input_index += 2) {
      #pragma HLS UNROLL factor=2
      input_sum_even_q20 += static_cast<accum_q_t>(input_ptr[input_index]) *
                            static_cast<accum_q_t>(weight_ih_ptr[input_index]);
      if (input_index + 1 < input_size) {
        input_sum_odd_q20 += static_cast<accum_q_t>(input_ptr[input_index + 1]) *
                             static_cast<accum_q_t>(weight_ih_ptr[input_index + 1]);
      }
    }

    accum_q_t recurrent_sum_even_q20 = 0;
    accum_q_t recurrent_sum_odd_q20 = 0;
    for (int recurrent_index = 0; recurrent_index < kSbHiddenSize; recurrent_index += 2) {
      #pragma HLS UNROLL factor=2
      recurrent_sum_even_q20 += static_cast<accum_q_t>(prev_hx_q610[recurrent_index]) *
                                static_cast<accum_q_t>(weight_hh_ptr[recurrent_index]);
      if (recurrent_index + 1 < kSbHiddenSize) {
        recurrent_sum_odd_q20 += static_cast<accum_q_t>(prev_hx_q610[recurrent_index + 1]) *
                                 static_cast<accum_q_t>(weight_hh_ptr[recurrent_index + 1]);
      }
    }

    const accum_q_t common_q20 = input_sum_even_q20 + input_sum_odd_q20 +
                                 recurrent_sum_even_q20 + recurrent_sum_odd_q20;
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

void RunStackedGSUFromSbInputQ610(
    const BandSpec& spec,
    const q_data_t* sb_input_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610) {
  const int batch_subbands = batch_size * spec.num_subbands;
  AssertBandRuntimeBounds(spec, batch_size, num_frames);
  AssertBatchSubbandsBounds(batch_subbands);

  q_data_t input_buffer[kMaxCellInputSize];
  q_data_t layer0_buffer[kSbHiddenSize];
  q_data_t layer1_buffer[kSbHiddenSize];

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int batch_index = 0; batch_index < batch_size; ++batch_index) {
      for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
        const int sample_index = batch_index * spec.num_subbands + subband_index;
        const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
        const std::size_t layer_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize);

        for (int feature_index = 0; feature_index < spec.packed_input_size; ++feature_index) {
          input_buffer[feature_index] = sb_input_q610[SubbandIndex(
              batch_index,
              subband_index,
              feature_index,
              frame_index,
              spec.num_subbands,
              spec.packed_input_size,
              num_frames)];
        }

        RunGSUCellQ610(
            input_buffer,
            spec.packed_input_size,
            weights_q610.layers[0],
            &layer0_hx_state_q610[state_offset],
            &layer0_cx_state_q610[state_offset],
            layer0_buffer);

        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          layer0_output_q610[layer_offset + hidden_index] = layer0_buffer[hidden_index];
        }

        RunGSUCellQ610(
            layer0_buffer,
            kSbHiddenSize,
            weights_q610.layers[1],
            &layer1_hx_state_q610[state_offset],
            &layer1_cx_state_q610[state_offset],
            layer1_buffer);

        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          layer1_output_q610[layer_offset + hidden_index] = layer1_buffer[hidden_index];
        }
      }
    }
  }
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
  #pragma HLS inline off
  AssertBatchSubbandsBounds(batch_subbands);
  AssertInputSizeBounds(input_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);

  static q_data_t input_buffer[kMaxCellInputSize];
  static q_data_t output_buffer[kSbHiddenSize];

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
  #pragma HLS inline off
  AssertBatchSubbandsBounds(batch_subbands);
  AssertProjectionSizeBounds(proj_size);
  assert(num_frames >= 0 && num_frames <= kMaxNumFrames);

  static q_data_t input_buffer[kSbHiddenSize];

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

  std::cout << "[REF] RunBandQ610 start" << std::endl;
  std::cout << "[REF] batch_size=" << batch_size
            << " num_frames=" << num_frames
            << " num_subbands=" << spec.num_subbands
            << " packed_input_size=" << spec.packed_input_size
            << " proj_size=" << spec.proj_size
            << std::endl;

  std::cout << "[REF] FreqUnfold noisy start" << std::endl;
  FreqUnfoldQ610(spec, spec.nbr_freq, noisy_input_q610, batch_size, num_frames, noisy_subbands_q610);
  std::cout << "[REF] FreqUnfold noisy done" << std::endl;

  std::cout << "[REF] FreqUnfold fb start" << std::endl;
  FreqUnfoldQ610(spec, 0, fb_output_q610, batch_size, num_frames, fb_subbands_q610);
  std::cout << "[REF] FreqUnfold fb done" << std::endl;

  std::cout << "[REF] Concat start" << std::endl;
  ConcatQ610(spec, noisy_subbands_q610, fb_subbands_q610, batch_size, num_frames, sb_input_q610);
  std::cout << "[REF] Concat done" << std::endl;

  std::cout << "[REF] Pack/PackedToSequence start" << std::endl;
  (void)packed_input_q610;
  (void)sequence_input_q610;
  std::cout << "[REF] Pack/PackedToSequence done" << std::endl;

  std::cout << "[REF] Clear layer0 hx start" << std::endl;
  ClearBufferQ610(layer0_hx_state_q610, GetStateElementCount(batch_subbands));
  std::cout << "[REF] Clear layer0 hx done" << std::endl;

  std::cout << "[REF] Clear layer0 cx start" << std::endl;
  ClearBufferQ610(layer0_cx_state_q610, GetStateElementCount(batch_subbands));
  std::cout << "[REF] Clear layer0 cx done" << std::endl;

  std::cout << "[REF] Clear layer1 hx start" << std::endl;
  ClearBufferQ610(layer1_hx_state_q610, GetStateElementCount(batch_subbands));
  std::cout << "[REF] Clear layer1 hx done" << std::endl;

  std::cout << "[REF] Clear layer1 cx start" << std::endl;
  ClearBufferQ610(layer1_cx_state_q610, GetStateElementCount(batch_subbands));
  std::cout << "[REF] Clear layer1 cx done" << std::endl;

  std::cout << "[REF] RunStackedGSU start" << std::endl;
  RunStackedGSUFromSbInputQ610(
      spec,
      sb_input_q610,
      batch_size,
      num_frames,
      weights_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_q610);
  std::cout << "[REF] RunStackedGSU done" << std::endl;

  std::cout << "[REF] RunProjection start" << std::endl;
  RunProjectionToDfCoefBand0DirectQ610(
      layer1_output_q610,
      batch_subbands,
      num_frames,
      weights_q610.proj.weight,
      weights_q610.proj.bias,
      df_coef_q610);
  std::cout << "[REF] RunProjection done" << std::endl;

  std::cout << "[REF] ProjectToDfCoef start" << std::endl;
  std::cout << "[REF] ProjectToDfCoef done" << std::endl;

  std::cout << "[REF] RunBandQ610 done" << std::endl;
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



namespace {

void RunGSUCellBand0DirectQ610(
    const q_data_t* input_ptr,
    int input_size,
    const q_data_t* weight_ih,
    const q_data_t* weight_hh,
    const q_data_t* bias_ih,
    const q_data_t* bn_mul,
    const q_data_t* bn_add,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    q_data_t* output_hy_q610) {
  q_data_t prev_hx_q610[kSbHiddenSize];
  q_data_t prev_cx_q610[kSbHiddenSize];

  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    prev_hx_q610[hidden_index] = hx_state_q610[hidden_index];
    prev_cx_q610[hidden_index] = cx_state_q610[hidden_index];
  }

  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    const q_data_t* weight_ih_ptr = &weight_ih[static_cast<std::size_t>(hidden_index) * input_size];
    const q_data_t* weight_hh_ptr = &weight_hh[static_cast<std::size_t>(hidden_index) * kSbHiddenSize];

    accum_q_t input_sum_even_q20 = 0;
    accum_q_t input_sum_odd_q20 = 0;
    for (int input_index = 0; input_index < input_size; input_index += 2) {
      #pragma HLS UNROLL factor=2
      input_sum_even_q20 += static_cast<accum_q_t>(input_ptr[input_index]) *
                            static_cast<accum_q_t>(weight_ih_ptr[input_index]);
      if (input_index + 1 < input_size) {
        input_sum_odd_q20 += static_cast<accum_q_t>(input_ptr[input_index + 1]) *
                             static_cast<accum_q_t>(weight_ih_ptr[input_index + 1]);
      }
    }

    accum_q_t recurrent_sum_even_q20 = 0;
    accum_q_t recurrent_sum_odd_q20 = 0;
    for (int recurrent_index = 0; recurrent_index < kSbHiddenSize; recurrent_index += 2) {
      #pragma HLS UNROLL factor=2
      recurrent_sum_even_q20 += static_cast<accum_q_t>(prev_hx_q610[recurrent_index]) *
                                static_cast<accum_q_t>(weight_hh_ptr[recurrent_index]);
      if (recurrent_index + 1 < kSbHiddenSize) {
        recurrent_sum_odd_q20 += static_cast<accum_q_t>(prev_hx_q610[recurrent_index + 1]) *
                                 static_cast<accum_q_t>(weight_hh_ptr[recurrent_index + 1]);
      }
    }

    const accum_q_t common_q20 = input_sum_even_q20 + input_sum_odd_q20 +
                                 recurrent_sum_even_q20 + recurrent_sum_odd_q20;
    const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
    const accum_q_t forget_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[hidden_index]) * q_scale_q20);
    const accum_q_t cell_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[kSbHiddenSize + hidden_index]) * q_scale_q20);

    const q_data_t forget_preact_q610 = SaturateInt16(RoundShiftRight(forget_q20, kQFrac));
    const q_data_t cell_preact_q610 = SaturateInt16(RoundShiftRight(cell_q20, kQFrac));

    const q_data_t forget_gate_q610 = SigmoidPwlQ610(forget_preact_q610);
    const q_data_t one_minus_forget_q610 = SubQ610(kQOne, forget_gate_q610);
    const q_data_t retained_q610 = MulQ610(forget_gate_q610, prev_cx_q610[hidden_index]);
    const q_data_t injected_q610 = MulQ610(one_minus_forget_q610, cell_preact_q610);

    q_data_t cy_q610 = AddQ610(retained_q610, injected_q610);
    if (bn_mul != nullptr && bn_add != nullptr) {
      const q_data_t scaled_q610 = MulQ610(cy_q610, bn_mul[hidden_index]);
      cy_q610 = AddQ610(scaled_q610, bn_add[hidden_index]);
    }
    const q_data_t hy_q610 = StepActivationQ610(cy_q610);

    cx_state_q610[hidden_index] = cy_q610;
    hx_state_q610[hidden_index] = hy_q610;
    output_hy_q610[hidden_index] = hy_q610;
  }
}

void RunGSULayerBand0DirectQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const q_data_t* weight_ih,
    const q_data_t* weight_hh,
    const q_data_t* bias_ih,
    const q_data_t* bn_mul,
    const q_data_t* bn_add,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    q_data_t* sequence_output_q610) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;
      const std::size_t input_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, input_size);
      const std::size_t output_offset = SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize);
      RunGSUCellBand0DirectQ610(
          &sequence_input_q610[input_offset],
          input_size,
          weight_ih,
          weight_hh,
          bias_ih,
          bn_mul,
          bn_add,
          &hx_state_q610[state_offset],
          &cx_state_q610[state_offset],
          &sequence_output_q610[output_offset]);
    }
  }
}

void RunProjectionBand0DirectQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    const q_data_t* proj_weight,
    const q_data_t* proj_bias,
    q_data_t* sequence_output_q610) {
  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const q_data_t* input_ptr =
          &sequence_input_q610[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];
      for (int proj_index = 0; proj_index < kBand0ProjSize; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        accum_q_t sum_q20 = static_cast<accum_q_t>(proj_bias[proj_index]) * q_scale_q20;
        const q_data_t* weight_ptr = &proj_weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<accum_q_t>(input_ptr[hidden_index]) *
                     static_cast<accum_q_t>(weight_ptr[hidden_index]);
        }
        sequence_output_q610[SequenceIndex(frame_index, sample_index, proj_index, batch_subbands, kBand0ProjSize)] =
            SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
      }
    }
  }
}


void RunProjectionToDfCoefBand0DirectQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    const q_data_t* proj_weight,
    const q_data_t* proj_bias,
    q_data_t* df_coef_q610) {
  const int total_freqs = kBand0TotalFreqs;
  assert(batch_subbands == kBand0NumSubbands);

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int sample_index = 0; sample_index < batch_subbands; ++sample_index) {
      const q_data_t* input_ptr =
          &sequence_input_q610[SequenceIndex(frame_index, sample_index, 0, batch_subbands, kSbHiddenSize)];

      for (int proj_index = 0; proj_index < kBand0ProjSize; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        accum_q_t sum_q20 = static_cast<accum_q_t>(proj_bias[proj_index]) * q_scale_q20;
        const q_data_t* weight_ptr = &proj_weight[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<accum_q_t>(input_ptr[hidden_index]) *
                     static_cast<accum_q_t>(weight_ptr[hidden_index]);
        }

        const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));

        const int subband_index = sample_index;
        const int complex_index = proj_index / (kBand0CtrFreq * kBand0DfOrder);
        const int feature_remainder = proj_index % (kBand0CtrFreq * kBand0DfOrder);
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
            total_freqs,
            num_frames)] = value_q610;
      }
    }
  }
}

void RunBand0DirectQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int num_frames,
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
    q_data_t* df_coef_q610) {
  const BandSpec& spec = GetBandSpec(0);
  const int batch_size = 1;
  const int batch_subbands = batch_size * spec.num_subbands;
  const int total_freqs = spec.num_subbands * spec.ctr_freq;
  constexpr int kBand0NbrFreq = (kBand0NoisyFreqSize - kBand0CtrFreq) / 2;

  (void)noisy_subbands_q610;
  (void)fb_subbands_q610;
  (void)sb_input_q610;
  (void)packed_input_q610;
  (void)sequence_input_q610;
  (void)layer0_output_q610;
  (void)layer1_output_q610;

  ClearBufferQ610(layer0_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer0_cx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_hx_state_q610, GetStateElementCount(batch_subbands));
  ClearBufferQ610(layer1_cx_state_q610, GetStateElementCount(batch_subbands));

  q_data_t input_buffer[kBand0PackedInputSize];
  q_data_t layer0_buffer[kSbHiddenSize];
  q_data_t layer1_buffer[kSbHiddenSize];

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int subband_index = 0; subband_index < spec.num_subbands; ++subband_index) {
      const int sample_index = subband_index;
      const std::size_t state_offset = static_cast<std::size_t>(sample_index) * kSbHiddenSize;

      for (int noisy_freq_index = 0; noisy_freq_index < spec.noisy_freq_size; ++noisy_freq_index) {
        int source_freq = subband_index * spec.ctr_freq + noisy_freq_index - kBand0NbrFreq;
        source_freq = ReflectFrequencyIndex(source_freq, kNumFreqs);
        input_buffer[noisy_freq_index] = noisy_input_q610[InputIndex(0, source_freq, frame_index, num_frames)];
      }

      for (int fb_freq_index = 0; fb_freq_index < spec.fb_freq_size; ++fb_freq_index) {
        const int source_freq = subband_index * spec.ctr_freq + fb_freq_index;
        input_buffer[spec.noisy_freq_size + fb_freq_index] =
            fb_output_q610[InputIndex(0, source_freq, frame_index, num_frames)];
      }

      RunGSUCellBand0DirectQ610(
          input_buffer,
          spec.packed_input_size,
          layer0_weight_ih_q610,
          layer0_weight_hh_q610,
          layer0_bias_ih_q610,
          layer0_bn_mul_q610,
          layer0_bn_add_q610,
          &layer0_hx_state_q610[state_offset],
          &layer0_cx_state_q610[state_offset],
          layer0_buffer);

      RunGSUCellBand0DirectQ610(
          layer0_buffer,
          kSbHiddenSize,
          layer1_weight_ih_q610,
          layer1_weight_hh_q610,
          layer1_bias_ih_q610,
          layer1_bn_mul_q610,
          layer1_bn_add_q610,
          &layer1_hx_state_q610[state_offset],
          &layer1_cx_state_q610[state_offset],
          layer1_buffer);

      for (int proj_index = 0; proj_index < kBand0ProjSize; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        accum_q_t sum_q20 = static_cast<accum_q_t>(proj_bias_q610[proj_index]) * q_scale_q20;
        const q_data_t* weight_ptr = &proj_weight_q610[static_cast<std::size_t>(proj_index) * kSbHiddenSize];
        for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
          sum_q20 += static_cast<accum_q_t>(layer1_buffer[hidden_index]) *
                     static_cast<accum_q_t>(weight_ptr[hidden_index]);
        }
        const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
        const int complex_index = proj_index / (kBand0CtrFreq * kBand0DfOrder);
        const int feature_remainder = proj_index % (kBand0CtrFreq * kBand0DfOrder);
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
            total_freqs,
            num_frames)] = value_q610;
      }
    }
  }
}

constexpr int kZyboZ720DspBudget = 220;
constexpr int kLayer0HiddenPar = 2;
constexpr int kLayer0InputPar = 4;
constexpr int kLayer0RecurrentPar = 32;
constexpr int kLayer1HiddenPar = 2;
constexpr int kLayer1InputPar = 32;
constexpr int kLayer1RecurrentPar = 32;
constexpr int kProjectionDotPar = 4;
constexpr int kBand0InputGeneratorDsp = 2;
constexpr int kProjectionExtraDsp = 1;
constexpr int kGateUpdateDsp =
    (2 * kLayer0HiddenPar) + (2 * kLayer1HiddenPar);
constexpr int kBnScaleDsp = kLayer0HiddenPar + kLayer1HiddenPar;
constexpr int kBand0InputMinSourceFreq = -((kBand0NoisyFreqSize - kBand0CtrFreq) / 2);
constexpr int kBand0InputMaxSourceFreq =
    ((kBand0NumSubbands - 1) * kBand0CtrFreq) + kBand0NoisyFreqSize -
    ((kBand0NoisyFreqSize - kBand0CtrFreq) / 2) - 1;

static_assert(kLayer0HiddenPar * (kLayer0InputPar + kLayer0RecurrentPar) +
                  kLayer1HiddenPar * (kLayer1InputPar + kLayer1RecurrentPar) + kProjectionDotPar +
                  kProjectionExtraDsp + kGateUpdateDsp + kBnScaleDsp +
                  kBand0InputGeneratorDsp <=
              kZyboZ720DspBudget,
              "Configured Band0 parallel MAC lanes must fit the Zybo Z7-20 DSP budget.");
static_assert(kSbHiddenSize % kLayer0HiddenPar == 0, "Layer0 hidden parallelism must divide hidden size.");
static_assert(kSbHiddenSize % kLayer1HiddenPar == 0, "Layer1 hidden parallelism must divide hidden size.");
static_assert(kBand0InputMinSourceFreq < 0, "Band0 input generator expects only lower-edge reflection.");
static_assert(kBand0InputMaxSourceFreq < kNumFreqs, "Band0 input generator must not exceed the FFT range.");

inline accum_q_t MulForMacDspQ610(q_data_t lhs, q_data_t rhs) {
  #pragma HLS inline
  accum_q_t product_q20;
  #pragma HLS bind_op variable=product_q20 op=mul impl=dsp latency=2
  product_q20 = static_cast<accum_q_t>(lhs) * static_cast<accum_q_t>(rhs);
  return product_q20;
}

inline q_data_t MulQ610Fabric(q_data_t lhs, q_data_t rhs) {
  #pragma HLS inline
  accum_q_t product_q20;
  #pragma HLS bind_op variable=product_q20 op=mul impl=fabric
  product_q20 = static_cast<accum_q_t>(lhs) * static_cast<accum_q_t>(rhs);
  return SaturateInt16(RoundShiftRight(product_q20, kQFrac));
}

inline q_data_t MulQ610Dsp(q_data_t lhs, q_data_t rhs) {
  #pragma HLS inline
  accum_q_t product_q20;
  #pragma HLS bind_op variable=product_q20 op=mul impl=dsp latency=2
  product_q20 = static_cast<accum_q_t>(lhs) * static_cast<accum_q_t>(rhs);
  return SaturateInt16(RoundShiftRight(product_q20, kQFrac));
}

template <bool UseDsp>
inline q_data_t MulGateUpdateQ610(q_data_t lhs, q_data_t rhs);

template <>
inline q_data_t MulGateUpdateQ610<true>(q_data_t lhs, q_data_t rhs) {
  #pragma HLS inline
  return MulQ610Dsp(lhs, rhs);
}

template <>
inline q_data_t MulGateUpdateQ610<false>(q_data_t lhs, q_data_t rhs) {
  #pragma HLS inline
  return MulQ610Fabric(lhs, rhs);
}

q_data_t SigmoidPwlQ610Fabric(q_data_t input_value_q610) {
  #pragma HLS inline
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

  const int32_t abs_input_int = static_cast<int32_t>(abs_input_q610);
  int segment_index;
  if (abs_input_int <= 256) {
    segment_index = 0;
  } else if (abs_input_int <= 2048) {
    segment_index = (abs_input_int - 1) >> 8;
  } else if (abs_input_int <= 4096) {
    segment_index = 8 + ((abs_input_int - 2049) >> 9);
  } else {
    segment_index = 12 + ((abs_input_int - 4097) >> 10);
  }

  const q_data_t x0_q610 = kSigmoidPwlKnotsQ610[segment_index];
  const q_data_t y0_q610 = kSigmoidPwlValuesQ610[segment_index];
  const q_data_t y1_q610 = kSigmoidPwlValuesQ610[segment_index + 1];
  const int shift_bits = segment_index < 8 ? 8 : (segment_index < 12 ? 9 : 10);
  const int32_t delta_y_q610 = static_cast<int32_t>(y1_q610) - static_cast<int32_t>(y0_q610);
  const int32_t offset_x_q610 = abs_input_int - static_cast<int32_t>(x0_q610);
  int32_t interp_product_q610;
  #pragma HLS bind_op variable=interp_product_q610 op=mul impl=fabric
  interp_product_q610 = offset_x_q610 * delta_y_q610;
  const int32_t interpolated_q610 =
      static_cast<int32_t>(y0_q610) + ((interp_product_q610 + (1 << (shift_bits - 1))) >> shift_bits);
  const q_data_t positive_value_q610 = SaturateInt16(interpolated_q610);
  return is_negative ? SubQ610(kQOne, positive_value_q610) : positive_value_q610;
}

template <int Rows, int Cols>
void LoadMatrixQ610(const q_data_t* input, q_data_t (&output)[Rows][Cols]) {
  #pragma HLS inline off
  for (int row = 0; row < Rows; ++row) {
    for (int col = 0; col < Cols; ++col) {
      #pragma HLS pipeline II=1
      output[row][col] = input[static_cast<std::size_t>(row) * Cols + col];
    }
  }
}

template <int N>
void LoadVectorQ610(const q_data_t* input, q_data_t (&output)[N]) {
  #pragma HLS inline off
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    output[index] = input[index];
  }
}

void LoadBand0Weights2DQ610(
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
    q_data_t (&layer0_weight_ih_local)[kSbHiddenSize][kBand0PackedInputSize],
    q_data_t (&layer0_weight_hh_local)[kSbHiddenSize][kSbHiddenSize],
    q_data_t (&layer0_bias_ih_local)[2][kSbHiddenSize],
    q_data_t (&layer0_bn_mul_local)[kSbHiddenSize],
    q_data_t (&layer0_bn_add_local)[kSbHiddenSize],
    q_data_t (&layer1_weight_ih_local)[kSbHiddenSize][kSbHiddenSize],
    q_data_t (&layer1_weight_hh_local)[kSbHiddenSize][kSbHiddenSize],
    q_data_t (&layer1_bias_ih_local)[2][kSbHiddenSize],
    q_data_t (&layer1_bn_mul_local)[kSbHiddenSize],
    q_data_t (&layer1_bn_add_local)[kSbHiddenSize],
    q_data_t (&proj_weight_local)[kBand0ProjSize][kSbHiddenSize],
    q_data_t (&proj_bias_local)[kBand0ProjSize]) {
  #pragma HLS inline off
  LoadMatrixQ610<kSbHiddenSize, kBand0PackedInputSize>(layer0_weight_ih_q610, layer0_weight_ih_local);
  LoadMatrixQ610<kSbHiddenSize, kSbHiddenSize>(layer0_weight_hh_q610, layer0_weight_hh_local);
  LoadMatrixQ610<2, kSbHiddenSize>(layer0_bias_ih_q610, layer0_bias_ih_local);
  LoadVectorQ610<kSbHiddenSize>(layer0_bn_mul_q610, layer0_bn_mul_local);
  LoadVectorQ610<kSbHiddenSize>(layer0_bn_add_q610, layer0_bn_add_local);
  LoadMatrixQ610<kSbHiddenSize, kSbHiddenSize>(layer1_weight_ih_q610, layer1_weight_ih_local);
  LoadMatrixQ610<kSbHiddenSize, kSbHiddenSize>(layer1_weight_hh_q610, layer1_weight_hh_local);
  LoadMatrixQ610<2, kSbHiddenSize>(layer1_bias_ih_q610, layer1_bias_ih_local);
  LoadVectorQ610<kSbHiddenSize>(layer1_bn_mul_q610, layer1_bn_mul_local);
  LoadVectorQ610<kSbHiddenSize>(layer1_bn_add_q610, layer1_bn_add_local);
  LoadMatrixQ610<kBand0ProjSize, kSbHiddenSize>(proj_weight_q610, proj_weight_local);
  LoadVectorQ610<kBand0ProjSize>(proj_bias_q610, proj_bias_local);
}

template <int N>
void ReadFixedVectorFromStreamQ610(hls::stream<q_data_t>& input_stream, q_data_t (&buffer)[N]) {
  #pragma HLS inline
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    buffer[index] = input_stream.read();
  }
}

template <int N>
void WriteFixedVectorToStreamQ610(const q_data_t (&buffer)[N], hls::stream<q_data_t>& output_stream) {
  #pragma HLS inline
  for (int index = 0; index < N; ++index) {
    #pragma HLS pipeline II=1
    output_stream.write(buffer[index]);
  }
}

template <int N>
void ClearStateVectorQ610(q_data_t (&state_q610)[kBand0NumSubbands][N]) {
  #pragma HLS inline off
  for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
    for (int hidden_index = 0; hidden_index < N; ++hidden_index) {
      #pragma HLS pipeline II=1
      state_q610[subband_index][hidden_index] = 0;
    }
  }
}

void GenerateBand0SequenceStreamOptimizedQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    hls::stream<q_data_t>& sequence_stream) {
  #pragma HLS inline off
  constexpr int kBand0NbrFreq = (kBand0NoisyFreqSize - kBand0CtrFreq) / 2;

  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=kFixedNumFrames max=kFixedNumFrames
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

template <int Terms, int Par, int WeightCols>
accum_q_t DotProductDspQ610(
    const q_data_t input[Terms],
    const q_data_t weights[kSbHiddenSize][WeightCols],
    int hidden_index) {
  #pragma HLS inline
  accum_q_t lane_sums[Par];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < Par; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int base_index = 0; base_index < Terms; base_index += Par) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < Par; ++lane) {
      #pragma HLS unroll
      const int index = base_index + lane;
      if (index < Terms) {
        lane_sums[lane] += MulForMacDspQ610(input[index], weights[hidden_index][index]);
      }
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < Par; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

template <int InputSize, int HiddenPar, int InputPar, int RecurrentPar>
void RunGSUMacPhaseBand0Q610(
    const q_data_t input_ptr[InputSize],
    const q_data_t weight_ih[kSbHiddenSize][InputSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t prev_hx_q610[kSbHiddenSize],
    hls::stream<ap_int<48 * HiddenPar> >& common_sum_stream) {
  #pragma HLS inline off
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += HiddenPar) {
    ap_int<48 * HiddenPar> common_packet = 0;
    for (int hidden_lane = 0; hidden_lane < HiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      const accum_q_t input_sum_q20 =
          DotProductDspQ610<InputSize, InputPar, InputSize>(input_ptr, weight_ih, hidden_index);
      const accum_q_t recurrent_sum_q20 =
          DotProductDspQ610<kSbHiddenSize, RecurrentPar, kSbHiddenSize>(prev_hx_q610, weight_hh, hidden_index);
      const accum_q_t common_q20 = input_sum_q20 + recurrent_sum_q20;
      common_packet.range((48 * (hidden_lane + 1)) - 1, 48 * hidden_lane) = common_q20;
    }
    common_sum_stream.write(common_packet);
  }
}

template <int HiddenPar, bool UseDspGateUpdate>
void RunGSUGatePhaseBand0Q610(
    hls::stream<ap_int<48 * HiddenPar> >& common_sum_stream,
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    const q_data_t prev_cx_q610[kSbHiddenSize],
    q_data_t hx_state_q610[kSbHiddenSize],
    q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t output_hy_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += HiddenPar) {
    ap_int<48 * HiddenPar> common_packet = common_sum_stream.read();
    for (int hidden_lane = 0; hidden_lane < HiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      const accum_q_t common_q20 =
          common_packet.range((48 * (hidden_lane + 1)) - 1, 48 * hidden_lane);
      const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
      const accum_q_t forget_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[0][hidden_index]) * q_scale_q20);
      const accum_q_t cell_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[1][hidden_index]) * q_scale_q20);

      const q_data_t forget_preact_q610 = SaturateInt16(RoundShiftRight(forget_q20, kQFrac));
      const q_data_t cell_preact_q610 = SaturateInt16(RoundShiftRight(cell_q20, kQFrac));

      const q_data_t forget_gate_q610 = SigmoidPwlQ610Fabric(forget_preact_q610);
      const q_data_t one_minus_forget_q610 = SubQ610(kQOne, forget_gate_q610);
      const q_data_t retained_q610 =
          MulGateUpdateQ610<UseDspGateUpdate>(forget_gate_q610, prev_cx_q610[hidden_index]);
      const q_data_t injected_q610 =
          MulGateUpdateQ610<UseDspGateUpdate>(one_minus_forget_q610, cell_preact_q610);

      q_data_t cy_q610 = AddQ610(retained_q610, injected_q610);
      const q_data_t scaled_q610 = MulQ610Dsp(cy_q610, bn_mul[hidden_index]);
      cy_q610 = AddQ610(scaled_q610, bn_add[hidden_index]);
      const q_data_t hy_q610 = StepActivationQ610(cy_q610);

      cx_state_q610[hidden_index] = cy_q610;
      hx_state_q610[hidden_index] = hy_q610;
      output_hy_q610[hidden_index] = hy_q610;
    }
  }
}

template <int HiddenPar>
void SnapshotGSUStateQ610(
    const q_data_t hx_state_q610[kSbHiddenSize],
    const q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t prev_hx_q610[kSbHiddenSize],
    q_data_t prev_cx_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += HiddenPar) {
    #pragma HLS pipeline II=1
    for (int hidden_lane = 0; hidden_lane < HiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      prev_hx_q610[hidden_index] = hx_state_q610[hidden_index];
      prev_cx_q610[hidden_index] = cx_state_q610[hidden_index];
    }
  }
}

template <int InputSize, int HiddenPar, int InputPar, int RecurrentPar, bool UseDspGateUpdate>
void RunGSUCellBand0ParallelQ610(
    const q_data_t input_ptr[InputSize],
    const q_data_t weight_ih[kSbHiddenSize][InputSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t hx_state_q610[kSbHiddenSize],
    q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t output_hy_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  q_data_t prev_hx_q610[kSbHiddenSize];
  q_data_t prev_cx_q610[kSbHiddenSize];
  hls::stream<ap_int<48 * HiddenPar> > common_sum_stream;
  #pragma HLS array_partition variable=prev_hx_q610 complete dim=1
  #pragma HLS array_partition variable=prev_cx_q610 complete dim=1
  #pragma HLS stream variable=common_sum_stream depth=2

  SnapshotGSUStateQ610<HiddenPar>(hx_state_q610, cx_state_q610, prev_hx_q610, prev_cx_q610);
  RunGSUMacPhaseBand0Q610<InputSize, HiddenPar, InputPar, RecurrentPar>(
      input_ptr, weight_ih, weight_hh, prev_hx_q610, common_sum_stream);
  RunGSUGatePhaseBand0Q610<HiddenPar, UseDspGateUpdate>(
      common_sum_stream, bias_ih, bn_mul, bn_add, prev_cx_q610, hx_state_q610, cx_state_q610, output_hy_q610);
}

void RunGSULayer0StreamParallelQ610(
    hls::stream<q_data_t>& sequence_input_stream,
    const q_data_t (&weight_ih)[kSbHiddenSize][kBand0PackedInputSize],
    const q_data_t (&weight_hh)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&bias_ih)[2][kSbHiddenSize],
    const q_data_t (&bn_mul)[kSbHiddenSize],
    const q_data_t (&bn_add)[kSbHiddenSize],
    q_data_t (&hx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t (&cx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    hls::stream<q_data_t>& sequence_output_stream) {
  #pragma HLS inline off
  q_data_t input_buffer[kBand0PackedInputSize];
  q_data_t output_buffer[kSbHiddenSize];
  #pragma HLS array_partition variable=input_buffer complete dim=1
  #pragma HLS array_partition variable=output_buffer cyclic factor=kLayer0HiddenPar dim=1

  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=kFixedNumFrames max=kFixedNumFrames
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      ReadFixedVectorFromStreamQ610(sequence_input_stream, input_buffer);
      RunGSUCellBand0ParallelQ610<kBand0PackedInputSize, kLayer0HiddenPar, kLayer0InputPar, kLayer0RecurrentPar, true>(
          input_buffer,
          weight_ih,
          weight_hh,
          bias_ih,
          bn_mul,
          bn_add,
          hx_state_q610[subband_index],
          cx_state_q610[subband_index],
          output_buffer);
      WriteFixedVectorToStreamQ610(output_buffer, sequence_output_stream);
    }
  }
}

void RunGSULayer1StreamParallelQ610(
    hls::stream<q_data_t>& sequence_input_stream,
    const q_data_t (&weight_ih)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&weight_hh)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&bias_ih)[2][kSbHiddenSize],
    const q_data_t (&bn_mul)[kSbHiddenSize],
    const q_data_t (&bn_add)[kSbHiddenSize],
    q_data_t (&hx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t (&cx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    hls::stream<q_data_t>& sequence_output_stream) {
  #pragma HLS inline off
  q_data_t input_buffer[kSbHiddenSize];
  q_data_t output_buffer[kSbHiddenSize];
  #pragma HLS array_partition variable=input_buffer complete dim=1
  #pragma HLS array_partition variable=output_buffer cyclic factor=kLayer1HiddenPar dim=1

  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=kFixedNumFrames max=kFixedNumFrames
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      ReadFixedVectorFromStreamQ610(sequence_input_stream, input_buffer);
      RunGSUCellBand0ParallelQ610<kSbHiddenSize, kLayer1HiddenPar, kLayer1InputPar, kLayer1RecurrentPar, true>(
          input_buffer,
          weight_ih,
          weight_hh,
          bias_ih,
          bn_mul,
          bn_add,
          hx_state_q610[subband_index],
          cx_state_q610[subband_index],
          output_buffer);
      WriteFixedVectorToStreamQ610(output_buffer, sequence_output_stream);
    }
  }
}

accum_q_t ProjectionDotProductDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t weights[kBand0ProjSize][kSbHiddenSize],
    int proj_index) {
  #pragma HLS inline
  accum_q_t lane_sums[kProjectionDotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < kProjectionDotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kProjectionDotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < kProjectionDotPar; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      lane_sums[lane] += MulForMacDspQ610(input[hidden_index], weights[proj_index][hidden_index]);
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < kProjectionDotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

void RunProjectionStoreBand0StreamParallelQ610(
    hls::stream<q_data_t>& sequence_input_stream,
    const q_data_t (&proj_weight_q610)[kBand0ProjSize][kSbHiddenSize],
    const q_data_t (&proj_bias_q610)[kBand0ProjSize],
    q_data_t* df_coef_q610) {
  #pragma HLS inline off
  q_data_t input_buffer[kSbHiddenSize];
  #pragma HLS array_partition variable=input_buffer complete dim=1

  for (int frame_index = 0; frame_index < kFixedNumFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=kFixedNumFrames max=kFixedNumFrames
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      ReadFixedVectorFromStreamQ610(sequence_input_stream, input_buffer);
      for (int proj_index = 0; proj_index < kBand0ProjSize; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        const accum_q_t sum_q20 = (static_cast<accum_q_t>(proj_bias_q610[proj_index]) * q_scale_q20) +
                                  ProjectionDotProductDspQ610(input_buffer, proj_weight_q610, proj_index);
        const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
        const int complex_index = proj_index / (kBand0CtrFreq * kBand0DfOrder);
        const int feature_remainder = proj_index % (kBand0CtrFreq * kBand0DfOrder);
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

void RunBand0OptimizedDataflowQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    const q_data_t (&layer0_weight_ih_q610)[kSbHiddenSize][kBand0PackedInputSize],
    const q_data_t (&layer0_weight_hh_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer0_bias_ih_q610)[2][kSbHiddenSize],
    const q_data_t (&layer0_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer0_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&layer1_weight_ih_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer1_weight_hh_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer1_bias_ih_q610)[2][kSbHiddenSize],
    const q_data_t (&layer1_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer1_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&proj_weight_q610)[kBand0ProjSize][kSbHiddenSize],
    const q_data_t (&proj_bias_q610)[kBand0ProjSize],
    q_data_t (&layer0_hx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t (&layer0_cx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t (&layer1_hx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t (&layer1_cx_state_q610)[kBand0NumSubbands][kSbHiddenSize],
    q_data_t* df_coef_q610) {
  #pragma HLS inline off
  #pragma HLS stable variable=layer0_weight_ih_q610
  #pragma HLS stable variable=layer0_weight_hh_q610
  #pragma HLS stable variable=layer0_bias_ih_q610
  #pragma HLS stable variable=layer0_bn_mul_q610
  #pragma HLS stable variable=layer0_bn_add_q610
  #pragma HLS stable variable=layer1_weight_ih_q610
  #pragma HLS stable variable=layer1_weight_hh_q610
  #pragma HLS stable variable=layer1_bias_ih_q610
  #pragma HLS stable variable=layer1_bn_mul_q610
  #pragma HLS stable variable=layer1_bn_add_q610
  #pragma HLS stable variable=proj_weight_q610
  #pragma HLS stable variable=proj_bias_q610
  hls::stream<q_data_t> sequence_stream;
  hls::stream<q_data_t> layer0_output_stream;
  hls::stream<q_data_t> layer1_output_stream;
  #pragma HLS stream variable=sequence_stream depth=128
  #pragma HLS stream variable=layer0_output_stream depth=512
  #pragma HLS stream variable=layer1_output_stream depth=512

  #pragma HLS dataflow
  GenerateBand0SequenceStreamOptimizedQ610(noisy_input_q610, fb_output_q610, sequence_stream);
  RunGSULayer0StreamParallelQ610(
      sequence_stream,
      layer0_weight_ih_q610,
      layer0_weight_hh_q610,
      layer0_bias_ih_q610,
      layer0_bn_mul_q610,
      layer0_bn_add_q610,
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer0_output_stream);
  RunGSULayer1StreamParallelQ610(
      layer0_output_stream,
      layer1_weight_ih_q610,
      layer1_weight_hh_q610,
      layer1_bias_ih_q610,
      layer1_bn_mul_q610,
      layer1_bn_add_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      layer1_output_stream);
  RunProjectionStoreBand0StreamParallelQ610(
      layer1_output_stream,
      proj_weight_q610,
      proj_bias_q610,
      df_coef_q610);
}

void RunBand0OptimizedCoreQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    const q_data_t (&layer0_weight_ih_q610)[kSbHiddenSize][kBand0PackedInputSize],
    const q_data_t (&layer0_weight_hh_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer0_bias_ih_q610)[2][kSbHiddenSize],
    const q_data_t (&layer0_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer0_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&layer1_weight_ih_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer1_weight_hh_q610)[kSbHiddenSize][kSbHiddenSize],
    const q_data_t (&layer1_bias_ih_q610)[2][kSbHiddenSize],
    const q_data_t (&layer1_bn_mul_q610)[kSbHiddenSize],
    const q_data_t (&layer1_bn_add_q610)[kSbHiddenSize],
    const q_data_t (&proj_weight_q610)[kBand0ProjSize][kSbHiddenSize],
    const q_data_t (&proj_bias_q610)[kBand0ProjSize],
    q_data_t* df_coef_q610) {
  #pragma HLS inline off
  static q_data_t layer0_hx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer0_cx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer1_hx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer1_cx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  #pragma HLS array_partition variable=layer0_hx_state_q610 cyclic factor=kLayer0HiddenPar dim=2
  #pragma HLS array_partition variable=layer0_cx_state_q610 cyclic factor=kLayer0HiddenPar dim=2
  #pragma HLS array_partition variable=layer1_hx_state_q610 cyclic factor=kLayer1HiddenPar dim=2
  #pragma HLS array_partition variable=layer1_cx_state_q610 cyclic factor=kLayer1HiddenPar dim=2

  ClearStateVectorQ610(layer0_hx_state_q610);
  ClearStateVectorQ610(layer0_cx_state_q610);
  ClearStateVectorQ610(layer1_hx_state_q610);
  ClearStateVectorQ610(layer1_cx_state_q610);

  RunBand0OptimizedDataflowQ610(
      noisy_input_q610,
      fb_output_q610,
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
      layer0_hx_state_q610,
      layer0_cx_state_q610,
      layer1_hx_state_q610,
      layer1_cx_state_q610,
      df_coef_q610);
}
}

}  // namespace

namespace subband_q610 {

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
  #pragma HLS INTERFACE m_axi port=noisy_input_q610 offset=slave bundle=gmem_in depth=kBand0InputElementCount
  #pragma HLS INTERFACE m_axi port=fb_output_q610 offset=slave bundle=gmem_in depth=kBand0InputElementCount
  #pragma HLS INTERFACE m_axi port=layer0_weight_ih_q610 offset=slave bundle=weights depth=(kSbHiddenSize * kBand0PackedInputSize)
  #pragma HLS INTERFACE m_axi port=layer0_weight_hh_q610 offset=slave bundle=weights depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer0_bias_ih_q610 offset=slave bundle=weights depth=(2 * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer0_bn_mul_q610 offset=slave bundle=weights depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer0_bn_add_q610 offset=slave bundle=weights depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer1_weight_ih_q610 offset=slave bundle=weights depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_weight_hh_q610 offset=slave bundle=weights depth=(kSbHiddenSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_bias_ih_q610 offset=slave bundle=weights depth=(2 * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=layer1_bn_mul_q610 offset=slave bundle=weights depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=layer1_bn_add_q610 offset=slave bundle=weights depth=kSbHiddenSize
  #pragma HLS INTERFACE m_axi port=proj_weight_q610 offset=slave bundle=weights depth=(kBand0ProjSize * kSbHiddenSize)
  #pragma HLS INTERFACE m_axi port=proj_bias_q610 offset=slave bundle=weights depth=kBand0ProjSize
  #pragma HLS INTERFACE m_axi port=df_coef_q610 offset=slave bundle=gmem_out depth=kBand0DfCoefElementCount
  #pragma HLS INTERFACE s_axilite port=noisy_input_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=fb_output_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer0_weight_ih_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer0_weight_hh_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer0_bias_ih_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer0_bn_mul_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer0_bn_add_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer1_weight_ih_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer1_weight_hh_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer1_bias_ih_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer1_bn_mul_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=layer1_bn_add_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=proj_weight_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=proj_bias_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=df_coef_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=return bundle=control

  static q_data_t layer0_weight_ih_local[kSbHiddenSize][kBand0PackedInputSize];
  static q_data_t layer0_weight_hh_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer0_bias_ih_local[2][kSbHiddenSize];
  static q_data_t layer0_bn_mul_local[kSbHiddenSize];
  static q_data_t layer0_bn_add_local[kSbHiddenSize];
  static q_data_t layer1_weight_ih_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer1_weight_hh_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer1_bias_ih_local[2][kSbHiddenSize];
  static q_data_t layer1_bn_mul_local[kSbHiddenSize];
  static q_data_t layer1_bn_add_local[kSbHiddenSize];
  static q_data_t proj_weight_local[kBand0ProjSize][kSbHiddenSize];
  static q_data_t proj_bias_local[kBand0ProjSize];

  #pragma HLS bind_storage variable=layer0_weight_ih_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer0_weight_hh_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_weight_ih_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_weight_hh_local type=ram_2p impl=bram
  #pragma HLS bind_storage variable=proj_weight_local type=ram_2p impl=bram
  #pragma HLS array_partition variable=layer0_weight_ih_local cyclic factor=kLayer0HiddenPar dim=1
  #pragma HLS array_reshape variable=layer0_weight_ih_local cyclic factor=kLayer0InputPar dim=2
  #pragma HLS array_partition variable=layer0_weight_hh_local cyclic factor=kLayer0HiddenPar dim=1
  #pragma HLS array_reshape variable=layer0_weight_hh_local cyclic factor=kLayer0RecurrentPar dim=2
  #pragma HLS array_partition variable=layer0_bias_ih_local cyclic factor=kLayer0HiddenPar dim=2
  #pragma HLS array_partition variable=layer0_bn_mul_local cyclic factor=kLayer0HiddenPar dim=1
  #pragma HLS array_partition variable=layer0_bn_add_local cyclic factor=kLayer0HiddenPar dim=1
  #pragma HLS array_partition variable=layer1_weight_ih_local cyclic factor=kLayer1HiddenPar dim=1
  #pragma HLS array_reshape variable=layer1_weight_ih_local cyclic factor=kLayer1InputPar dim=2
  #pragma HLS array_partition variable=layer1_weight_hh_local cyclic factor=kLayer1HiddenPar dim=1
  #pragma HLS array_reshape variable=layer1_weight_hh_local cyclic factor=kLayer1RecurrentPar dim=2
  #pragma HLS array_partition variable=layer1_bias_ih_local cyclic factor=kLayer1HiddenPar dim=2
  #pragma HLS array_partition variable=layer1_bn_mul_local cyclic factor=kLayer1HiddenPar dim=1
  #pragma HLS array_partition variable=layer1_bn_add_local cyclic factor=kLayer1HiddenPar dim=1
  #pragma HLS array_reshape variable=proj_weight_local cyclic factor=kProjectionDotPar dim=2

  LoadBand0Weights2DQ610(
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

  RunBand0OptimizedCoreQ610(
      noisy_input_q610,
      fb_output_q610,
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
      df_coef_q610);
}

namespace {

constexpr int kRealtimeHiddenPar = 2;
constexpr int kRealtimeDotPar = 32;
constexpr int kRealtimeProjectionDotPar = 32;
constexpr int kRtlReadyProjectionDotPar = 16;
constexpr int kRealtimeGsuLayerWeightCount =
    (2 * kSbHiddenSize * kSbHiddenSize) + (4 * kSbHiddenSize);
constexpr int kRealtimeEstimatedDsp =
    (kRealtimeHiddenPar * kRealtimeDotPar * 2) + (3 * kRealtimeHiddenPar) + kRealtimeProjectionDotPar;
static_assert(kRealtimeEstimatedDsp <= kZyboZ720DspBudget,
              "Realtime time-shared engine must fit the Zybo Z7-20 DSP budget.");

q_data_t ExtractPackedRealtimeWeightQ610(const packed_weight_word_t& word, int lane) {
  #pragma HLS inline
  q_data_t value;
  value.range(15, 0) = word.range((lane * 16) + 15, lane * 16);
  return value;
}

template <int Lane>
q_data_t ExtractPackedRealtimeWeightLaneQ610(const packed_weight_word_t& word) {
  #pragma HLS inline
  static_assert(Lane >= 0 && Lane < kRealtimeWeightWordLanes,
                "Packed realtime weight lane must be in the 256-bit word.");
  q_data_t value;
  value.range(15, 0) = word.range((Lane * 16) + 15, Lane * 16);
  return value;
}

void UnpackPackedRealtimeWeightWordToRowQ610(
    const packed_weight_word_t& word,
    int hidden_base,
    q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline
  proj_row[hidden_base + 0] = ExtractPackedRealtimeWeightLaneQ610<0>(word);
  proj_row[hidden_base + 1] = ExtractPackedRealtimeWeightLaneQ610<1>(word);
  proj_row[hidden_base + 2] = ExtractPackedRealtimeWeightLaneQ610<2>(word);
  proj_row[hidden_base + 3] = ExtractPackedRealtimeWeightLaneQ610<3>(word);
  proj_row[hidden_base + 4] = ExtractPackedRealtimeWeightLaneQ610<4>(word);
  proj_row[hidden_base + 5] = ExtractPackedRealtimeWeightLaneQ610<5>(word);
  proj_row[hidden_base + 6] = ExtractPackedRealtimeWeightLaneQ610<6>(word);
  proj_row[hidden_base + 7] = ExtractPackedRealtimeWeightLaneQ610<7>(word);
  proj_row[hidden_base + 8] = ExtractPackedRealtimeWeightLaneQ610<8>(word);
  proj_row[hidden_base + 9] = ExtractPackedRealtimeWeightLaneQ610<9>(word);
  proj_row[hidden_base + 10] = ExtractPackedRealtimeWeightLaneQ610<10>(word);
  proj_row[hidden_base + 11] = ExtractPackedRealtimeWeightLaneQ610<11>(word);
  proj_row[hidden_base + 12] = ExtractPackedRealtimeWeightLaneQ610<12>(word);
  proj_row[hidden_base + 13] = ExtractPackedRealtimeWeightLaneQ610<13>(word);
  proj_row[hidden_base + 14] = ExtractPackedRealtimeWeightLaneQ610<14>(word);
  proj_row[hidden_base + 15] = ExtractPackedRealtimeWeightLaneQ610<15>(word);
}

int RealtimeWeightWordIndex(int element_offset) {
  #pragma HLS inline
  return element_offset / kRealtimeWeightWordLanes;
}

axis_q610_t MakeAxisQ610(q_data_t value, bool last) {
  #pragma HLS inline
  axis_q610_t word;
  word.data.range(15, 0) = value.range(15, 0);
  word.keep = 3;
  word.strb = 3;
  word.last = last ? 1 : 0;
  return word;
}

q_data_t AxisToQ610(const axis_q610_t& word) {
  #pragma HLS inline
  q_data_t value;
  value.range(15, 0) = word.data.range(15, 0);
  return value;
}

int ClampRealtimeFrameCount(int num_frames) {
  #pragma HLS inline
  int frames = num_frames;
  if (frames < 0) {
    frames = 0;
  }
  if (frames > kRealtimeChunkFrames) {
    frames = kRealtimeChunkFrames;
  }
  return frames;
}

int RealtimeBandWeightOffset(int band_index) {
  #pragma HLS inline
  if (band_index == 0) {
    return kBand0RealtimeWeightOffset;
  }
  if (band_index == 1) {
    return kBand1RealtimeWeightOffset;
  }
  return kBand2RealtimeWeightOffset;
}

int RealtimeBandOutputOffset(int band_index) {
  #pragma HLS inline
  if (band_index == 0) {
    return kBand0RealtimeDfCoefOffset;
  }
  if (band_index == 1) {
    return kBand1RealtimeDfCoefOffset;
  }
  return kBand2RealtimeDfCoefOffset;
}

int RealtimeBandStateOffset(int band_index) {
  #pragma HLS inline
  if (band_index == 0) {
    return 0;
  }
  if (band_index == 1) {
    return kBand0NumSubbands;
  }
  return kBand0NumSubbands + kBand1NumSubbands;
}

int RealtimeBandTotalFreqs(const BandSpec& spec) {
  #pragma HLS inline
  return spec.num_subbands * spec.ctr_freq;
}

int ReflectFrequencyIndexRealtimeQ610(int freq_index) {
  #pragma HLS inline
  if (freq_index < 0) {
    return -freq_index;
  }
  if (freq_index >= kNumFreqs) {
    return (2 * kNumFreqs) - freq_index - 2;
  }
  return freq_index;
}

void ReadRealtimeInputChunkQ610(
    hls::stream<axis_q610_t>& noisy_fft_stream,
    hls::stream<axis_q610_t>& fb_fft_stream,
    int num_frames,
    q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs]) {
  #pragma HLS inline off
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    if (frame_index < num_frames) {
      for (int freq_index = 0; freq_index < kNumFreqs; ++freq_index) {
        #pragma HLS pipeline II=1
        noisy_chunk[frame_index][freq_index] = AxisToQ610(noisy_fft_stream.read());
      }
      for (int freq_index = 0; freq_index < kNumFreqs; ++freq_index) {
        #pragma HLS pipeline II=1
        fb_chunk[frame_index][freq_index] = AxisToQ610(fb_fft_stream.read());
      }
    }
  }
}

void EmitRealtimeOutputChunkQ610(
    const q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame],
    int num_frames,
    hls::stream<axis_q610_t>& df_coef_stream) {
  #pragma HLS inline off
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    #pragma HLS LOOP_FLATTEN off
    if (frame_index < num_frames) {
      for (int output_index = 0; output_index < kRealtimeDfCoefPerFrame; ++output_index) {
        #pragma HLS pipeline II=1
        const bool is_last =
            (frame_index == (num_frames - 1)) && (output_index == (kRealtimeDfCoefPerFrame - 1));
        df_coef_stream.write(MakeAxisQ610(output_chunk[frame_index][output_index], is_last));
      }
    }
  }
}

void ClearRealtimeStatesQ610(
    q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  for (int band_index = 0; band_index < kNumBands; ++band_index) {
    for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
      for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
        #pragma HLS pipeline II=1
        layer0_hx_state[band_index][subband_index][hidden_index] = 0;
        layer0_cx_state[band_index][subband_index][hidden_index] = 0;
        layer1_hx_state[band_index][subband_index][hidden_index] = 0;
        layer1_cx_state[band_index][subband_index][hidden_index] = 0;
      }
    }
  }
}

void ClearRealtimeCompactStatesQ610(
    q_data_t layer0_hx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kRealtimeTotalSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  for (int subband_index = 0; subband_index < kRealtimeTotalSubbands; ++subband_index) {
    for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
      #pragma HLS pipeline II=1
      layer0_hx_state[subband_index][hidden_index] = 0;
      layer0_cx_state[subband_index][hidden_index] = 0;
      layer1_hx_state[subband_index][hidden_index] = 0;
      layer1_cx_state[subband_index][hidden_index] = 0;
    }
  }
}

q_pack32_t CombinePackedWeightWordsToPack32Q610(
    const packed_weight_word_t& word_lo,
    const packed_weight_word_t& word_hi) {
  #pragma HLS inline
  q_pack32_t tile = 0;
  tile.range(255, 0) = word_lo.range(255, 0);
  tile.range(511, 256) = word_hi.range(255, 0);
  return tile;
}

q_data_t ExtractPack32LaneQ610(const q_pack32_t& word, int lane) {
  #pragma HLS inline
  return SvGetPack32LaneQ610(word, lane);
}

void SetPack32LaneQ610(q_pack32_t& word, int lane, q_data_t value) {
  #pragma HLS inline
  SvSetPack32LaneQ610(word, lane, value);
}

int SvGsuSequenceTileIndexQ610(int frame_index, int subband_index, int tile_index) {
  #pragma HLS inline
  return SvSeqTileIndexQ610(frame_index, subband_index, tile_index);
}

int SvGsuStateTileIndexQ610(int state_subband_index, int tile_index) {
  #pragma HLS inline
  return SvStateTileIndexQ610(state_subband_index, tile_index);
}

int SvGsuWeightTileIndexQ610(int hidden_index, int tile_index) {
  #pragma HLS inline
  return SvWeightTileIndexQ610(hidden_index, tile_index);
}

void ClearRealtimePackedStatesQ610(
    q_pack32_t layer0_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer0_cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_cx_state_tiles[kSvGsuStateTileCount]) {
  #pragma HLS inline off
  for (int tile_index = 0; tile_index < kSvGsuStateTileCount; ++tile_index) {
    #pragma HLS pipeline II=1
    layer0_hx_state_tiles[tile_index] = 0;
    layer0_cx_state_tiles[tile_index] = 0;
    layer1_hx_state_tiles[tile_index] = 0;
    layer1_cx_state_tiles[tile_index] = 0;
  }
}

void ClearRealtimeSequenceTilesQ610(q_pack32_t sequence_tiles[kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  for (int tile_index = 0; tile_index < kSvGsuSequenceTileCount; ++tile_index) {
    #pragma HLS pipeline II=1
    sequence_tiles[tile_index] = 0;
  }
}

void LoadRealtimeGSULayerWeightsPackedQ610(
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    q_pack32_t weight_ih_tiles[kSvGsuWeightTileCount],
    q_pack32_t weight_hh_tiles[kSvGsuWeightTileCount],
    q_pack32_t bias_ih_tiles[kSvGsuBiasTileCount],
    q_pack32_t bn_mul_tiles[kSvGsuHiddenTiles],
    q_pack32_t bn_add_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline off
  const int weight_ih_offset = weight_offset;
  for (int row = 0; row < kSbHiddenSize; ++row) {
    for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
      #pragma HLS pipeline II=1
      const int col_base = tile_index * kSvGsuTileLanes;
      const packed_weight_word_t word_lo =
          weights_q610[RealtimeWeightWordIndex(weight_ih_offset + (row * kSbHiddenSize) + col_base)];
      const packed_weight_word_t word_hi =
          weights_q610[RealtimeWeightWordIndex(weight_ih_offset + (row * kSbHiddenSize) + col_base +
                                               kRealtimeWeightWordLanes)];
      weight_ih_tiles[SvGsuWeightTileIndexQ610(row, tile_index)] =
          CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
    }
  }
  weight_offset += kSbHiddenSize * kSbHiddenSize;

  const int weight_hh_offset = weight_offset;
  for (int row = 0; row < kSbHiddenSize; ++row) {
    for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
      #pragma HLS pipeline II=1
      const int col_base = tile_index * kSvGsuTileLanes;
      const packed_weight_word_t word_lo =
          weights_q610[RealtimeWeightWordIndex(weight_hh_offset + (row * kSbHiddenSize) + col_base)];
      const packed_weight_word_t word_hi =
          weights_q610[RealtimeWeightWordIndex(weight_hh_offset + (row * kSbHiddenSize) + col_base +
                                               kRealtimeWeightWordLanes)];
      weight_hh_tiles[SvGsuWeightTileIndexQ610(row, tile_index)] =
          CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
    }
  }
  weight_offset += kSbHiddenSize * kSbHiddenSize;

  const int bias_offset = weight_offset;
  for (int gate_index = 0; gate_index < 2; ++gate_index) {
    for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
      #pragma HLS pipeline II=1
      const int hidden_base = tile_index * kSvGsuTileLanes;
      const packed_weight_word_t word_lo =
          weights_q610[RealtimeWeightWordIndex(bias_offset + (gate_index * kSbHiddenSize) + hidden_base)];
      const packed_weight_word_t word_hi =
          weights_q610[RealtimeWeightWordIndex(bias_offset + (gate_index * kSbHiddenSize) + hidden_base +
                                               kRealtimeWeightWordLanes)];
      bias_ih_tiles[(gate_index * kSvGsuHiddenTiles) + tile_index] =
          CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
    }
  }
  weight_offset += 2 * kSbHiddenSize;

  const int bn_mul_offset = weight_offset;
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS pipeline II=1
    const int hidden_base = tile_index * kSvGsuTileLanes;
    const packed_weight_word_t word_lo = weights_q610[RealtimeWeightWordIndex(bn_mul_offset + hidden_base)];
    const packed_weight_word_t word_hi =
        weights_q610[RealtimeWeightWordIndex(bn_mul_offset + hidden_base + kRealtimeWeightWordLanes)];
    bn_mul_tiles[tile_index] = CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
  }
  weight_offset += kSbHiddenSize;

  const int bn_add_offset = weight_offset;
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS pipeline II=1
    const int hidden_base = tile_index * kSvGsuTileLanes;
    const packed_weight_word_t word_lo = weights_q610[RealtimeWeightWordIndex(bn_add_offset + hidden_base)];
    const packed_weight_word_t word_hi =
        weights_q610[RealtimeWeightWordIndex(bn_add_offset + hidden_base + kRealtimeWeightWordLanes)];
    bn_add_tiles[tile_index] = CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
  }
  weight_offset += kSbHiddenSize;
}

void BuildRealtimeBandSequencePackedQ610(
    const BandSpec& spec,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_pack32_t sequence_tiles[kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
      for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
        #pragma HLS pipeline II=1
        q_pack32_t tile = 0;
        if ((frame_index < num_frames) && (subband_index < spec.num_subbands)) {
          const int center_start = spec.lower_cutoff_freq + (subband_index * spec.ctr_freq);
          for (int lane = 0; lane < kSvGsuTileLanes; ++lane) {
            #pragma HLS unroll
            const int input_index = (tile_index * kSvGsuTileLanes) + lane;
            q_data_t value = 0;
            if (input_index < spec.noisy_freq_size) {
              const int source_freq = ReflectFrequencyIndexRealtimeQ610(center_start + input_index - spec.nbr_freq);
              value = noisy_chunk[frame_index][source_freq];
            } else if (input_index < spec.packed_input_size) {
              const int fb_index = input_index - spec.noisy_freq_size;
              const int source_freq = ReflectFrequencyIndexRealtimeQ610(center_start + fb_index);
              value = fb_chunk[frame_index][source_freq];
            }
            SetPack32LaneQ610(tile, lane, value);
          }
        }
        sequence_tiles[SvGsuSequenceTileIndexQ610(frame_index, subband_index, tile_index)] = tile;
      }
    }
  }
}

void PrefetchGsuWeightGroupPingPongQ610(
    const packed_weight_word_t* weights_q610,
    int weight_ih_offset,
    int weight_hh_offset,
    int bias_offset,
    int bn_mul_offset,
    int bn_add_offset,
    int hidden_base,
    q_pack32_t weight_ih_group[kRealtimeHiddenPar][kSvGsuHiddenTiles],
    q_pack32_t weight_hh_group[kRealtimeHiddenPar][kSvGsuHiddenTiles],
    q_data_t forget_bias[kRealtimeHiddenPar],
    q_data_t cell_bias[kRealtimeHiddenPar],
    q_data_t bn_mul[kRealtimeHiddenPar],
    q_data_t bn_add[kRealtimeHiddenPar]) {
  #pragma HLS inline off
  #pragma HLS array_partition variable=weight_ih_group complete dim=1
  #pragma HLS array_partition variable=weight_hh_group complete dim=1
  #pragma HLS array_partition variable=forget_bias complete dim=1
  #pragma HLS array_partition variable=cell_bias complete dim=1
  #pragma HLS array_partition variable=bn_mul complete dim=1
  #pragma HLS array_partition variable=bn_add complete dim=1

  for (int hidden_lane = 0; hidden_lane < kRealtimeHiddenPar; ++hidden_lane) {
    #pragma HLS unroll
    const int hidden_index = hidden_base + hidden_lane;
    const int forget_offset = bias_offset + hidden_index;
    const int cell_offset = bias_offset + kSbHiddenSize + hidden_index;
    const int bn_mul_value_offset = bn_mul_offset + hidden_index;
    const int bn_add_value_offset = bn_add_offset + hidden_index;
    forget_bias[hidden_lane] = ExtractPackedRealtimeWeightQ610(
        weights_q610[RealtimeWeightWordIndex(forget_offset)], forget_offset % kRealtimeWeightWordLanes);
    cell_bias[hidden_lane] = ExtractPackedRealtimeWeightQ610(
        weights_q610[RealtimeWeightWordIndex(cell_offset)], cell_offset % kRealtimeWeightWordLanes);
    bn_mul[hidden_lane] = ExtractPackedRealtimeWeightQ610(
        weights_q610[RealtimeWeightWordIndex(bn_mul_value_offset)], bn_mul_value_offset % kRealtimeWeightWordLanes);
    bn_add[hidden_lane] = ExtractPackedRealtimeWeightQ610(
        weights_q610[RealtimeWeightWordIndex(bn_add_value_offset)], bn_add_value_offset % kRealtimeWeightWordLanes);
  }

  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS pipeline II=1
    const int col_base = tile_index * kSvGsuTileLanes;
    for (int hidden_lane = 0; hidden_lane < kRealtimeHiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      const int ih_row_offset = weight_ih_offset + (hidden_index * kSbHiddenSize) + col_base;
      const int hh_row_offset = weight_hh_offset + (hidden_index * kSbHiddenSize) + col_base;
      const packed_weight_word_t ih_word_lo = weights_q610[RealtimeWeightWordIndex(ih_row_offset)];
      const packed_weight_word_t ih_word_hi =
          weights_q610[RealtimeWeightWordIndex(ih_row_offset + kRealtimeWeightWordLanes)];
      const packed_weight_word_t hh_word_lo = weights_q610[RealtimeWeightWordIndex(hh_row_offset)];
      const packed_weight_word_t hh_word_hi =
          weights_q610[RealtimeWeightWordIndex(hh_row_offset + kRealtimeWeightWordLanes)];
      weight_ih_group[hidden_lane][tile_index] = CombinePackedWeightWordsToPack32Q610(ih_word_lo, ih_word_hi);
      weight_hh_group[hidden_lane][tile_index] = CombinePackedWeightWordsToPack32Q610(hh_word_lo, hh_word_hi);
    }
  }
}

void SnapshotSvGsuFrameHxQ610(
    int num_subbands,
    int state_subband_offset,
    const q_pack32_t hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t prev_hx_tiles[kMaxNumSubbands][kSvGsuHiddenTiles]) {
  #pragma HLS inline off
  for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
    for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
      #pragma HLS pipeline II=1
      q_pack32_t value = 0;
      if (subband_index < num_subbands) {
        value = hx_state_tiles[SvGsuStateTileIndexQ610(state_subband_offset + subband_index, tile_index)];
      }
      prev_hx_tiles[subband_index][tile_index] = value;
    }
  }
}

void CopySvGsuSubbandTilesQ610(
    const q_pack32_t source_tiles[kSvGsuSequenceTileCount],
    int frame_index,
    int subband_index,
    q_pack32_t destination_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS unroll
    destination_tiles[tile_index] = source_tiles[SvGsuSequenceTileIndexQ610(frame_index, subband_index, tile_index)];
  }
}

void CopySvGsuPrevHxTilesQ610(
    const q_pack32_t source_tiles[kMaxNumSubbands][kSvGsuHiddenTiles],
    int subband_index,
    q_pack32_t destination_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS unroll
    destination_tiles[tile_index] = source_tiles[subband_index][tile_index];
  }
}

void RunSvGsuHiddenGroupBlackboxQ610(
    int input_size,
    int hidden_base,
    const q_pack32_t input_tiles[kSvGsuHiddenTiles],
    const q_pack32_t prev_hx_tiles[kSvGsuHiddenTiles],
    q_pack32_t hx_tile_in,
    q_pack32_t cx_tile_in,
    q_pack32_t output_tile_in,
    const q_pack32_t weight_ih_group[kRealtimeHiddenPar][kSvGsuHiddenTiles],
    const q_pack32_t weight_hh_group[kRealtimeHiddenPar][kSvGsuHiddenTiles],
    const q_data_t forget_bias[kRealtimeHiddenPar],
    const q_data_t cell_bias[kRealtimeHiddenPar],
    const q_data_t bn_mul[kRealtimeHiddenPar],
    const q_data_t bn_add[kRealtimeHiddenPar],
    q_pack32_t* hx_tile_out,
    q_pack32_t* cx_tile_out,
    q_pack32_t* output_tile_out) {
  #pragma HLS inline
  q_pack32_t hx_result = 0;
  q_pack32_t cx_result = 0;
  q_pack32_t output_result = 0;
  q_pack32_t result_tiles[3];
  q_pack32_t weight_ih_flat[kRealtimeHiddenPar * kSvGsuHiddenTiles];
  q_pack32_t weight_hh_flat[kRealtimeHiddenPar * kSvGsuHiddenTiles];
  q_data_t forget_bias_local[kRealtimeHiddenPar];
  q_data_t cell_bias_local[kRealtimeHiddenPar];
  q_data_t bn_mul_local[kRealtimeHiddenPar];
  q_data_t bn_add_local[kRealtimeHiddenPar];
  #pragma HLS bind_storage variable=result_tiles type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=weight_ih_flat type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=weight_hh_flat type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=forget_bias_local type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=cell_bias_local type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=bn_mul_local type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=bn_add_local type=ram_2p impl=lutram
  for (int hidden_lane = 0; hidden_lane < kRealtimeHiddenPar; ++hidden_lane) {
    #pragma HLS unroll
    forget_bias_local[hidden_lane] = forget_bias[hidden_lane];
    cell_bias_local[hidden_lane] = cell_bias[hidden_lane];
    bn_mul_local[hidden_lane] = bn_mul[hidden_lane];
    bn_add_local[hidden_lane] = bn_add[hidden_lane];
    for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
      #pragma HLS unroll
      const int flat_index = (hidden_lane * kSvGsuHiddenTiles) + tile_index;
      weight_ih_flat[flat_index] = weight_ih_group[hidden_lane][tile_index];
      weight_hh_flat[flat_index] = weight_hh_group[hidden_lane][tile_index];
    }
  }
  ::RunSvGsuHiddenGroupPackedQ610(
      input_size, hidden_base, input_tiles, prev_hx_tiles, hx_tile_in, cx_tile_in, output_tile_in, weight_ih_flat,
      weight_hh_flat, forget_bias_local, cell_bias_local, bn_mul_local, bn_add_local, result_tiles);
  hx_result = result_tiles[0];
  cx_result = result_tiles[1];
  output_result = result_tiles[2];
  *hx_tile_out = hx_result;
  *cx_tile_out = cx_result;
  *output_tile_out = output_result;
}

void LoadRealtimeGSULayerWeightsQ610(
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    int,
    q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    q_data_t bias_ih[2][kSbHiddenSize],
    q_data_t bn_mul[kSbHiddenSize],
    q_data_t bn_add[kSbHiddenSize]) {
  #pragma HLS inline off
  const int weight_ih_offset = weight_offset;
  for (int row = 0; row < kSbHiddenSize; ++row) {
    for (int col_base = 0; col_base < kSbHiddenSize; col_base += kRealtimeDotPar) {
      #pragma HLS pipeline II=1
      const packed_weight_word_t word_lo =
          weights_q610[RealtimeWeightWordIndex(weight_ih_offset + (row * kSbHiddenSize) + col_base)];
      const packed_weight_word_t word_hi =
          weights_q610[RealtimeWeightWordIndex(weight_ih_offset + (row * kSbHiddenSize) + col_base +
                                               kRealtimeWeightWordLanes)];
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        weight_ih[row][col_base + lane] = ExtractPackedRealtimeWeightQ610(word_lo, lane);
      }
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        weight_ih[row][col_base + kRealtimeWeightWordLanes + lane] = ExtractPackedRealtimeWeightQ610(word_hi, lane);
      }
    }
  }
  weight_offset += kSbHiddenSize * kSbHiddenSize;

  const int weight_hh_offset = weight_offset;
  for (int row = 0; row < kSbHiddenSize; ++row) {
    for (int col_base = 0; col_base < kSbHiddenSize; col_base += kRealtimeDotPar) {
      #pragma HLS pipeline II=1
      const packed_weight_word_t word_lo =
          weights_q610[RealtimeWeightWordIndex(weight_hh_offset + (row * kSbHiddenSize) + col_base)];
      const packed_weight_word_t word_hi =
          weights_q610[RealtimeWeightWordIndex(weight_hh_offset + (row * kSbHiddenSize) + col_base +
                                               kRealtimeWeightWordLanes)];
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        weight_hh[row][col_base + lane] = ExtractPackedRealtimeWeightQ610(word_lo, lane);
      }
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        weight_hh[row][col_base + kRealtimeWeightWordLanes + lane] = ExtractPackedRealtimeWeightQ610(word_hi, lane);
      }
    }
  }
  weight_offset += kSbHiddenSize * kSbHiddenSize;

  const int bias_offset = weight_offset;
  for (int gate_index = 0; gate_index < 2; ++gate_index) {
    for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeWeightWordLanes) {
      #pragma HLS pipeline II=1
      const packed_weight_word_t word =
          weights_q610[RealtimeWeightWordIndex(bias_offset + (gate_index * kSbHiddenSize) + hidden_base)];
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        bias_ih[gate_index][hidden_base + lane] = ExtractPackedRealtimeWeightQ610(word, lane);
      }
    }
  }
  weight_offset += 2 * kSbHiddenSize;

  const int bn_mul_offset = weight_offset;
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeWeightWordLanes) {
    #pragma HLS pipeline II=1
    const packed_weight_word_t word = weights_q610[RealtimeWeightWordIndex(bn_mul_offset + hidden_base)];
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      #pragma HLS unroll
      bn_mul[hidden_base + lane] = ExtractPackedRealtimeWeightQ610(word, lane);
    }
  }
  weight_offset += kSbHiddenSize;

  const int bn_add_offset = weight_offset;
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeWeightWordLanes) {
    #pragma HLS pipeline II=1
    const packed_weight_word_t word = weights_q610[RealtimeWeightWordIndex(bn_add_offset + hidden_base)];
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      #pragma HLS unroll
      bn_add[hidden_base + lane] = ExtractPackedRealtimeWeightQ610(word, lane);
    }
  }
  weight_offset += kSbHiddenSize;
}

void LoadRealtimeProjectionWeightsQ610(
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    int proj_size,
    q_data_t proj_weight[kMaxProjSize][kSbHiddenSize],
    q_data_t proj_bias[kMaxProjSize]) {
  #pragma HLS inline off
  const int proj_weight_offset = weight_offset;
  for (int proj_index = 0; proj_index < kMaxProjSize; ++proj_index) {
    for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeProjectionDotPar) {
      #pragma HLS pipeline II=1
      packed_weight_word_t word_lo = 0;
      packed_weight_word_t word_hi = 0;
      if (proj_index < proj_size) {
        word_lo =
            weights_q610[RealtimeWeightWordIndex(proj_weight_offset + (proj_index * kSbHiddenSize) + hidden_base)];
        word_hi = weights_q610[RealtimeWeightWordIndex(proj_weight_offset + (proj_index * kSbHiddenSize) +
                                                       hidden_base + kRealtimeWeightWordLanes)];
      }
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        proj_weight[proj_index][hidden_base + lane] = ExtractPackedRealtimeWeightQ610(word_lo, lane);
      }
      for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
        #pragma HLS unroll
        proj_weight[proj_index][hidden_base + kRealtimeWeightWordLanes + lane] =
            ExtractPackedRealtimeWeightQ610(word_hi, lane);
      }
    }
  }
  weight_offset += proj_size * kSbHiddenSize;

  const int proj_bias_offset = weight_offset;
  for (int proj_base = 0; proj_base < kMaxProjSize; proj_base += kRealtimeWeightWordLanes) {
    #pragma HLS pipeline II=1
    packed_weight_word_t word = 0;
    if (proj_base < proj_size) {
      word = weights_q610[RealtimeWeightWordIndex(proj_bias_offset + proj_base)];
    }
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      #pragma HLS unroll
      const int proj_index = proj_base + lane;
      q_data_t value = 0;
      if (proj_index < proj_size) {
        value = ExtractPackedRealtimeWeightQ610(word, lane);
      }
      proj_bias[proj_index] = value;
    }
  }
  weight_offset += RoundUpRealtimeWeightElements(proj_size);
}

void BuildRealtimeBandInputQ610(
    const BandSpec& spec,
    const q_data_t noisy_frame[kNumFreqs],
    const q_data_t fb_frame[kNumFreqs],
    int subband_index,
    q_data_t input_buffer[kSbHiddenSize]) {
  #pragma HLS inline off
  const int center_start = spec.lower_cutoff_freq + (subband_index * spec.ctr_freq);
  for (int input_index = 0; input_index < kSbHiddenSize; ++input_index) {
    #pragma HLS pipeline II=1
    q_data_t value = 0;
    if (input_index < spec.noisy_freq_size) {
      const int source_freq = ReflectFrequencyIndexRealtimeQ610(center_start + input_index - spec.nbr_freq);
      value = noisy_frame[source_freq];
    } else if (input_index < spec.packed_input_size) {
      const int fb_index = input_index - spec.noisy_freq_size;
      const int source_freq = ReflectFrequencyIndexRealtimeQ610(center_start + fb_index);
      value = fb_frame[source_freq];
    }
    input_buffer[input_index] = value;
  }
}

accum_q_t DotProductRealtimeDspQ610(
    const q_data_t input[kSbHiddenSize],
    int terms,
    const q_data_t weights[kSbHiddenSize][kSbHiddenSize],
    int hidden_index) {
  #pragma HLS inline
  accum_q_t lane_sums[kRealtimeDotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < kRealtimeDotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int base_index = 0; base_index < kSbHiddenSize; base_index += kRealtimeDotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < kRealtimeDotPar; ++lane) {
      #pragma HLS unroll
      const int index = base_index + lane;
      if (index < terms) {
        lane_sums[lane] += MulForMacDspQ610(input[index], weights[hidden_index][index]);
      }
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < kRealtimeDotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

template <int Terms, int Par>
accum_q_t DotProductRealtimeFixedDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t weights[kSbHiddenSize][kSbHiddenSize],
    int hidden_index) {
  #pragma HLS inline
  accum_q_t lane_sums[Par];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < Par; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int base_index = 0; base_index < Terms; base_index += Par) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < Par; ++lane) {
      #pragma HLS unroll
      const int index = base_index + lane;
      if (index < Terms) {
        lane_sums[lane] += MulForMacDspQ610(input[index], weights[hidden_index][index]);
      }
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < Par; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

template <int InputSize, int HiddenPar, int InputPar, int RecurrentPar>
void RunRealtimeGSUMacPhaseFixedQ610(
    const q_data_t input_ptr[kSbHiddenSize],
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t prev_hx_q610[kSbHiddenSize],
    hls::stream<ap_int<48 * HiddenPar> >& common_sum_stream) {
  #pragma HLS inline off
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += HiddenPar) {
    ap_int<48 * HiddenPar> common_packet = 0;
    for (int hidden_lane = 0; hidden_lane < HiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      const accum_q_t input_sum_q20 =
          DotProductRealtimeFixedDspQ610<InputSize, InputPar>(input_ptr, weight_ih, hidden_index);
      const accum_q_t recurrent_sum_q20 =
          DotProductRealtimeFixedDspQ610<kSbHiddenSize, RecurrentPar>(prev_hx_q610, weight_hh, hidden_index);
      const accum_q_t common_q20 = input_sum_q20 + recurrent_sum_q20;
      common_packet.range((48 * (hidden_lane + 1)) - 1, 48 * hidden_lane) = common_q20;
    }
    common_sum_stream.write(common_packet);
  }
}

template <int InputSize, int HiddenPar, int InputPar, int RecurrentPar, bool UseDspGateUpdate>
void RunRealtimeGSUCellFixedQ610(
    const q_data_t input_ptr[kSbHiddenSize],
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t hx_state_q610[kSbHiddenSize],
    q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t output_hy_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  q_data_t prev_hx_q610[kSbHiddenSize];
  q_data_t prev_cx_q610[kSbHiddenSize];
  hls::stream<ap_int<48 * HiddenPar> > common_sum_stream;
  #pragma HLS array_partition variable=prev_hx_q610 complete dim=1
  #pragma HLS array_partition variable=prev_cx_q610 complete dim=1
  #pragma HLS stream variable=common_sum_stream depth=2

  SnapshotGSUStateQ610<HiddenPar>(hx_state_q610, cx_state_q610, prev_hx_q610, prev_cx_q610);
  RunRealtimeGSUMacPhaseFixedQ610<InputSize, HiddenPar, InputPar, RecurrentPar>(
      input_ptr, weight_ih, weight_hh, prev_hx_q610, common_sum_stream);
  RunGSUGatePhaseBand0Q610<HiddenPar, UseDspGateUpdate>(
      common_sum_stream, bias_ih, bn_mul, bn_add, prev_cx_q610, hx_state_q610, cx_state_q610, output_hy_q610);
}

void RunRealtimeGSUCellSharedQ610(
    const q_data_t input_ptr[kSbHiddenSize],
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t hx_state_q610[kSbHiddenSize],
    q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t output_hy_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  RunRealtimeGSUCellFixedQ610<kSbHiddenSize, kRealtimeHiddenPar, kRealtimeDotPar, kRealtimeDotPar, true>(
      input_ptr, weight_ih, weight_hh, bias_ih, bn_mul, bn_add, hx_state_q610, cx_state_q610, output_hy_q610);
}

void CopyRealtimeHiddenVectorQ610(
    const q_data_t source[kSbHiddenSize],
    q_data_t destination[kSbHiddenSize]) {
  #pragma HLS inline
  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    #pragma HLS pipeline II=1
    destination[hidden_index] = source[hidden_index];
  }
}

void RunRealtimeGSUCellQ610(
    const q_data_t input_buffer[kSbHiddenSize],
    int input_size,
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t hx_state_q610[kSbHiddenSize],
    q_data_t cx_state_q610[kSbHiddenSize],
    q_data_t output_hy_q610[kSbHiddenSize]) {
  #pragma HLS inline off
  q_data_t prev_hx_q610[kSbHiddenSize];
  q_data_t prev_cx_q610[kSbHiddenSize];
  #pragma HLS array_partition variable=prev_hx_q610 complete dim=1
  #pragma HLS array_partition variable=prev_cx_q610 complete dim=1

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeHiddenPar) {
    #pragma HLS pipeline II=1
    for (int hidden_lane = 0; hidden_lane < kRealtimeHiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      prev_hx_q610[hidden_index] = hx_state_q610[hidden_index];
      prev_cx_q610[hidden_index] = cx_state_q610[hidden_index];
    }
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeHiddenPar) {
    for (int hidden_lane = 0; hidden_lane < kRealtimeHiddenPar; ++hidden_lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + hidden_lane;
      const accum_q_t input_sum_q20 =
          DotProductRealtimeDspQ610(input_buffer, input_size, weight_ih, hidden_index);
      const accum_q_t recurrent_sum_q20 =
          DotProductRealtimeDspQ610(prev_hx_q610, kSbHiddenSize, weight_hh, hidden_index);
      const accum_q_t common_q20 = input_sum_q20 + recurrent_sum_q20;
      const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
      const accum_q_t forget_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[0][hidden_index]) * q_scale_q20);
      const accum_q_t cell_q20 = common_q20 + (static_cast<accum_q_t>(bias_ih[1][hidden_index]) * q_scale_q20);

      const q_data_t forget_preact_q610 = SaturateInt16(RoundShiftRight(forget_q20, kQFrac));
      const q_data_t cell_preact_q610 = SaturateInt16(RoundShiftRight(cell_q20, kQFrac));
      const q_data_t forget_gate_q610 = SigmoidPwlQ610Fabric(forget_preact_q610);
      const q_data_t one_minus_forget_q610 = SubQ610(kQOne, forget_gate_q610);
      const q_data_t retained_q610 = MulGateUpdateQ610<true>(forget_gate_q610, prev_cx_q610[hidden_index]);
      const q_data_t injected_q610 = MulGateUpdateQ610<true>(one_minus_forget_q610, cell_preact_q610);

      q_data_t cy_q610 = AddQ610(retained_q610, injected_q610);
      const q_data_t scaled_q610 = MulQ610Dsp(cy_q610, bn_mul[hidden_index]);
      cy_q610 = AddQ610(scaled_q610, bn_add[hidden_index]);
      const q_data_t hy_q610 = StepActivationQ610(cy_q610);

      cx_state_q610[hidden_index] = cy_q610;
      hx_state_q610[hidden_index] = hy_q610;
      output_hy_q610[hidden_index] = hy_q610;
    }
  }
}

void RunRealtimeGSULayersSharedBandQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    q_data_t bias_ih[2][kSbHiddenSize],
    q_data_t bn_mul[kSbHiddenSize],
    q_data_t bn_add[kSbHiddenSize],
    q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  #pragma HLS allocation function instances=RunRealtimeGSUCellSharedQ610 limit=1
  q_data_t cell_input[kSbHiddenSize];
  #pragma HLS array_partition variable=cell_input complete dim=1

  for (int layer_index = 0; layer_index < kSbNumLayers; ++layer_index) {
    #pragma HLS LOOP_FLATTEN off
    const int layer_input_size = (layer_index == 0) ? spec.packed_input_size : kSbHiddenSize;
    LoadRealtimeGSULayerWeightsQ610(weights_q610, weight_offset, layer_input_size, weight_ih, weight_hh, bias_ih,
                                    bn_mul, bn_add);

    for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
      #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
      #pragma HLS LOOP_FLATTEN off
      if (frame_index < num_frames) {
        for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
          #pragma HLS LOOP_FLATTEN off
          if (subband_index < spec.num_subbands) {
            if (layer_index == 0) {
              BuildRealtimeBandInputQ610(
                  spec, noisy_chunk[frame_index], fb_chunk[frame_index], subband_index, cell_input);
            } else {
              CopyRealtimeHiddenVectorQ610(layer0_output[frame_index][subband_index], cell_input);
            }

            if (layer_index == 0) {
              RunRealtimeGSUCellSharedQ610(
                  cell_input, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
                  layer0_hx_state[spec.band_index][subband_index],
                  layer0_cx_state[spec.band_index][subband_index],
                  layer0_output[frame_index][subband_index]);
            } else {
              RunRealtimeGSUCellSharedQ610(
                  cell_input, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
                  layer1_hx_state[spec.band_index][subband_index],
                  layer1_cx_state[spec.band_index][subband_index],
                  layer1_output[frame_index][subband_index]);
            }
          }
        }
      }
    }
  }
}

void RunRealtimeGSULayersSharedBandCompactStateQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    q_data_t bias_ih[2][kSbHiddenSize],
    q_data_t bn_mul[kSbHiddenSize],
    q_data_t bn_add[kSbHiddenSize],
    q_data_t layer0_hx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kRealtimeTotalSubbands][kSbHiddenSize],
    q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  #pragma HLS allocation function instances=RunRealtimeGSUCellSharedQ610 limit=1
  q_data_t cell_input[kSbHiddenSize];
  #pragma HLS array_partition variable=cell_input complete dim=1

  const int state_subband_offset = RealtimeBandStateOffset(spec.band_index);
  for (int layer_index = 0; layer_index < kSbNumLayers; ++layer_index) {
    const int layer_input_size = (layer_index == 0) ? spec.packed_input_size : kSbHiddenSize;
    LoadRealtimeGSULayerWeightsQ610(weights_q610, weight_offset, layer_input_size, weight_ih, weight_hh, bias_ih,
                                    bn_mul, bn_add);

    for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
      #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
      if (frame_index < num_frames) {
        for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
          if (subband_index < spec.num_subbands) {
            const int state_subband_index = state_subband_offset + subband_index;
            if (layer_index == 0) {
              BuildRealtimeBandInputQ610(
                  spec, noisy_chunk[frame_index], fb_chunk[frame_index], subband_index, cell_input);
            } else {
              CopyRealtimeHiddenVectorQ610(layer0_output[frame_index][subband_index], cell_input);
            }

            if (layer_index == 0) {
              RunRealtimeGSUCellSharedQ610(
                  cell_input, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
                  layer0_hx_state[state_subband_index],
                  layer0_cx_state[state_subband_index],
                  layer0_output[frame_index][subband_index]);
            } else {
              RunRealtimeGSUCellSharedQ610(
                  cell_input, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
                  layer1_hx_state[state_subband_index],
                  layer1_cx_state[state_subband_index],
                  layer1_output[frame_index][subband_index]);
            }
          }
        }
      }
    }
  }
}

void RunRealtimeLayer0BandQ610(
    const BandSpec& spec,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  q_data_t input_buffer[kSbHiddenSize];
  #pragma HLS array_partition variable=input_buffer complete dim=1

  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
        if (subband_index < spec.num_subbands) {
          BuildRealtimeBandInputQ610(spec, noisy_chunk[frame_index], fb_chunk[frame_index], subband_index, input_buffer);
          RunRealtimeGSUCellFixedQ610<kMaxPackedInputSize, kRealtimeHiddenPar, kRealtimeDotPar, kRealtimeDotPar, true>(
              input_buffer,
              weight_ih,
              weight_hh,
              bias_ih,
              bn_mul,
              bn_add,
              layer0_hx_state[spec.band_index][subband_index],
              layer0_cx_state[spec.band_index][subband_index],
              layer0_output[frame_index][subband_index]);
        }
      }
    }
  }
}

void RunRealtimeLayer1BandQ610(
    const BandSpec& spec,
    int num_frames,
    const q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    const q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    const q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    const q_data_t bias_ih[2][kSbHiddenSize],
    const q_data_t bn_mul[kSbHiddenSize],
    const q_data_t bn_add[kSbHiddenSize],
    q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize]) {
  #pragma HLS inline off
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
        if (subband_index < spec.num_subbands) {
          RunRealtimeGSUCellFixedQ610<kSbHiddenSize, kRealtimeHiddenPar, kRealtimeDotPar, kRealtimeDotPar, true>(
              layer0_output[frame_index][subband_index],
              weight_ih,
              weight_hh,
              bias_ih,
              bn_mul,
              bn_add,
              layer1_hx_state[spec.band_index][subband_index],
              layer1_cx_state[spec.band_index][subband_index],
              layer1_output[frame_index][subband_index]);
        }
      }
    }
  }
}

accum_q_t ProjectionDotProductRealtimeDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t weights[kMaxProjSize][kSbHiddenSize],
    int proj_index) {
  #pragma HLS inline
  accum_q_t lane_sums[kRealtimeProjectionDotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeProjectionDotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      lane_sums[lane] += MulForMacDspQ610(input[hidden_index], weights[proj_index][hidden_index]);
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

q_data_t LoadPackedRealtimeWeightQ610(const packed_weight_word_t* weights_q610, int element_offset) {
  #pragma HLS inline
  const int word_index = RealtimeWeightWordIndex(element_offset);
  const int lane = element_offset % kRealtimeWeightWordLanes;
  const packed_weight_word_t word = weights_q610[word_index];
  return ExtractPackedRealtimeWeightQ610(word, lane);
}

accum_q_t ProjectionDotProductRealtimePackedDspQ610(
    const q_data_t input[kSbHiddenSize],
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int proj_index) {
  #pragma HLS inline
  accum_q_t lane_sums[kRealtimeProjectionDotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeProjectionDotPar) {
    #pragma HLS pipeline II=1
    const int row_offset = proj_weight_offset + (proj_index * kSbHiddenSize) + hidden_base;
    const packed_weight_word_t word_lo = weights_q610[RealtimeWeightWordIndex(row_offset)];
    const packed_weight_word_t word_hi =
        weights_q610[RealtimeWeightWordIndex(row_offset + kRealtimeWeightWordLanes)];
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      const q_data_t weight_value = ExtractPackedRealtimeWeightQ610(word_lo, lane);
      lane_sums[lane] += MulForMacDspQ610(input[hidden_index], weight_value);
    }
    for (int lane = 0; lane < kRealtimeWeightWordLanes; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + kRealtimeWeightWordLanes + lane;
      const q_data_t weight_value = ExtractPackedRealtimeWeightQ610(word_hi, lane);
      lane_sums[kRealtimeWeightWordLanes + lane] += MulForMacDspQ610(input[hidden_index], weight_value);
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

void LoadRealtimeProjectionRowPackedQ610(
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int proj_index,
    q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline off
  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeProjectionDotPar) {
    #pragma HLS pipeline II=1
    const int row_offset = proj_weight_offset + (proj_index * kSbHiddenSize) + hidden_base;
    const packed_weight_word_t word_lo = weights_q610[RealtimeWeightWordIndex(row_offset)];
    const packed_weight_word_t word_hi =
        weights_q610[RealtimeWeightWordIndex(row_offset + kRealtimeWeightWordLanes)];
    UnpackPackedRealtimeWeightWordToRowQ610(word_lo, hidden_base, proj_row);
    UnpackPackedRealtimeWeightWordToRowQ610(
        word_hi, hidden_base + kRealtimeWeightWordLanes, proj_row);
  }
}

accum_q_t ProjectionDotProductRealtimeRowDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline
  accum_q_t lane_sums[kRealtimeProjectionDotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeProjectionDotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      lane_sums[lane] += MulForMacDspQ610(input[hidden_index], proj_row[hidden_index]);
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < kRealtimeProjectionDotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

template <int DotPar>
accum_q_t ProjectionDotProductRealtimeRowFixedDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline off
  accum_q_t lane_sums[DotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < DotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += DotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < DotPar; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      if (hidden_index < kSbHiddenSize) {
        lane_sums[lane] += MulForMacDspQ610(input[hidden_index], proj_row[hidden_index]);
      }
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < DotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

accum_q_t ProjectionDotProductRealtimeRtlDspQ610(
    const q_data_t input[kSbHiddenSize],
    const q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline off
  return ProjectionDotProductRealtimeRowFixedDspQ610<kRtlReadyProjectionDotPar>(input, proj_row);
}

template <int DotPar>
accum_q_t ProjectionDotProductRealtimePackedTilesRowFixedDspQ610(
    const q_pack32_t input_tiles[kSvGsuHiddenTiles],
    const q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline off
  accum_q_t lane_sums[DotPar];
  #pragma HLS array_partition variable=lane_sums complete dim=1

  for (int lane = 0; lane < DotPar; ++lane) {
    #pragma HLS unroll
    lane_sums[lane] = 0;
  }

  for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += DotPar) {
    #pragma HLS pipeline II=1
    for (int lane = 0; lane < DotPar; ++lane) {
      #pragma HLS unroll
      const int hidden_index = hidden_base + lane;
      if (hidden_index < kSbHiddenSize) {
        const int tile_index = hidden_index / kSvGsuTileLanes;
        const int tile_lane = hidden_index % kSvGsuTileLanes;
        const q_data_t input_value = ExtractPack32LaneQ610(input_tiles[tile_index], tile_lane);
        lane_sums[lane] += MulForMacDspQ610(input_value, proj_row[hidden_index]);
      }
    }
  }

  accum_q_t total_q20 = 0;
  for (int lane = 0; lane < DotPar; ++lane) {
    #pragma HLS unroll
    total_q20 += lane_sums[lane];
  }
  return total_q20;
}

accum_q_t ProjectionDotProductRealtimePackedTilesRtlDspQ610(
    const q_pack32_t input_tiles[kSvGsuHiddenTiles],
    const q_data_t proj_row[kSbHiddenSize]) {
  #pragma HLS inline off
  return ProjectionDotProductRealtimePackedTilesRowFixedDspQ610<kRtlReadyProjectionDotPar>(input_tiles, proj_row);
}

#ifdef USE_PROJECTION_EXTERNAL
// C단계 외부 projection IP 호출 헬퍼.
// (1) 7개 input tile(각 512-bit를 32 lane × 16-bit로 펼쳐 224 word) + 224개 proj_row word를 request_stream으로 송출.
// (2) 외부 IP는 48-bit sum_q20을 16-bit 3 word (lo/mid/hi)로 분할해 response_stream으로 회신.
// (3) 본 함수는 3 word를 받아 48-bit accum_q_t로 재조립해 반환.
// 같은 입력이 in-place 비교 가능하도록 dot product 결과만 외부화하며,
// USE_PROJECTION_EXTERNAL 미정의 시에는 본 함수 자체가 비활성화되어 회귀 위험 zero.
accum_q_t CallExternalProjectionIpQ610(
    const q_pack32_t input_tiles[kSvGsuHiddenTiles],
    const q_data_t proj_row[kSbHiddenSize],
    hls::stream<axis_q610_t>& projection_request_stream,
    hls::stream<axis_q610_t>& projection_response_stream) {
  #pragma HLS inline off
#ifdef __SYNTHESIS__
  // 합성 시: stream으로 외부 projection IP 통신
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    for (int lane = 0; lane < kSvGsuTileLanes; ++lane) {
      #pragma HLS pipeline II=1
      const q_data_t value = SvGetPack32LaneQ610(input_tiles[tile_index], lane);
      projection_request_stream.write(MakeAxisQ610(value, false));
    }
  }
  for (int hidden_index = 0; hidden_index < kSbHiddenSize; ++hidden_index) {
    #pragma HLS pipeline II=1
    const bool is_last = (hidden_index == (kSbHiddenSize - 1));
    projection_request_stream.write(MakeAxisQ610(proj_row[hidden_index], is_last));
  }
  const q_data_t result_lo = AxisToQ610(projection_response_stream.read());
  const q_data_t result_mid = AxisToQ610(projection_response_stream.read());
  const q_data_t result_hi = AxisToQ610(projection_response_stream.read());
  accum_q_t result_q20 = 0;
  result_q20.range(15, 0) = ap_uint<16>(result_lo).range(15, 0);
  result_q20.range(31, 16) = ap_uint<16>(result_mid).range(15, 0);
  result_q20.range(47, 32) = ap_uint<16>(result_hi).range(15, 0);
  return result_q20;
#else
  // csim 시: stream 통신 우회 — main thread에서 직접 dot product 계산
  // (외부 IP 모사를 std::thread로 하면 hls::stream csim의 thread-safety 한계로 deadlock 가능)
  (void)projection_request_stream;
  (void)projection_response_stream;
  return ProjectionDotProductRealtimePackedTilesRtlDspQ610(input_tiles, proj_row);
#endif
}
#endif  // USE_PROJECTION_EXTERNAL

void LoadRealtimeProjectionRowTilesPackedQ610(
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int proj_index,
    q_pack32_t proj_row_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline off
  for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
    #pragma HLS pipeline II=1
    const int hidden_base = tile_index * kSvGsuTileLanes;
    const int row_offset = proj_weight_offset + (proj_index * kSbHiddenSize) + hidden_base;
    const packed_weight_word_t word_lo = weights_q610[RealtimeWeightWordIndex(row_offset)];
    const packed_weight_word_t word_hi =
        weights_q610[RealtimeWeightWordIndex(row_offset + kRealtimeWeightWordLanes)];
    proj_row_tiles[tile_index] = CombinePackedWeightWordsToPack32Q610(word_lo, word_hi);
  }
}

accum_q_t ProjectionDotProductRealtimePackedTilesSvQ610(
    const q_pack32_t input_tiles[kSvGsuHiddenTiles],
    const q_pack32_t proj_row_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline off
  accum_q_t sum_q20 = 0;
  ::ProjectionDotProductPackedScalarSvQ610(
      input_tiles[0], input_tiles[1], input_tiles[2], input_tiles[3], input_tiles[4], input_tiles[5],
      input_tiles[6], proj_row_tiles[0], proj_row_tiles[1], proj_row_tiles[2], proj_row_tiles[3],
      proj_row_tiles[4], proj_row_tiles[5], proj_row_tiles[6], &sum_q20);
  return sum_q20;
}

template <int BandIndex, int NumSubbands, int CtrFreq, int DfOrder, int ProjSize, int DotPar>
void RunRealtimeProjectionBandRowCachedFixedQ610(
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int num_frames,
    const q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  static_assert(DotPar == kRtlReadyProjectionDotPar,
                "The RTL-ready projection wrapper must match the shared projection datapath.");
  q_data_t proj_row[kSbHiddenSize];
  #pragma HLS array_partition variable=proj_row complete dim=1

  const int proj_bias_offset = proj_weight_offset + (ProjSize * kSbHiddenSize);
  const int band_output_offset = RealtimeBandOutputOffset(BandIndex);
  const int band_total_freqs = NumSubbands * CtrFreq;
  int complex_index = 0;
  int ctr_index = 0;
  int df_index = 0;

  for (int proj_index = 0; proj_index < ProjSize; ++proj_index) {
    LoadRealtimeProjectionRowPackedQ610(weights_q610, proj_weight_offset, proj_index, proj_row);
    const q_data_t bias_q610 = LoadPackedRealtimeWeightQ610(weights_q610, proj_bias_offset + proj_index);

    for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
      #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
      if (frame_index < num_frames) {
        for (int subband_index = 0; subband_index < NumSubbands; ++subband_index) {
          const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
          const accum_q_t sum_q20 =
              (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
              ProjectionDotProductRealtimeRtlDspQ610(layer1_output[frame_index][subband_index], proj_row);
          const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
          const int merged_freq_index = (subband_index * CtrFreq) + ctr_index;
          const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                   complex_index;
          output_chunk[frame_index][output_index] = value_q610;
        }
      }
    }

    ++df_index;
    if (df_index == DfOrder) {
      df_index = 0;
      ++ctr_index;
      if (ctr_index == CtrFreq) {
        ctr_index = 0;
        ++complex_index;
      }
    }
  }
}

template <int BandIndex, int NumSubbands, int CtrFreq, int DfOrder, int ProjSize, int DotPar>
void RunRealtimeProjectionBandRowCachedPackedFixedQ610(
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int num_frames,
    const q_pack32_t layer1_output_tiles[kSvGsuSequenceTileCount],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]
#ifdef USE_PROJECTION_EXTERNAL
    , hls::stream<axis_q610_t>& projection_request_stream,
    hls::stream<axis_q610_t>& projection_response_stream
#endif
    ) {
  #pragma HLS inline off
  static_assert(DotPar == kRtlReadyProjectionDotPar,
                "The SV GSU path keeps the existing shared projection datapath.");
  q_data_t proj_row[kSbHiddenSize];
  q_pack32_t projection_input_tiles[kSvGsuHiddenTiles];
  #pragma HLS array_partition variable=proj_row complete dim=1
  #pragma HLS array_partition variable=projection_input_tiles complete dim=1

  const int proj_bias_offset = proj_weight_offset + (ProjSize * kSbHiddenSize);
  const int band_output_offset = RealtimeBandOutputOffset(BandIndex);
  const int band_total_freqs = NumSubbands * CtrFreq;
  int complex_index = 0;
  int ctr_index = 0;
  int df_index = 0;

  for (int proj_index = 0; proj_index < ProjSize; ++proj_index) {
    LoadRealtimeProjectionRowPackedQ610(weights_q610, proj_weight_offset, proj_index, proj_row);
    const q_data_t bias_q610 = LoadPackedRealtimeWeightQ610(weights_q610, proj_bias_offset + proj_index);

    for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
      #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
      if (frame_index < num_frames) {
        for (int subband_index = 0; subband_index < NumSubbands; ++subband_index) {
          for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
            #pragma HLS unroll
            projection_input_tiles[tile_index] =
                layer1_output_tiles[SvGsuSequenceTileIndexQ610(frame_index, subband_index, tile_index)];
          }
          const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
          const accum_q_t sum_q20 =
              (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
#ifdef USE_PROJECTION_EXTERNAL
              CallExternalProjectionIpQ610(projection_input_tiles, proj_row,
                                            projection_request_stream, projection_response_stream);
#else
              ProjectionDotProductRealtimePackedTilesRtlDspQ610(projection_input_tiles, proj_row);
#endif
          const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
          const int merged_freq_index = (subband_index * CtrFreq) + ctr_index;
          const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                   complex_index;
          output_chunk[frame_index][output_index] = value_q610;
        }
      }
    }

    ++df_index;
    if (df_index == DfOrder) {
      df_index = 0;
      ++ctr_index;
      if (ctr_index == CtrFreq) {
        ctr_index = 0;
        ++complex_index;
      }
    }
  }
}

template <int BandIndex, int NumSubbands, int CtrFreq, int DfOrder, int ProjSize>
void RunRealtimeProjectionBandRowCachedPackedSvQ610(
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int num_frames,
    const q_pack32_t layer1_output_tiles[kSvGsuSequenceTileCount],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]
#ifdef USE_PROJECTION_EXTERNAL
    , hls::stream<axis_q610_t>& projection_request_stream,
    hls::stream<axis_q610_t>& projection_response_stream
#endif
    ) {
  #pragma HLS inline off
  q_pack32_t proj_row_tiles[kSvGsuHiddenTiles];
  q_pack32_t projection_input_tiles[kSvGsuHiddenTiles];
  #pragma HLS bind_storage variable=proj_row_tiles type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=projection_input_tiles type=ram_2p impl=lutram

  const int proj_bias_offset = proj_weight_offset + (ProjSize * kSbHiddenSize);
  const int band_output_offset = RealtimeBandOutputOffset(BandIndex);
  const int band_total_freqs = NumSubbands * CtrFreq;
  int complex_index = 0;
  int ctr_index = 0;
  int df_index = 0;

  for (int proj_index = 0; proj_index < ProjSize; ++proj_index) {
    LoadRealtimeProjectionRowTilesPackedQ610(weights_q610, proj_weight_offset, proj_index, proj_row_tiles);
    const q_data_t bias_q610 = LoadPackedRealtimeWeightQ610(weights_q610, proj_bias_offset + proj_index);

    for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
      #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
      if (frame_index < num_frames) {
        for (int subband_index = 0; subband_index < NumSubbands; ++subband_index) {
          for (int tile_index = 0; tile_index < kSvGsuHiddenTiles; ++tile_index) {
            #pragma HLS pipeline II=1
            projection_input_tiles[tile_index] =
                layer1_output_tiles[SvGsuSequenceTileIndexQ610(frame_index, subband_index, tile_index)];
          }
          const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
#ifdef USE_PROJECTION_EXTERNAL
          // Sv 변형의 packed proj_row_tiles를 unpack해 외부 IP에 전달
          q_data_t proj_row_unpacked[kSbHiddenSize];
          for (int t = 0; t < kSvGsuHiddenTiles; ++t) {
            #pragma HLS unroll
            for (int lane = 0; lane < kSvGsuTileLanes; ++lane) {
              #pragma HLS unroll
              proj_row_unpacked[t * kSvGsuTileLanes + lane] = SvGetPack32LaneQ610(proj_row_tiles[t], lane);
            }
          }
          const accum_q_t sum_q20 =
              (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
              CallExternalProjectionIpQ610(projection_input_tiles, proj_row_unpacked,
                                            projection_request_stream, projection_response_stream);
#else
          const accum_q_t sum_q20 =
              (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
              ProjectionDotProductRealtimePackedTilesSvQ610(projection_input_tiles, proj_row_tiles);
#endif
          const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
          const int merged_freq_index = (subband_index * CtrFreq) + ctr_index;
          const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                   complex_index;
          output_chunk[frame_index][output_index] = value_q610;
        }
      }
    }

    ++df_index;
    if (df_index == DfOrder) {
      df_index = 0;
      ++ctr_index;
      if (ctr_index == CtrFreq) {
        ctr_index = 0;
        ++complex_index;
      }
    }
  }
}

void RunRealtimeProjectionBandRowCachedQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int num_frames,
    const q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  q_data_t proj_row[kSbHiddenSize];
  #pragma HLS array_partition variable=proj_row cyclic factor=kRealtimeProjectionDotPar dim=1

  const int proj_bias_offset = proj_weight_offset + (spec.proj_size * kSbHiddenSize);
  const int band_output_offset = RealtimeBandOutputOffset(spec.band_index);
  const int band_total_freqs = RealtimeBandTotalFreqs(spec);
  for (int proj_index = 0; proj_index < kMaxProjSize; ++proj_index) {
    if (proj_index < spec.proj_size) {
      LoadRealtimeProjectionRowPackedQ610(weights_q610, proj_weight_offset, proj_index, proj_row);
      const q_data_t bias_q610 = LoadPackedRealtimeWeightQ610(weights_q610, proj_bias_offset + proj_index);
      const int df_index = proj_index % spec.df_order;
      const int freq_complex_index = proj_index / spec.df_order;
      const int ctr_index = freq_complex_index % spec.ctr_freq;
      const int complex_index = freq_complex_index / spec.ctr_freq;

      for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
        #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
        if (frame_index < num_frames) {
          for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
            if (subband_index < spec.num_subbands) {
              const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
              const accum_q_t sum_q20 =
                  (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
                  ProjectionDotProductRealtimeRowDspQ610(layer1_output[frame_index][subband_index], proj_row);
              const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
              const int merged_freq_index = (subband_index * spec.ctr_freq) + ctr_index;
              const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                       complex_index;
              output_chunk[frame_index][output_index] = value_q610;
            }
          }
        }
      }
    }
  }
}

void RunRealtimeProjectionBandPackedQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int proj_weight_offset,
    int num_frames,
    const q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  const int proj_bias_offset = proj_weight_offset + (spec.proj_size * kSbHiddenSize);
  const int band_output_offset = RealtimeBandOutputOffset(spec.band_index);
  const int band_total_freqs = RealtimeBandTotalFreqs(spec);
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
        if (subband_index < spec.num_subbands) {
          int complex_index = 0;
          int ctr_index = 0;
          int df_index = 0;
          for (int proj_index = 0; proj_index < kMaxProjSize; ++proj_index) {
            if (proj_index < spec.proj_size) {
              const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
              const q_data_t bias_q610 =
                  LoadPackedRealtimeWeightQ610(weights_q610, proj_bias_offset + proj_index);
              const accum_q_t sum_q20 =
                  (static_cast<accum_q_t>(bias_q610) * q_scale_q20) +
                  ProjectionDotProductRealtimePackedDspQ610(
                      layer1_output[frame_index][subband_index], weights_q610, proj_weight_offset, proj_index);
              const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
              const int merged_freq_index = (subband_index * spec.ctr_freq) + ctr_index;
              const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                       complex_index;
              output_chunk[frame_index][output_index] = value_q610;
            }
            ++df_index;
            if (df_index == spec.df_order) {
              df_index = 0;
              ++ctr_index;
              if (ctr_index == spec.ctr_freq) {
                ctr_index = 0;
                ++complex_index;
              }
            }
          }
        }
      }
    }
  }
}

void RunRealtimeProjectionBandQ610(
    const BandSpec& spec,
    int num_frames,
    const q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    const q_data_t proj_weight[kMaxProjSize][kSbHiddenSize],
    const q_data_t proj_bias[kMaxProjSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  q_data_t projection_input[kSbHiddenSize];
  #pragma HLS array_partition variable=projection_input complete dim=1
  const int band_output_offset = RealtimeBandOutputOffset(spec.band_index);
  const int band_total_freqs = RealtimeBandTotalFreqs(spec);
  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS loop_tripcount min=1 max=kRealtimeChunkFrames
    #pragma HLS LOOP_FLATTEN off
    if (frame_index < num_frames) {
      for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
        #pragma HLS LOOP_FLATTEN off
        if (subband_index < spec.num_subbands) {
          CopyRealtimeHiddenVectorQ610(layer1_output[frame_index][subband_index], projection_input);
          int complex_index = 0;
          int ctr_index = 0;
          int df_index = 0;
          for (int proj_index = 0; proj_index < kMaxProjSize; ++proj_index) {
            if (proj_index < spec.proj_size) {
              const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
              const accum_q_t sum_q20 = (static_cast<accum_q_t>(proj_bias[proj_index]) * q_scale_q20) +
                                        ProjectionDotProductRealtimeDspQ610(projection_input, proj_weight, proj_index);
              const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
              const int merged_freq_index = (subband_index * spec.ctr_freq) + ctr_index;
              const int output_index = band_output_offset + ((df_index * band_total_freqs + merged_freq_index) * 2) +
                                       complex_index;
              output_chunk[frame_index][output_index] = value_q610;
            }
            ++df_index;
            if (df_index == spec.df_order) {
              df_index = 0;
              ++ctr_index;
              if (ctr_index == spec.ctr_freq) {
                ctr_index = 0;
                ++complex_index;
              }
            }
          }
        }
      }
    }
  }
}

void RunRealtimeGSULayersSvPackedQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int& weight_offset,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_pack32_t weight_ih_pingpong[2][kRealtimeHiddenPar][kSvGsuHiddenTiles],
    q_pack32_t weight_hh_pingpong[2][kRealtimeHiddenPar][kSvGsuHiddenTiles],
    q_data_t forget_bias_pingpong[2][kRealtimeHiddenPar],
    q_data_t cell_bias_pingpong[2][kRealtimeHiddenPar],
    q_data_t bn_mul_pingpong[2][kRealtimeHiddenPar],
    q_data_t bn_add_pingpong[2][kRealtimeHiddenPar],
    q_pack32_t layer0_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer0_cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer0_input_tiles[kSvGsuSequenceTileCount],
    q_pack32_t layer0_output_tiles[kSvGsuSequenceTileCount],
    q_pack32_t layer1_output_tiles[kSvGsuSequenceTileCount],
    q_pack32_t prev_hx_tiles[kMaxNumSubbands][kSvGsuHiddenTiles],
    q_pack32_t hidden_input_tiles[kSvGsuHiddenTiles],
    q_pack32_t hidden_prev_hx_tiles[kSvGsuHiddenTiles]) {
  #pragma HLS inline off
  const int state_subband_offset = RealtimeBandStateOffset(spec.band_index);

  BuildRealtimeBandSequencePackedQ610(spec, num_frames, noisy_chunk, fb_chunk, layer0_input_tiles);
  ClearRealtimeSequenceTilesQ610(layer0_output_tiles);
  const int layer0_weight_ih_offset = weight_offset;
  const int layer0_weight_hh_offset = layer0_weight_ih_offset + (kSbHiddenSize * kSbHiddenSize);
  const int layer0_bias_offset = layer0_weight_hh_offset + (kSbHiddenSize * kSbHiddenSize);
  const int layer0_bn_mul_offset = layer0_bias_offset + (2 * kSbHiddenSize);
  const int layer0_bn_add_offset = layer0_bn_mul_offset + kSbHiddenSize;
  weight_offset = layer0_bn_add_offset + kSbHiddenSize;

  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS pipeline off
    if (frame_index < num_frames) {
      SnapshotSvGsuFrameHxQ610(spec.num_subbands, state_subband_offset, layer0_hx_state_tiles, prev_hx_tiles);
      for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeHiddenPar) {
        #pragma HLS pipeline off
        const int pingpong_index = (hidden_base / kRealtimeHiddenPar) & 1;
        PrefetchGsuWeightGroupPingPongQ610(
            weights_q610, layer0_weight_ih_offset, layer0_weight_hh_offset, layer0_bias_offset, layer0_bn_mul_offset,
            layer0_bn_add_offset, hidden_base, weight_ih_pingpong[pingpong_index],
            weight_hh_pingpong[pingpong_index], forget_bias_pingpong[pingpong_index],
            cell_bias_pingpong[pingpong_index], bn_mul_pingpong[pingpong_index], bn_add_pingpong[pingpong_index]);
        const int hidden_tile_index = hidden_base / kSvGsuTileLanes;
        for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
          #pragma HLS pipeline off
          if (subband_index < spec.num_subbands) {
            const int state_tile_index = SvGsuStateTileIndexQ610(state_subband_offset + subband_index, hidden_tile_index);
            const int output_tile_index = SvGsuSequenceTileIndexQ610(frame_index, subband_index, hidden_tile_index);
            q_pack32_t hx_tile_out = 0;
            q_pack32_t cx_tile_out = 0;
            q_pack32_t output_tile_out = 0;
            CopySvGsuSubbandTilesQ610(layer0_input_tiles, frame_index, subband_index, hidden_input_tiles);
            CopySvGsuPrevHxTilesQ610(prev_hx_tiles, subband_index, hidden_prev_hx_tiles);
            RunSvGsuHiddenGroupBlackboxQ610(
                spec.packed_input_size, hidden_base, hidden_input_tiles, hidden_prev_hx_tiles,
                layer0_hx_state_tiles[state_tile_index], layer0_cx_state_tiles[state_tile_index],
                layer0_output_tiles[output_tile_index], weight_ih_pingpong[pingpong_index],
                weight_hh_pingpong[pingpong_index], forget_bias_pingpong[pingpong_index],
                cell_bias_pingpong[pingpong_index], bn_mul_pingpong[pingpong_index], bn_add_pingpong[pingpong_index],
                &hx_tile_out, &cx_tile_out, &output_tile_out);
            layer0_hx_state_tiles[state_tile_index] = hx_tile_out;
            layer0_cx_state_tiles[state_tile_index] = cx_tile_out;
            layer0_output_tiles[output_tile_index] = output_tile_out;
          }
        }
      }
    }
  }

  ClearRealtimeSequenceTilesQ610(layer1_output_tiles);
  const int layer1_weight_ih_offset = weight_offset;
  const int layer1_weight_hh_offset = layer1_weight_ih_offset + (kSbHiddenSize * kSbHiddenSize);
  const int layer1_bias_offset = layer1_weight_hh_offset + (kSbHiddenSize * kSbHiddenSize);
  const int layer1_bn_mul_offset = layer1_bias_offset + (2 * kSbHiddenSize);
  const int layer1_bn_add_offset = layer1_bn_mul_offset + kSbHiddenSize;
  weight_offset = layer1_bn_add_offset + kSbHiddenSize;

  for (int frame_index = 0; frame_index < kRealtimeChunkFrames; ++frame_index) {
    #pragma HLS pipeline off
    if (frame_index < num_frames) {
      SnapshotSvGsuFrameHxQ610(spec.num_subbands, state_subband_offset, layer1_hx_state_tiles, prev_hx_tiles);
      for (int hidden_base = 0; hidden_base < kSbHiddenSize; hidden_base += kRealtimeHiddenPar) {
        #pragma HLS pipeline off
        const int pingpong_index = (hidden_base / kRealtimeHiddenPar) & 1;
        PrefetchGsuWeightGroupPingPongQ610(
            weights_q610, layer1_weight_ih_offset, layer1_weight_hh_offset, layer1_bias_offset, layer1_bn_mul_offset,
            layer1_bn_add_offset, hidden_base, weight_ih_pingpong[pingpong_index],
            weight_hh_pingpong[pingpong_index], forget_bias_pingpong[pingpong_index],
            cell_bias_pingpong[pingpong_index], bn_mul_pingpong[pingpong_index], bn_add_pingpong[pingpong_index]);
        const int hidden_tile_index = hidden_base / kSvGsuTileLanes;
        for (int subband_index = 0; subband_index < kMaxNumSubbands; ++subband_index) {
          #pragma HLS pipeline off
          if (subband_index < spec.num_subbands) {
            const int state_tile_index = SvGsuStateTileIndexQ610(state_subband_offset + subband_index, hidden_tile_index);
            const int output_tile_index = SvGsuSequenceTileIndexQ610(frame_index, subband_index, hidden_tile_index);
            q_pack32_t hx_tile_out = 0;
            q_pack32_t cx_tile_out = 0;
            q_pack32_t output_tile_out = 0;
            CopySvGsuSubbandTilesQ610(layer0_output_tiles, frame_index, subband_index, hidden_input_tiles);
            CopySvGsuPrevHxTilesQ610(prev_hx_tiles, subband_index, hidden_prev_hx_tiles);
            RunSvGsuHiddenGroupBlackboxQ610(
                kSbHiddenSize, hidden_base, hidden_input_tiles, hidden_prev_hx_tiles,
                layer1_hx_state_tiles[state_tile_index], layer1_cx_state_tiles[state_tile_index],
                layer1_output_tiles[output_tile_index], weight_ih_pingpong[pingpong_index],
                weight_hh_pingpong[pingpong_index], forget_bias_pingpong[pingpong_index],
                cell_bias_pingpong[pingpong_index], bn_mul_pingpong[pingpong_index], bn_add_pingpong[pingpong_index],
                &hx_tile_out, &cx_tile_out, &output_tile_out);
            layer1_hx_state_tiles[state_tile_index] = hx_tile_out;
            layer1_cx_state_tiles[state_tile_index] = cx_tile_out;
            layer1_output_tiles[output_tile_index] = output_tile_out;
          }
        }
      }
    }
  }
}

void RunRealtimeSingleGsuLayerSvFullQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int layer_weight_offset,
    int num_frames,
    const q_pack32_t sequence_input_tiles[kSvGsuSequenceTileCount],
    q_pack32_t weight_ih_tiles[kSvGsuWeightTileCount],
    q_pack32_t weight_hh_tiles[kSvGsuWeightTileCount],
    q_pack32_t bias_ih_tiles[kSvGsuBiasTileCount],
    q_pack32_t bn_mul_tiles[kSvGsuHiddenTiles],
    q_pack32_t bn_add_tiles[kSvGsuHiddenTiles],
    q_pack32_t hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t sequence_output_tiles[kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  const int state_subband_offset = RealtimeBandStateOffset(spec.band_index);
  int local_weight_offset = layer_weight_offset;

  LoadRealtimeGSULayerWeightsPackedQ610(
      weights_q610, local_weight_offset, weight_ih_tiles, weight_hh_tiles, bias_ih_tiles, bn_mul_tiles, bn_add_tiles);
  ::RunSvGsuLayerFullTilesQ610(
      num_frames, spec.num_subbands, spec.packed_input_size, state_subband_offset, sequence_input_tiles,
      weight_ih_tiles, weight_hh_tiles, bias_ih_tiles, bn_mul_tiles, bn_add_tiles, hx_state_tiles, cx_state_tiles,
      sequence_output_tiles);
}

void RunRealtimeSingleGsuLayer1SvFullQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int layer_weight_offset,
    int num_frames,
    const q_pack32_t sequence_input_tiles[kSvGsuSequenceTileCount],
    q_pack32_t weight_ih_tiles[kSvGsuWeightTileCount],
    q_pack32_t weight_hh_tiles[kSvGsuWeightTileCount],
    q_pack32_t bias_ih_tiles[kSvGsuBiasTileCount],
    q_pack32_t bn_mul_tiles[kSvGsuHiddenTiles],
    q_pack32_t bn_add_tiles[kSvGsuHiddenTiles],
    q_pack32_t hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t sequence_output_tiles[kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  const int state_subband_offset = RealtimeBandStateOffset(spec.band_index);
  int local_weight_offset = layer_weight_offset;

  LoadRealtimeGSULayerWeightsPackedQ610(
      weights_q610, local_weight_offset, weight_ih_tiles, weight_hh_tiles, bias_ih_tiles, bn_mul_tiles, bn_add_tiles);
  ::RunSvGsuLayerFullTilesQ610(
      num_frames, spec.num_subbands, kSbHiddenSize, state_subband_offset, sequence_input_tiles, weight_ih_tiles,
      weight_hh_tiles, bias_ih_tiles, bn_mul_tiles, bn_add_tiles, hx_state_tiles, cx_state_tiles,
      sequence_output_tiles);
}

int RunRealtimeGSULayersSvFullQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int weight_offset,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_pack32_t weight_ih_tiles[kSvGsuWeightTileCount],
    q_pack32_t weight_hh_tiles[kSvGsuWeightTileCount],
    q_pack32_t bias_ih_tiles[kSvGsuBiasTileCount],
    q_pack32_t bn_mul_tiles[kSvGsuHiddenTiles],
    q_pack32_t bn_add_tiles[kSvGsuHiddenTiles],
    q_pack32_t layer0_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer0_cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_hx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer1_cx_state_tiles[kSvGsuStateTileCount],
    q_pack32_t layer0_input_tiles[kSvGsuSequenceTileCount],
    q_pack32_t layer0_output_tiles[kSvGsuSequenceTileCount],
    q_pack32_t layer1_output_tiles[kSvGsuSequenceTileCount]) {
  #pragma HLS inline off
  const int layer0_weight_offset = weight_offset;
  const int layer1_weight_offset = layer0_weight_offset + kRealtimeGsuLayerWeightCount;

  BuildRealtimeBandSequencePackedQ610(spec, num_frames, noisy_chunk, fb_chunk, layer0_input_tiles);
  ClearRealtimeSequenceTilesQ610(layer0_output_tiles);
  RunRealtimeSingleGsuLayerSvFullQ610(
      spec, weights_q610, layer0_weight_offset, num_frames, layer0_input_tiles, weight_ih_tiles, weight_hh_tiles,
      bias_ih_tiles, bn_mul_tiles, bn_add_tiles, layer0_hx_state_tiles, layer0_cx_state_tiles, layer0_output_tiles);

  ClearRealtimeSequenceTilesQ610(layer1_output_tiles);
  RunRealtimeSingleGsuLayer1SvFullQ610(
      spec, weights_q610, layer1_weight_offset, num_frames, layer0_output_tiles, weight_ih_tiles, weight_hh_tiles,
      bias_ih_tiles, bn_mul_tiles, bn_add_tiles, layer1_hx_state_tiles, layer1_cx_state_tiles, layer1_output_tiles);

  return layer1_weight_offset + kRealtimeGsuLayerWeightCount;
}

void RunRealtimeBandQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    q_data_t bias_ih[2][kSbHiddenSize],
    q_data_t bn_mul[kSbHiddenSize],
    q_data_t bn_add[kSbHiddenSize],
    q_data_t proj_weight[kMaxProjSize][kSbHiddenSize],
    q_data_t proj_bias[kMaxProjSize],
    q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  int weight_offset = RealtimeBandWeightOffset(spec.band_index);
  RunRealtimeGSULayersSharedBandQ610(
      spec, weights_q610, weight_offset, num_frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih, bn_mul,
      bn_add, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output, layer1_output);

  LoadRealtimeProjectionWeightsQ610(weights_q610, weight_offset, spec.proj_size, proj_weight, proj_bias);
  RunRealtimeProjectionBandQ610(spec, num_frames, layer1_output, proj_weight, proj_bias, output_chunk);
}

#ifdef USE_RTL_BAND_ENGINE
void RunRealtimeBandRtlReadyQ610(
    const BandSpec& spec,
    const packed_weight_word_t* weights_q610,
    int num_frames,
    const q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs],
    const q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs],
    q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize],
    q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize],
    q_data_t bias_ih[2][kSbHiddenSize],
    q_data_t bn_mul[kSbHiddenSize],
    q_data_t bn_add[kSbHiddenSize],
    q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize],
    q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame]) {
  #pragma HLS inline off
  int weight_offset = RealtimeBandWeightOffset(spec.band_index);
  RunRealtimeGSULayersSharedBandQ610(
      spec, weights_q610, weight_offset, num_frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih, bn_mul,
      bn_add, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output, layer1_output);

  const int proj_weight_offset = weight_offset;
  RunRealtimeProjectionBandRowCachedQ610(
      spec, weights_q610, proj_weight_offset, num_frames, layer1_output, output_chunk);
}
#endif

}  // namespace

void RunSubbandRealtimeTopCoreQ610(
    hls::stream<axis_q610_t>& noisy_fft_stream,
    hls::stream<axis_q610_t>& fb_fft_stream,
    const packed_weight_word_t weights_q610[kRealtimeWeightsWordCount],
    int num_frames,
    bool reset_state,
#ifdef USE_PROJECTION_EXTERNAL
    hls::stream<axis_q610_t>& projection_request_stream,
    hls::stream<axis_q610_t>& projection_response_stream,
#endif
    hls::stream<axis_q610_t>& df_coef_stream) {
  #pragma HLS inline
  #pragma HLS allocation function instances=RunRealtimeGSUCellSharedQ610 limit=1
  #pragma HLS allocation function instances=RunRealtimeGSULayersSharedBandQ610 limit=1
#ifdef USE_SV_GSU_FULL
  #pragma HLS allocation function instances=RunSvGsuLayerFullTilesQ610 limit=1
  #ifdef USE_SV_GSU_FULL_HLS_PROJECTION
  #pragma HLS allocation function instances=LoadRealtimeProjectionRowPackedQ610 limit=1
  #pragma HLS allocation function instances=ProjectionDotProductRealtimePackedTilesRtlDspQ610 limit=1
  #else
  #pragma HLS allocation function instances=ProjectionDotProductPackedScalarSvQ610 limit=1
  #pragma HLS allocation function instances=LoadRealtimeProjectionRowTilesPackedQ610 limit=1
  #endif
#elif defined(USE_SV_GSU_LAYER)
  #pragma HLS allocation function instances=RunSvGsuHiddenGroupPackedQ610 limit=1
  #pragma HLS allocation function instances=LoadRealtimeProjectionRowPackedQ610 limit=1
  #pragma HLS allocation function instances=ProjectionDotProductRealtimePackedTilesRtlDspQ610 limit=1
#endif
#ifdef USE_RTL_BAND_ENGINE
  #pragma HLS allocation function instances=LoadRealtimeProjectionRowPackedQ610 limit=1
  #pragma HLS allocation function instances=ProjectionDotProductRealtimeRtlDspQ610 limit=1
#endif

  static q_data_t noisy_chunk[kRealtimeChunkFrames][kNumFreqs];
  static q_data_t fb_chunk[kRealtimeChunkFrames][kNumFreqs];
  static q_data_t output_chunk[kRealtimeChunkFrames][kRealtimeDfCoefPerFrame];
#if !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  static q_data_t weight_ih[kSbHiddenSize][kSbHiddenSize];
  static q_data_t weight_hh[kSbHiddenSize][kSbHiddenSize];
  static q_data_t bias_ih[2][kSbHiddenSize];
  static q_data_t bn_mul[kSbHiddenSize];
  static q_data_t bn_add[kSbHiddenSize];
#endif
#if !defined(USE_RTL_BAND_ENGINE) && !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  static q_data_t proj_weight[kMaxProjSize][kSbHiddenSize];
  static q_data_t proj_bias[kMaxProjSize];
  static q_data_t layer0_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize];
  static q_data_t layer0_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize];
  static q_data_t layer1_hx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize];
  static q_data_t layer1_cx_state[kNumBands][kMaxNumSubbands][kSbHiddenSize];
#elif defined(USE_RTL_BAND_ENGINE)
  static q_data_t layer0_hx_state[kRealtimeTotalSubbands][kSbHiddenSize];
  static q_data_t layer0_cx_state[kRealtimeTotalSubbands][kSbHiddenSize];
  static q_data_t layer1_hx_state[kRealtimeTotalSubbands][kSbHiddenSize];
  static q_data_t layer1_cx_state[kRealtimeTotalSubbands][kSbHiddenSize];
#endif
#if !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  static q_data_t layer0_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize];
  static q_data_t layer1_output[kRealtimeChunkFrames][kMaxNumSubbands][kSbHiddenSize];
#endif
#if defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  static q_pack32_t sv_weight_ih_pingpong[2][kRealtimeHiddenPar][kSvGsuHiddenTiles];
  static q_pack32_t sv_weight_hh_pingpong[2][kRealtimeHiddenPar][kSvGsuHiddenTiles];
  static q_data_t sv_forget_bias_pingpong[2][kRealtimeHiddenPar];
  static q_data_t sv_cell_bias_pingpong[2][kRealtimeHiddenPar];
  static q_data_t sv_bn_mul_pingpong[2][kRealtimeHiddenPar];
  static q_data_t sv_bn_add_pingpong[2][kRealtimeHiddenPar];
#endif
#ifdef USE_SV_GSU_FULL
  static q_pack32_t sv_weight_ih_tiles[kSvGsuWeightTileCount];
  static q_pack32_t sv_weight_hh_tiles[kSvGsuWeightTileCount];
  static q_pack32_t sv_bias_ih_tiles[kSvGsuBiasTileCount];
  static q_pack32_t sv_bn_mul_tiles[kSvGsuHiddenTiles];
  static q_pack32_t sv_bn_add_tiles[kSvGsuHiddenTiles];
#endif
#if defined(USE_SV_GSU_LAYER) || defined(USE_SV_GSU_FULL)
  static q_pack32_t sv_layer0_hx_state_tiles[kSvGsuStateTileCount];
  static q_pack32_t sv_layer0_cx_state_tiles[kSvGsuStateTileCount];
  static q_pack32_t sv_layer1_hx_state_tiles[kSvGsuStateTileCount];
  static q_pack32_t sv_layer1_cx_state_tiles[kSvGsuStateTileCount];
  static q_pack32_t sv_layer0_input_tiles[kSvGsuSequenceTileCount];
  static q_pack32_t sv_layer0_output_tiles[kSvGsuSequenceTileCount];
  static q_pack32_t sv_layer1_output_tiles[kSvGsuSequenceTileCount];
#endif
#if defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  static q_pack32_t sv_prev_hx_tiles[kMaxNumSubbands][kSvGsuHiddenTiles];
  static q_pack32_t sv_hidden_input_tiles[kSvGsuHiddenTiles];
  static q_pack32_t sv_hidden_prev_hx_tiles[kSvGsuHiddenTiles];
#endif

  #pragma HLS bind_storage variable=noisy_chunk type=ram_2p impl=bram
  #pragma HLS bind_storage variable=fb_chunk type=ram_2p impl=bram
  #pragma HLS bind_storage variable=output_chunk type=ram_2p impl=bram
#if !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS bind_storage variable=weight_ih type=ram_2p impl=bram
  #pragma HLS bind_storage variable=weight_hh type=ram_2p impl=bram
#endif
#if !defined(USE_RTL_BAND_ENGINE) && !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS bind_storage variable=proj_weight type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer0_hx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer0_cx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_hx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_cx_state type=ram_2p impl=bram
#elif defined(USE_RTL_BAND_ENGINE)
  #pragma HLS bind_storage variable=layer0_hx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer0_cx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_hx_state type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_cx_state type=ram_2p impl=bram
#endif
#if !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS bind_storage variable=layer0_output type=ram_2p impl=bram
  #pragma HLS bind_storage variable=layer1_output type=ram_2p impl=bram
  #pragma HLS array_partition variable=weight_ih cyclic factor=kRealtimeHiddenPar dim=1
  #pragma HLS array_reshape variable=weight_ih cyclic factor=kRealtimeDotPar dim=2
  #pragma HLS array_partition variable=weight_hh cyclic factor=kRealtimeHiddenPar dim=1
  #pragma HLS array_reshape variable=weight_hh cyclic factor=kRealtimeDotPar dim=2
  #pragma HLS array_partition variable=bias_ih cyclic factor=kRealtimeHiddenPar dim=2
  #pragma HLS array_partition variable=bn_mul cyclic factor=kRealtimeHiddenPar dim=1
  #pragma HLS array_partition variable=bn_add cyclic factor=kRealtimeHiddenPar dim=1
#endif
#if !defined(USE_RTL_BAND_ENGINE) && !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS array_reshape variable=proj_weight cyclic factor=kRealtimeProjectionDotPar dim=2
  #pragma HLS array_partition variable=layer0_hx_state cyclic factor=kRealtimeHiddenPar dim=3
  #pragma HLS array_partition variable=layer0_cx_state cyclic factor=kRealtimeHiddenPar dim=3
  #pragma HLS array_partition variable=layer1_hx_state cyclic factor=kRealtimeHiddenPar dim=3
  #pragma HLS array_partition variable=layer1_cx_state cyclic factor=kRealtimeHiddenPar dim=3
#elif defined(USE_RTL_BAND_ENGINE)
  #pragma HLS array_partition variable=layer0_hx_state cyclic factor=kRealtimeHiddenPar dim=2
  #pragma HLS array_partition variable=layer0_cx_state cyclic factor=kRealtimeHiddenPar dim=2
  #pragma HLS array_partition variable=layer1_hx_state cyclic factor=kRealtimeHiddenPar dim=2
  #pragma HLS array_partition variable=layer1_cx_state cyclic factor=kRealtimeHiddenPar dim=2
#endif
#if !defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS array_partition variable=layer0_output cyclic factor=kRealtimeHiddenPar dim=3
  #pragma HLS array_partition variable=layer1_output cyclic factor=kRealtimeHiddenPar dim=3
#endif
#if defined(USE_SV_GSU_LAYER) || defined(USE_SV_GSU_FULL)
  #pragma HLS bind_storage variable=sv_layer0_hx_state_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer0_cx_state_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer1_hx_state_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer1_cx_state_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer0_input_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer0_output_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_layer1_output_tiles type=ram_2p impl=bram
#endif
#ifdef USE_SV_GSU_FULL
  #pragma HLS bind_storage variable=sv_weight_ih_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_weight_hh_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_bias_ih_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_bn_mul_tiles type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=sv_bn_add_tiles type=ram_2p impl=lutram
#endif
#if defined(USE_SV_GSU_LAYER) && !defined(USE_SV_GSU_FULL)
  #pragma HLS bind_storage variable=sv_prev_hx_tiles type=ram_2p impl=bram
  #pragma HLS bind_storage variable=sv_hidden_input_tiles type=ram_2p impl=lutram
  #pragma HLS bind_storage variable=sv_hidden_prev_hx_tiles type=ram_2p impl=lutram
#endif

  const int frames = ClampRealtimeFrameCount(num_frames);
  ReadRealtimeInputChunkQ610(noisy_fft_stream, fb_fft_stream, frames, noisy_chunk, fb_chunk);

  if (reset_state) {
#if defined(USE_SV_GSU_LAYER) || defined(USE_SV_GSU_FULL)
    ClearRealtimePackedStatesQ610(
        sv_layer0_hx_state_tiles, sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles, sv_layer1_cx_state_tiles);
#elif defined(USE_RTL_BAND_ENGINE)
    ClearRealtimeCompactStatesQ610(layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state);
#else
    ClearRealtimeStatesQ610(layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state);
#endif
  }

#ifdef USE_SV_GSU_FULL
  int band0_weight_offset = RunRealtimeGSULayersSvFullQ610(
      GetBandSpec(0), weights_q610, RealtimeBandWeightOffset(0), frames, noisy_chunk, fb_chunk, sv_weight_ih_tiles,
      sv_weight_hh_tiles, sv_bias_ih_tiles, sv_bn_mul_tiles, sv_bn_add_tiles, sv_layer0_hx_state_tiles,
      sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles, sv_layer1_cx_state_tiles, sv_layer0_input_tiles,
      sv_layer0_output_tiles, sv_layer1_output_tiles);
  #ifdef USE_SV_GSU_FULL_HLS_PROJECTION
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      0, kBand0NumSubbands, kBand0CtrFreq, kBand0DfOrder, kBand0ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band0_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #else
  RunRealtimeProjectionBandRowCachedPackedSvQ610<
      0, kBand0NumSubbands, kBand0CtrFreq, kBand0DfOrder, kBand0ProjSize>(
      weights_q610, band0_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #endif

  int band1_weight_offset = RunRealtimeGSULayersSvFullQ610(
      GetBandSpec(1), weights_q610, RealtimeBandWeightOffset(1), frames, noisy_chunk, fb_chunk, sv_weight_ih_tiles,
      sv_weight_hh_tiles, sv_bias_ih_tiles, sv_bn_mul_tiles, sv_bn_add_tiles, sv_layer0_hx_state_tiles,
      sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles, sv_layer1_cx_state_tiles, sv_layer0_input_tiles,
      sv_layer0_output_tiles, sv_layer1_output_tiles);
  #ifdef USE_SV_GSU_FULL_HLS_PROJECTION
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      1, kBand1NumSubbands, kBand1CtrFreq, kBand1DfOrder, kBand1ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band1_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #else
  RunRealtimeProjectionBandRowCachedPackedSvQ610<
      1, kBand1NumSubbands, kBand1CtrFreq, kBand1DfOrder, kBand1ProjSize>(
      weights_q610, band1_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #endif

  int band2_weight_offset = RunRealtimeGSULayersSvFullQ610(
      GetBandSpec(2), weights_q610, RealtimeBandWeightOffset(2), frames, noisy_chunk, fb_chunk, sv_weight_ih_tiles,
      sv_weight_hh_tiles, sv_bias_ih_tiles, sv_bn_mul_tiles, sv_bn_add_tiles, sv_layer0_hx_state_tiles,
      sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles, sv_layer1_cx_state_tiles, sv_layer0_input_tiles,
      sv_layer0_output_tiles, sv_layer1_output_tiles);
  #ifdef USE_SV_GSU_FULL_HLS_PROJECTION
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      2, kBand2NumSubbands, kBand2CtrFreq, kBand2DfOrder, kBand2ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band2_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #else
  RunRealtimeProjectionBandRowCachedPackedSvQ610<
      2, kBand2NumSubbands, kBand2CtrFreq, kBand2DfOrder, kBand2ProjSize>(
      weights_q610, band2_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
  #endif
#elif defined(USE_SV_GSU_LAYER)
  int band0_weight_offset = RealtimeBandWeightOffset(0);
  RunRealtimeGSULayersSvPackedQ610(
      GetBandSpec(0), weights_q610, band0_weight_offset, frames, noisy_chunk, fb_chunk, sv_weight_ih_pingpong,
      sv_weight_hh_pingpong, sv_forget_bias_pingpong, sv_cell_bias_pingpong, sv_bn_mul_pingpong,
      sv_bn_add_pingpong, sv_layer0_hx_state_tiles, sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles,
      sv_layer1_cx_state_tiles, sv_layer0_input_tiles, sv_layer0_output_tiles, sv_layer1_output_tiles,
      sv_prev_hx_tiles, sv_hidden_input_tiles, sv_hidden_prev_hx_tiles);
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      0, kBand0NumSubbands, kBand0CtrFreq, kBand0DfOrder, kBand0ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band0_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );

  int band1_weight_offset = RealtimeBandWeightOffset(1);
  RunRealtimeGSULayersSvPackedQ610(
      GetBandSpec(1), weights_q610, band1_weight_offset, frames, noisy_chunk, fb_chunk, sv_weight_ih_pingpong,
      sv_weight_hh_pingpong, sv_forget_bias_pingpong, sv_cell_bias_pingpong, sv_bn_mul_pingpong,
      sv_bn_add_pingpong, sv_layer0_hx_state_tiles, sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles,
      sv_layer1_cx_state_tiles, sv_layer0_input_tiles, sv_layer0_output_tiles, sv_layer1_output_tiles,
      sv_prev_hx_tiles, sv_hidden_input_tiles, sv_hidden_prev_hx_tiles);
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      1, kBand1NumSubbands, kBand1CtrFreq, kBand1DfOrder, kBand1ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band1_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );

  int band2_weight_offset = RealtimeBandWeightOffset(2);
  RunRealtimeGSULayersSvPackedQ610(
      GetBandSpec(2), weights_q610, band2_weight_offset, frames, noisy_chunk, fb_chunk, sv_weight_ih_pingpong,
      sv_weight_hh_pingpong, sv_forget_bias_pingpong, sv_cell_bias_pingpong, sv_bn_mul_pingpong,
      sv_bn_add_pingpong, sv_layer0_hx_state_tiles, sv_layer0_cx_state_tiles, sv_layer1_hx_state_tiles,
      sv_layer1_cx_state_tiles, sv_layer0_input_tiles, sv_layer0_output_tiles, sv_layer1_output_tiles,
      sv_prev_hx_tiles, sv_hidden_input_tiles, sv_hidden_prev_hx_tiles);
  RunRealtimeProjectionBandRowCachedPackedFixedQ610<
      2, kBand2NumSubbands, kBand2CtrFreq, kBand2DfOrder, kBand2ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band2_weight_offset, frames, sv_layer1_output_tiles, output_chunk
#ifdef USE_PROJECTION_EXTERNAL
      , projection_request_stream, projection_response_stream
#endif
  );
#elif defined(USE_RTL_BAND_ENGINE)
  int band0_weight_offset = RealtimeBandWeightOffset(0);
  RunRealtimeGSULayersSharedBandCompactStateQ610(
      GetBandSpec(0), weights_q610, band0_weight_offset, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih,
      bn_mul, bn_add, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output);
  RunRealtimeProjectionBandRowCachedFixedQ610<
      0, kBand0NumSubbands, kBand0CtrFreq, kBand0DfOrder, kBand0ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band0_weight_offset, frames, layer1_output, output_chunk);

  int band1_weight_offset = RealtimeBandWeightOffset(1);
  RunRealtimeGSULayersSharedBandCompactStateQ610(
      GetBandSpec(1), weights_q610, band1_weight_offset, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih,
      bn_mul, bn_add, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output);
  RunRealtimeProjectionBandRowCachedFixedQ610<
      1, kBand1NumSubbands, kBand1CtrFreq, kBand1DfOrder, kBand1ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band1_weight_offset, frames, layer1_output, output_chunk);

  int band2_weight_offset = RealtimeBandWeightOffset(2);
  RunRealtimeGSULayersSharedBandCompactStateQ610(
      GetBandSpec(2), weights_q610, band2_weight_offset, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih,
      bn_mul, bn_add, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output);
  RunRealtimeProjectionBandRowCachedFixedQ610<
      2, kBand2NumSubbands, kBand2CtrFreq, kBand2DfOrder, kBand2ProjSize, kRtlReadyProjectionDotPar>(
      weights_q610, band2_weight_offset, frames, layer1_output, output_chunk);
#else
  RunRealtimeBandQ610(
      GetBandSpec(0), weights_q610, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
      proj_weight, proj_bias, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output, output_chunk);
  RunRealtimeBandQ610(
      GetBandSpec(1), weights_q610, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
      proj_weight, proj_bias, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output, output_chunk);
  RunRealtimeBandQ610(
      GetBandSpec(2), weights_q610, frames, noisy_chunk, fb_chunk, weight_ih, weight_hh, bias_ih, bn_mul, bn_add,
      proj_weight, proj_bias, layer0_hx_state, layer0_cx_state, layer1_hx_state, layer1_cx_state, layer0_output,
      layer1_output, output_chunk);
#endif

  EmitRealtimeOutputChunkQ610(output_chunk, frames, df_coef_stream);
}

void SubbandRealtimeTopQ610(
    hls::stream<axis_q610_t>& noisy_fft_stream,
    hls::stream<axis_q610_t>& fb_fft_stream,
    const packed_weight_word_t weights_q610[kRealtimeWeightsWordCount],
    int num_frames,
    bool reset_state,
#ifdef USE_PROJECTION_EXTERNAL
    hls::stream<axis_q610_t>& projection_request_stream,
    hls::stream<axis_q610_t>& projection_response_stream,
#endif
    hls::stream<axis_q610_t>& df_coef_stream) {
  #pragma HLS INTERFACE axis port=noisy_fft_stream
  #pragma HLS INTERFACE axis port=fb_fft_stream
#ifdef USE_PROJECTION_EXTERNAL
  #pragma HLS INTERFACE axis port=projection_request_stream
  #pragma HLS INTERFACE axis port=projection_response_stream
#endif
  #pragma HLS INTERFACE axis port=df_coef_stream
  #pragma HLS INTERFACE m_axi port=weights_q610 offset=slave bundle=weights depth=kRealtimeWeightsWordCount
  #pragma HLS INTERFACE s_axilite port=weights_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=num_frames bundle=control
  #pragma HLS INTERFACE s_axilite port=reset_state bundle=control
  #pragma HLS INTERFACE s_axilite port=return bundle=control

  RunSubbandRealtimeTopCoreQ610(
      noisy_fft_stream, fb_fft_stream, weights_q610, num_frames, reset_state,
#ifdef USE_PROJECTION_EXTERNAL
      projection_request_stream, projection_response_stream,
#endif
      df_coef_stream);
}

#ifndef __SYNTHESIS__
void RunBand0OptimizedSmokeQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int num_frames,
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
    q_data_t* df_coef_q610) {
  static q_data_t layer0_weight_ih_local[kSbHiddenSize][kBand0PackedInputSize];
  static q_data_t layer0_weight_hh_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer0_bias_ih_local[2][kSbHiddenSize];
  static q_data_t layer0_bn_mul_local[kSbHiddenSize];
  static q_data_t layer0_bn_add_local[kSbHiddenSize];
  static q_data_t layer1_weight_ih_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer1_weight_hh_local[kSbHiddenSize][kSbHiddenSize];
  static q_data_t layer1_bias_ih_local[2][kSbHiddenSize];
  static q_data_t layer1_bn_mul_local[kSbHiddenSize];
  static q_data_t layer1_bn_add_local[kSbHiddenSize];
  static q_data_t proj_weight_local[kBand0ProjSize][kSbHiddenSize];
  static q_data_t proj_bias_local[kBand0ProjSize];
  static q_data_t layer0_hx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer0_cx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer1_hx_state_q610[kBand0NumSubbands][kSbHiddenSize];
  static q_data_t layer1_cx_state_q610[kBand0NumSubbands][kSbHiddenSize];

  LoadBand0Weights2DQ610(
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

  ClearStateVectorQ610(layer0_hx_state_q610);
  ClearStateVectorQ610(layer0_cx_state_q610);
  ClearStateVectorQ610(layer1_hx_state_q610);
  ClearStateVectorQ610(layer1_cx_state_q610);

  q_data_t input_buffer[kBand0PackedInputSize];
  q_data_t layer0_buffer[kSbHiddenSize];
  q_data_t layer1_buffer[kSbHiddenSize];
  constexpr int kBand0NbrFreq = (kBand0NoisyFreqSize - kBand0CtrFreq) / 2;

  for (int frame_index = 0; frame_index < num_frames; ++frame_index) {
    for (int subband_index = 0; subband_index < kBand0NumSubbands; ++subband_index) {
      for (int noisy_freq_index = 0; noisy_freq_index < kBand0NoisyFreqSize; ++noisy_freq_index) {
        int source_freq = subband_index * kBand0CtrFreq + noisy_freq_index - kBand0NbrFreq;
        if (source_freq < 0) {
          source_freq = -source_freq;
        }
        input_buffer[noisy_freq_index] = noisy_input_q610[InputIndex(0, source_freq, frame_index, num_frames)];
      }

      for (int fb_freq_index = 0; fb_freq_index < kBand0FbFreqSize; ++fb_freq_index) {
        const int source_freq = subband_index * kBand0CtrFreq + fb_freq_index;
        input_buffer[kBand0NoisyFreqSize + fb_freq_index] =
            fb_output_q610[InputIndex(0, source_freq, frame_index, num_frames)];
      }

      RunGSUCellBand0ParallelQ610<kBand0PackedInputSize, kLayer0HiddenPar, kLayer0InputPar, kLayer0RecurrentPar, true>(
          input_buffer,
          layer0_weight_ih_local,
          layer0_weight_hh_local,
          layer0_bias_ih_local,
          layer0_bn_mul_local,
          layer0_bn_add_local,
          layer0_hx_state_q610[subband_index],
          layer0_cx_state_q610[subband_index],
          layer0_buffer);

      RunGSUCellBand0ParallelQ610<kSbHiddenSize, kLayer1HiddenPar, kLayer1InputPar, kLayer1RecurrentPar, true>(
          layer0_buffer,
          layer1_weight_ih_local,
          layer1_weight_hh_local,
          layer1_bias_ih_local,
          layer1_bn_mul_local,
          layer1_bn_add_local,
          layer1_hx_state_q610[subband_index],
          layer1_cx_state_q610[subband_index],
          layer1_buffer);

      for (int proj_index = 0; proj_index < kBand0ProjSize; ++proj_index) {
        const accum_q_t q_scale_q20 = static_cast<accum_q_t>(1) << kQFrac;
        const accum_q_t sum_q20 = (static_cast<accum_q_t>(proj_bias_local[proj_index]) * q_scale_q20) +
                                  ProjectionDotProductDspQ610(layer1_buffer, proj_weight_local, proj_index);
        const q_data_t value_q610 = SaturateInt16(RoundShiftRight(sum_q20, kQFrac));
        const int complex_index = proj_index / (kBand0CtrFreq * kBand0DfOrder);
        const int feature_remainder = proj_index % (kBand0CtrFreq * kBand0DfOrder);
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
            num_frames)] = value_q610;
      }
    }
  }
}
#endif

}  // namespace subband_q610

void SubbandRealtimeTopQ610Ip(
    hls::stream<subband_q610::axis_q610_t>& noisy_fft_stream,
    hls::stream<subband_q610::axis_q610_t>& fb_fft_stream,
    const subband_q610::packed_weight_word_t weights_q610[subband_q610::kRealtimeWeightsWordCount],
    int num_frames,
    bool reset_state,
#ifdef USE_PROJECTION_EXTERNAL
    hls::stream<subband_q610::axis_q610_t>& projection_request_stream,
    hls::stream<subband_q610::axis_q610_t>& projection_response_stream,
#endif
    hls::stream<subband_q610::axis_q610_t>& df_coef_stream) {
  #pragma HLS INTERFACE axis port=noisy_fft_stream
  #pragma HLS INTERFACE axis port=fb_fft_stream
#ifdef USE_PROJECTION_EXTERNAL
  #pragma HLS INTERFACE axis port=projection_request_stream
  #pragma HLS INTERFACE axis port=projection_response_stream
#endif
  #pragma HLS INTERFACE axis port=df_coef_stream
  #pragma HLS INTERFACE m_axi port=weights_q610 offset=slave bundle=weights depth=subband_q610::kRealtimeWeightsWordCount
  #pragma HLS INTERFACE s_axilite port=weights_q610 bundle=control
  #pragma HLS INTERFACE s_axilite port=num_frames bundle=control
  #pragma HLS INTERFACE s_axilite port=reset_state bundle=control
  #pragma HLS INTERFACE s_axilite port=return bundle=control

  subband_q610::RunSubbandRealtimeTopCoreQ610(
      noisy_fft_stream, fb_fft_stream, weights_q610, num_frames, reset_state,
#ifdef USE_PROJECTION_EXTERNAL
      projection_request_stream, projection_response_stream,
#endif
      df_coef_stream);
}
