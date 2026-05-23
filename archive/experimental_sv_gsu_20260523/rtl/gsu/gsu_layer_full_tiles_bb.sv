`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module RunSvGsuLayerFullTilesQ610 (
    input  wire         ap_clk,
    input  wire         ap_rst,
    input  wire         ap_ce,
    input  wire         ap_start,
    input  wire         ap_continue,
    output reg          ap_done,
    output reg          ap_idle,
    output reg          ap_ready,

    input  wire [31:0]  num_frames,
    input  wire [31:0]  num_subbands,
    input  wire [31:0]  input_size,
    input  wire [31:0]  state_subband_offset,

    output reg  [7:0]   sequence_input_tiles_address0,
    output reg          sequence_input_tiles_ce0,
    input  wire [511:0] sequence_input_tiles_q0,
    output reg  [7:0]   sequence_input_tiles_address1,
    output reg          sequence_input_tiles_ce1,
    input  wire [511:0] sequence_input_tiles_q1,

    output reg  [10:0]  weight_ih_tiles_address0,
    output reg          weight_ih_tiles_ce0,
    input  wire [511:0] weight_ih_tiles_q0,
    output reg  [10:0]  weight_ih_tiles_address1,
    output reg          weight_ih_tiles_ce1,
    input  wire [511:0] weight_ih_tiles_q1,

    output reg  [10:0]  weight_hh_tiles_address0,
    output reg          weight_hh_tiles_ce0,
    input  wire [511:0] weight_hh_tiles_q0,
    output reg  [10:0]  weight_hh_tiles_address1,
    output reg          weight_hh_tiles_ce1,
    input  wire [511:0] weight_hh_tiles_q1,

    output reg  [3:0]   bias_ih_tiles_address0,
    output reg          bias_ih_tiles_ce0,
    input  wire [511:0] bias_ih_tiles_q0,
    output reg  [3:0]   bias_ih_tiles_address1,
    output reg          bias_ih_tiles_ce1,
    input  wire [511:0] bias_ih_tiles_q1,

    output reg  [2:0]   bn_mul_tiles_address0,
    output reg          bn_mul_tiles_ce0,
    input  wire [511:0] bn_mul_tiles_q0,
    output reg  [2:0]   bn_mul_tiles_address1,
    output reg          bn_mul_tiles_ce1,
    input  wire [511:0] bn_mul_tiles_q1,

    output reg  [2:0]   bn_add_tiles_address0,
    output reg          bn_add_tiles_ce0,
    input  wire [511:0] bn_add_tiles_q0,
    output reg  [2:0]   bn_add_tiles_address1,
    output reg          bn_add_tiles_ce1,
    input  wire [511:0] bn_add_tiles_q1,

    output reg  [6:0]   hx_state_tiles_address0,
    output reg          hx_state_tiles_ce0,
    output reg          hx_state_tiles_we0,
    output reg  [511:0] hx_state_tiles_d0,
    input  wire [511:0] hx_state_tiles_q0,
    output reg  [6:0]   hx_state_tiles_address1,
    output reg          hx_state_tiles_ce1,
    output reg          hx_state_tiles_we1,
    output reg  [511:0] hx_state_tiles_d1,
    input  wire [511:0] hx_state_tiles_q1,

    output reg  [6:0]   cx_state_tiles_address0,
    output reg          cx_state_tiles_ce0,
    output reg          cx_state_tiles_we0,
    output reg  [511:0] cx_state_tiles_d0,
    input  wire [511:0] cx_state_tiles_q0,
    output reg  [6:0]   cx_state_tiles_address1,
    output reg          cx_state_tiles_ce1,
    output reg          cx_state_tiles_we1,
    output reg  [511:0] cx_state_tiles_d1,
    input  wire [511:0] cx_state_tiles_q1,

    output reg  [7:0]   sequence_output_tiles_address0,
    output reg          sequence_output_tiles_ce0,
    output reg          sequence_output_tiles_we0,
    output reg  [511:0] sequence_output_tiles_d0,
    output reg  [7:0]   sequence_output_tiles_address1,
    output reg          sequence_output_tiles_ce1,
    output reg          sequence_output_tiles_we1,
    output reg  [511:0] sequence_output_tiles_d1
);
  localparam int REALTIME_CHUNK_FRAMES = 4;
  localparam int MAX_SUBBANDS = 8;
  localparam int HIDDEN_SIZE = 224;
  localparam int HIDDEN_TILES = 7;
  localparam int TILE_LANES = 32;
  localparam int HIDDEN_PAR = 2;

  typedef enum logic [4:0] {
    ST_IDLE,
    ST_LOAD_STATE_ADDR,
    ST_LOAD_STATE_DATA,
    ST_HIDDEN_INIT,
    ST_MAC_ADDR,
    ST_MAC_DATA,
    ST_PARAM_ADDR,
    ST_PARAM_DATA,
    ST_NEXT_HIDDEN,
    ST_STORE_ADDR,
    ST_NEXT_SUBBAND,
    ST_DONE
  } state_t;

  state_t state;
  int frame_index;
  int subband_index;
  int tile_index;
  int hidden_base;
  int store_tile_index;
  acc_t input_sum0_q20;
  acc_t input_sum1_q20;
  acc_t recurrent_sum0_q20;
  acc_t recurrent_sum1_q20;

  logic [511:0] prev_hx_tiles [0:HIDDEN_TILES-1];
  logic [511:0] prev_cx_tiles [0:HIDDEN_TILES-1];
  logic [511:0] hx_work_tiles [0:HIDDEN_TILES-1];
  logic [511:0] cx_work_tiles [0:HIDDEN_TILES-1];
  logic [511:0] output_work_tiles [0:HIDDEN_TILES-1];

  function automatic int seq_tile_index(input int frame, input int subband, input int tile);
    return ((frame * MAX_SUBBANDS) + subband) * HIDDEN_TILES + tile;
  endfunction

  function automatic int state_tile_index(input int subband, input int tile);
    return ((int'(state_subband_offset) + subband) * HIDDEN_TILES) + tile;
  endfunction

  function automatic int weight_tile_index(input int hidden, input int tile);
    return (hidden * HIDDEN_TILES) + tile;
  endfunction

  function automatic q_t lane_read(input logic [511:0] word, input int lane);
    return q_t'(word[(lane * 16) +: 16]);
  endfunction

  function automatic logic [511:0] lane_write(input logic [511:0] word, input int lane, input q_t value);
    logic [511:0] next_word;
    begin
      next_word = word;
      next_word[(lane * 16) +: 16] = value;
      return next_word;
    end
  endfunction

  function automatic acc_t mac_input_tile_sum(
      input logic [511:0] input_word,
      input logic [511:0] weight_word,
      input int tile,
      input logic [31:0] size);
    acc_t sum;
    int lane;
    int feature_index;
    begin
      sum = '0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        feature_index = (tile * TILE_LANES) + lane;
        if (feature_index < int'(size)) begin
          sum = sum + mul_for_mac_q610(lane_read(input_word, lane), lane_read(weight_word, lane));
        end
      end
      return sum;
    end
  endfunction

  function automatic acc_t mac_recurrent_tile_sum(
      input logic [511:0] prev_hx_word,
      input logic [511:0] weight_word);
    acc_t sum;
    int lane;
    begin
      sum = '0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        sum = sum + mul_for_mac_q610(lane_read(prev_hx_word, lane), lane_read(weight_word, lane));
      end
      return sum;
    end
  endfunction

  task automatic update_hidden_lane(
      input int lane,
      input acc_t common_q20,
      input q_t forget_bias,
      input q_t cell_bias,
      input q_t bn_mul,
      input q_t bn_add,
      input logic [511:0] cx_before,
      inout logic [511:0] hx_word,
      inout logic [511:0] cx_word,
      inout logic [511:0] output_word);
    acc_t forget_q20;
    acc_t cell_q20;
    q_t forget_preact_q610;
    q_t cell_preact_q610;
    q_t forget_gate_q610;
    q_t one_minus_forget_q610;
    q_t prev_cx_q610;
    q_t retained_q610;
    q_t injected_q610;
    q_t cy_q610;
    q_t scaled_q610;
    q_t hy_q610;
    begin
      forget_q20 = common_q20 + (acc_t'(forget_bias) <<< Q_FRAC);
      cell_q20 = common_q20 + (acc_t'(cell_bias) <<< Q_FRAC);
      forget_preact_q610 = saturate_int16(round_shift_right(forget_q20, Q_FRAC));
      cell_preact_q610 = saturate_int16(round_shift_right(cell_q20, Q_FRAC));
      forget_gate_q610 = sigmoid_pwl_q610(forget_preact_q610);
      one_minus_forget_q610 = sub_q610(q_t'(Q_ONE), forget_gate_q610);
      prev_cx_q610 = lane_read(cx_before, lane);
      retained_q610 = mul_q610(forget_gate_q610, prev_cx_q610);
      injected_q610 = mul_q610(one_minus_forget_q610, cell_preact_q610);
      cy_q610 = add_q610(retained_q610, injected_q610);
      scaled_q610 = mul_q610(cy_q610, bn_mul);
      cy_q610 = add_q610(scaled_q610, bn_add);
      hy_q610 = step_activation_q610(cy_q610);
      hx_word = lane_write(hx_word, lane, hy_q610);
      cx_word = lane_write(cx_word, lane, cy_q610);
      output_word = lane_write(output_word, lane, hy_q610);
    end
  endtask

  task automatic clear_ports;
    begin
      sequence_input_tiles_ce0 = 1'b0;
      sequence_input_tiles_ce1 = 1'b0;
      weight_ih_tiles_ce0 = 1'b0;
      weight_ih_tiles_ce1 = 1'b0;
      weight_hh_tiles_ce0 = 1'b0;
      weight_hh_tiles_ce1 = 1'b0;
      bias_ih_tiles_ce0 = 1'b0;
      bias_ih_tiles_ce1 = 1'b0;
      bn_mul_tiles_ce0 = 1'b0;
      bn_mul_tiles_ce1 = 1'b0;
      bn_add_tiles_ce0 = 1'b0;
      bn_add_tiles_ce1 = 1'b0;
      hx_state_tiles_ce0 = 1'b0;
      hx_state_tiles_ce1 = 1'b0;
      hx_state_tiles_we0 = 1'b0;
      hx_state_tiles_we1 = 1'b0;
      cx_state_tiles_ce0 = 1'b0;
      cx_state_tiles_ce1 = 1'b0;
      cx_state_tiles_we0 = 1'b0;
      cx_state_tiles_we1 = 1'b0;
      sequence_output_tiles_ce0 = 1'b0;
      sequence_output_tiles_ce1 = 1'b0;
      sequence_output_tiles_we0 = 1'b0;
      sequence_output_tiles_we1 = 1'b0;
    end
  endtask

  always_ff @(posedge ap_clk) begin
    if (ap_rst) begin
      state <= ST_IDLE;
      frame_index <= 0;
      subband_index <= 0;
      tile_index <= 0;
      hidden_base <= 0;
      store_tile_index <= 0;
      input_sum0_q20 <= '0;
      input_sum1_q20 <= '0;
      recurrent_sum0_q20 <= '0;
      recurrent_sum1_q20 <= '0;
      ap_done <= 1'b0;
      ap_idle <= 1'b1;
      ap_ready <= 1'b0;
      sequence_input_tiles_address0 <= 8'd0;
      sequence_input_tiles_address1 <= 8'd0;
      weight_ih_tiles_address0 <= 11'd0;
      weight_ih_tiles_address1 <= 11'd0;
      weight_hh_tiles_address0 <= 11'd0;
      weight_hh_tiles_address1 <= 11'd0;
      bias_ih_tiles_address0 <= 4'd0;
      bias_ih_tiles_address1 <= 4'd0;
      bn_mul_tiles_address0 <= 3'd0;
      bn_mul_tiles_address1 <= 3'd0;
      bn_add_tiles_address0 <= 3'd0;
      bn_add_tiles_address1 <= 3'd0;
      hx_state_tiles_address0 <= 7'd0;
      hx_state_tiles_address1 <= 7'd0;
      hx_state_tiles_d0 <= 512'd0;
      hx_state_tiles_d1 <= 512'd0;
      cx_state_tiles_address0 <= 7'd0;
      cx_state_tiles_address1 <= 7'd0;
      cx_state_tiles_d0 <= 512'd0;
      cx_state_tiles_d1 <= 512'd0;
      sequence_output_tiles_address0 <= 8'd0;
      sequence_output_tiles_address1 <= 8'd0;
      sequence_output_tiles_d0 <= 512'd0;
      sequence_output_tiles_d1 <= 512'd0;
      clear_ports();
      for (int i = 0; i < HIDDEN_TILES; i = i + 1) begin
        prev_hx_tiles[i] <= 512'd0;
        prev_cx_tiles[i] <= 512'd0;
        hx_work_tiles[i] <= 512'd0;
        cx_work_tiles[i] <= 512'd0;
        output_work_tiles[i] <= 512'd0;
      end
    end else if (ap_ce) begin
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      ap_idle <= (state == ST_IDLE);
      clear_ports();

      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            frame_index <= 0;
            subband_index <= 0;
            tile_index <= 0;
            ap_idle <= 1'b0;
            if ((num_frames == 0) || (num_subbands == 0)) begin
              state <= ST_DONE;
            end else begin
              state <= ST_LOAD_STATE_ADDR;
            end
          end
        end

        ST_LOAD_STATE_ADDR: begin
          hx_state_tiles_address0 <= state_tile_index(subband_index, tile_index);
          hx_state_tiles_ce0 <= 1'b1;
          cx_state_tiles_address0 <= state_tile_index(subband_index, tile_index);
          cx_state_tiles_ce0 <= 1'b1;
          state <= ST_LOAD_STATE_DATA;
        end

        ST_LOAD_STATE_DATA: begin
          prev_hx_tiles[tile_index] <= hx_state_tiles_q0;
          prev_cx_tiles[tile_index] <= cx_state_tiles_q0;
          hx_work_tiles[tile_index] <= hx_state_tiles_q0;
          cx_work_tiles[tile_index] <= cx_state_tiles_q0;
          output_work_tiles[tile_index] <= 512'd0;
          if (tile_index == (HIDDEN_TILES - 1)) begin
            state <= ST_HIDDEN_INIT;
          end else begin
            tile_index <= tile_index + 1;
            state <= ST_LOAD_STATE_ADDR;
          end
        end

        ST_HIDDEN_INIT: begin
          hidden_base <= 0;
          tile_index <= 0;
          input_sum0_q20 <= '0;
          input_sum1_q20 <= '0;
          recurrent_sum0_q20 <= '0;
          recurrent_sum1_q20 <= '0;
          state <= ST_MAC_ADDR;
        end

        ST_MAC_ADDR: begin
          sequence_input_tiles_address0 <= seq_tile_index(frame_index, subband_index, tile_index);
          sequence_input_tiles_ce0 <= 1'b1;
          weight_ih_tiles_address0 <= weight_tile_index(hidden_base, tile_index);
          weight_ih_tiles_ce0 <= 1'b1;
          weight_ih_tiles_address1 <= weight_tile_index(hidden_base + 1, tile_index);
          weight_ih_tiles_ce1 <= 1'b1;
          weight_hh_tiles_address0 <= weight_tile_index(hidden_base, tile_index);
          weight_hh_tiles_ce0 <= 1'b1;
          weight_hh_tiles_address1 <= weight_tile_index(hidden_base + 1, tile_index);
          weight_hh_tiles_ce1 <= 1'b1;
          state <= ST_MAC_DATA;
        end

        ST_MAC_DATA: begin
          input_sum0_q20 <= input_sum0_q20 +
              mac_input_tile_sum(sequence_input_tiles_q0, weight_ih_tiles_q0, tile_index, input_size);
          input_sum1_q20 <= input_sum1_q20 +
              mac_input_tile_sum(sequence_input_tiles_q0, weight_ih_tiles_q1, tile_index, input_size);
          recurrent_sum0_q20 <= recurrent_sum0_q20 +
              mac_recurrent_tile_sum(prev_hx_tiles[tile_index], weight_hh_tiles_q0);
          recurrent_sum1_q20 <= recurrent_sum1_q20 +
              mac_recurrent_tile_sum(prev_hx_tiles[tile_index], weight_hh_tiles_q1);
          if (tile_index == (HIDDEN_TILES - 1)) begin
            state <= ST_PARAM_ADDR;
          end else begin
            tile_index <= tile_index + 1;
            state <= ST_MAC_ADDR;
          end
        end

        ST_PARAM_ADDR: begin
          bias_ih_tiles_address0 <= hidden_base / TILE_LANES;
          bias_ih_tiles_ce0 <= 1'b1;
          bias_ih_tiles_address1 <= HIDDEN_TILES + (hidden_base / TILE_LANES);
          bias_ih_tiles_ce1 <= 1'b1;
          bn_mul_tiles_address0 <= hidden_base / TILE_LANES;
          bn_mul_tiles_ce0 <= 1'b1;
          bn_add_tiles_address0 <= hidden_base / TILE_LANES;
          bn_add_tiles_ce0 <= 1'b1;
          state <= ST_PARAM_DATA;
        end

        ST_PARAM_DATA: begin
          logic [511:0] hx_next;
          logic [511:0] cx_next;
          logic [511:0] output_next;
          int hidden_tile;
          int lane0;
          int lane1;
          hidden_tile = hidden_base / TILE_LANES;
          lane0 = hidden_base % TILE_LANES;
          lane1 = lane0 + 1;
          hx_next = hx_work_tiles[hidden_tile];
          cx_next = cx_work_tiles[hidden_tile];
          output_next = output_work_tiles[hidden_tile];
          update_hidden_lane(
              lane0, input_sum0_q20 + recurrent_sum0_q20,
              lane_read(bias_ih_tiles_q0, lane0), lane_read(bias_ih_tiles_q1, lane0),
              lane_read(bn_mul_tiles_q0, lane0), lane_read(bn_add_tiles_q0, lane0),
              prev_cx_tiles[hidden_tile], hx_next, cx_next, output_next);
          update_hidden_lane(
              lane1, input_sum1_q20 + recurrent_sum1_q20,
              lane_read(bias_ih_tiles_q0, lane1), lane_read(bias_ih_tiles_q1, lane1),
              lane_read(bn_mul_tiles_q0, lane1), lane_read(bn_add_tiles_q0, lane1),
              prev_cx_tiles[hidden_tile], hx_next, cx_next, output_next);
          hx_work_tiles[hidden_tile] <= hx_next;
          cx_work_tiles[hidden_tile] <= cx_next;
          output_work_tiles[hidden_tile] <= output_next;
          state <= ST_NEXT_HIDDEN;
        end

        ST_NEXT_HIDDEN: begin
          if (hidden_base >= (HIDDEN_SIZE - HIDDEN_PAR)) begin
            store_tile_index <= 0;
            state <= ST_STORE_ADDR;
          end else begin
            hidden_base <= hidden_base + HIDDEN_PAR;
            tile_index <= 0;
            input_sum0_q20 <= '0;
            input_sum1_q20 <= '0;
            recurrent_sum0_q20 <= '0;
            recurrent_sum1_q20 <= '0;
            state <= ST_MAC_ADDR;
          end
        end

        ST_STORE_ADDR: begin
          hx_state_tiles_address0 <= state_tile_index(subband_index, store_tile_index);
          hx_state_tiles_ce0 <= 1'b1;
          hx_state_tiles_we0 <= 1'b1;
          hx_state_tiles_d0 <= hx_work_tiles[store_tile_index];
          cx_state_tiles_address0 <= state_tile_index(subband_index, store_tile_index);
          cx_state_tiles_ce0 <= 1'b1;
          cx_state_tiles_we0 <= 1'b1;
          cx_state_tiles_d0 <= cx_work_tiles[store_tile_index];
          sequence_output_tiles_address0 <= seq_tile_index(frame_index, subband_index, store_tile_index);
          sequence_output_tiles_ce0 <= 1'b1;
          sequence_output_tiles_we0 <= 1'b1;
          sequence_output_tiles_d0 <= output_work_tiles[store_tile_index];
          if (store_tile_index == (HIDDEN_TILES - 1)) begin
            state <= ST_NEXT_SUBBAND;
          end else begin
            store_tile_index <= store_tile_index + 1;
          end
        end

        ST_NEXT_SUBBAND: begin
          if ((subband_index + 1) < int'(num_subbands)) begin
            subband_index <= subband_index + 1;
            tile_index <= 0;
            state <= ST_LOAD_STATE_ADDR;
          end else if ((frame_index + 1) < int'(num_frames)) begin
            frame_index <= frame_index + 1;
            subband_index <= 0;
            tile_index <= 0;
            state <= ST_LOAD_STATE_ADDR;
          end else begin
            state <= ST_DONE;
          end
        end

        ST_DONE: begin
          ap_done <= 1'b1;
          ap_ready <= 1'b1;
          ap_idle <= 1'b0;
          if (ap_continue) begin
            state <= ST_IDLE;
          end
        end

        default: state <= ST_IDLE;
      endcase
    end
  end
endmodule
