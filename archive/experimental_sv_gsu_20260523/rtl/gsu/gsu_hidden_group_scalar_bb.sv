`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module RunSvGsuHiddenGroupScalarQ610 (
    input  wire          ap_clk,
    input  wire          ap_rst,
    input  wire          ap_ce,
    input  wire          ap_start,
    input  wire          ap_continue,
    output wire          ap_done,
    output wire          ap_idle,
    output wire          ap_ready,

    input  wire [31:0]   input_size,
    input  wire [31:0]   hidden_lane_base,
    input  wire [511:0]  input_tile_0,
    input  wire [511:0]  input_tile_1,
    input  wire [511:0]  input_tile_2,
    input  wire [511:0]  input_tile_3,
    input  wire [511:0]  input_tile_4,
    input  wire [511:0]  input_tile_5,
    input  wire [511:0]  input_tile_6,
    input  wire [511:0]  prev_hx_tile_0,
    input  wire [511:0]  prev_hx_tile_1,
    input  wire [511:0]  prev_hx_tile_2,
    input  wire [511:0]  prev_hx_tile_3,
    input  wire [511:0]  prev_hx_tile_4,
    input  wire [511:0]  prev_hx_tile_5,
    input  wire [511:0]  prev_hx_tile_6,
    input  wire [511:0]  hx_tile_in,
    input  wire [511:0]  cx_tile_in,
    input  wire [511:0]  output_tile_in,
    input  wire [511:0]  weight_ih_row0_tile_0,
    input  wire [511:0]  weight_ih_row0_tile_1,
    input  wire [511:0]  weight_ih_row0_tile_2,
    input  wire [511:0]  weight_ih_row0_tile_3,
    input  wire [511:0]  weight_ih_row0_tile_4,
    input  wire [511:0]  weight_ih_row0_tile_5,
    input  wire [511:0]  weight_ih_row0_tile_6,
    input  wire [511:0]  weight_ih_row1_tile_0,
    input  wire [511:0]  weight_ih_row1_tile_1,
    input  wire [511:0]  weight_ih_row1_tile_2,
    input  wire [511:0]  weight_ih_row1_tile_3,
    input  wire [511:0]  weight_ih_row1_tile_4,
    input  wire [511:0]  weight_ih_row1_tile_5,
    input  wire [511:0]  weight_ih_row1_tile_6,
    input  wire [511:0]  weight_hh_row0_tile_0,
    input  wire [511:0]  weight_hh_row0_tile_1,
    input  wire [511:0]  weight_hh_row0_tile_2,
    input  wire [511:0]  weight_hh_row0_tile_3,
    input  wire [511:0]  weight_hh_row0_tile_4,
    input  wire [511:0]  weight_hh_row0_tile_5,
    input  wire [511:0]  weight_hh_row0_tile_6,
    input  wire [511:0]  weight_hh_row1_tile_0,
    input  wire [511:0]  weight_hh_row1_tile_1,
    input  wire [511:0]  weight_hh_row1_tile_2,
    input  wire [511:0]  weight_hh_row1_tile_3,
    input  wire [511:0]  weight_hh_row1_tile_4,
    input  wire [511:0]  weight_hh_row1_tile_5,
    input  wire [511:0]  weight_hh_row1_tile_6,
    input  wire [15:0]   forget_bias_0,
    input  wire [15:0]   forget_bias_1,
    input  wire [15:0]   cell_bias_0,
    input  wire [15:0]   cell_bias_1,
    input  wire [15:0]   bn_mul_0,
    input  wire [15:0]   bn_mul_1,
    input  wire [15:0]   bn_add_0,
    input  wire [15:0]   bn_add_1,
    output wire [511:0]  hx_tile_out,
    output wire          hx_tile_out_ap_vld,
    output wire [511:0]  cx_tile_out,
    output wire          cx_tile_out_ap_vld,
    output wire [511:0]  output_tile_out,
    output wire          output_tile_out_ap_vld
);
  localparam int TILE_LANES = 32;
  localparam int TILE_COUNT = 7;

  typedef enum logic [2:0] {
    ST_IDLE,
    ST_ROW0,
    ST_ROW1,
    ST_UPDATE,
    ST_DONE
  } state_t;

  state_t state;
  logic [2:0] tile_index;
  acc_t input_sum0_q20;
  acc_t recurrent_sum0_q20;
  acc_t input_sum1_q20;
  acc_t recurrent_sum1_q20;
  logic [511:0] hx_result;
  logic [511:0] cx_result;
  logic [511:0] output_result;

  assign ap_idle = (state == ST_IDLE);
  assign ap_done = (state == ST_DONE);
  assign ap_ready = (state == ST_DONE);
  assign hx_tile_out = hx_result;
  assign cx_tile_out = cx_result;
  assign output_tile_out = output_result;
  assign hx_tile_out_ap_vld = (state == ST_DONE);
  assign cx_tile_out_ap_vld = (state == ST_DONE);
  assign output_tile_out_ap_vld = (state == ST_DONE);

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

  function automatic logic [511:0] select_input_tile(input logic [2:0] index);
    case (index)
      3'd0: return input_tile_0;
      3'd1: return input_tile_1;
      3'd2: return input_tile_2;
      3'd3: return input_tile_3;
      3'd4: return input_tile_4;
      3'd5: return input_tile_5;
      default: return input_tile_6;
    endcase
  endfunction

  function automatic logic [511:0] select_prev_hx_tile(input logic [2:0] index);
    case (index)
      3'd0: return prev_hx_tile_0;
      3'd1: return prev_hx_tile_1;
      3'd2: return prev_hx_tile_2;
      3'd3: return prev_hx_tile_3;
      3'd4: return prev_hx_tile_4;
      3'd5: return prev_hx_tile_5;
      default: return prev_hx_tile_6;
    endcase
  endfunction

  function automatic logic [511:0] select_ih_tile(input bit row, input logic [2:0] index);
    case ({row, index})
      4'd0: return weight_ih_row0_tile_0;
      4'd1: return weight_ih_row0_tile_1;
      4'd2: return weight_ih_row0_tile_2;
      4'd3: return weight_ih_row0_tile_3;
      4'd4: return weight_ih_row0_tile_4;
      4'd5: return weight_ih_row0_tile_5;
      4'd6: return weight_ih_row0_tile_6;
      4'd8: return weight_ih_row1_tile_0;
      4'd9: return weight_ih_row1_tile_1;
      4'd10: return weight_ih_row1_tile_2;
      4'd11: return weight_ih_row1_tile_3;
      4'd12: return weight_ih_row1_tile_4;
      4'd13: return weight_ih_row1_tile_5;
      default: return weight_ih_row1_tile_6;
    endcase
  endfunction

  function automatic logic [511:0] select_hh_tile(input bit row, input logic [2:0] index);
    case ({row, index})
      4'd0: return weight_hh_row0_tile_0;
      4'd1: return weight_hh_row0_tile_1;
      4'd2: return weight_hh_row0_tile_2;
      4'd3: return weight_hh_row0_tile_3;
      4'd4: return weight_hh_row0_tile_4;
      4'd5: return weight_hh_row0_tile_5;
      4'd6: return weight_hh_row0_tile_6;
      4'd8: return weight_hh_row1_tile_0;
      4'd9: return weight_hh_row1_tile_1;
      4'd10: return weight_hh_row1_tile_2;
      4'd11: return weight_hh_row1_tile_3;
      4'd12: return weight_hh_row1_tile_4;
      4'd13: return weight_hh_row1_tile_5;
      default: return weight_hh_row1_tile_6;
    endcase
  endfunction

  function automatic acc_t mac_input_tile_sum(input bit row, input logic [2:0] index, input logic [31:0] size);
    logic [511:0] x_word;
    logic [511:0] w_word;
    acc_t sum;
    int lane;
    int feature_index;
    begin
      x_word = select_input_tile(index);
      w_word = select_ih_tile(row, index);
      sum = '0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        feature_index = (int'(index) * TILE_LANES) + lane;
        if (feature_index < int'(size)) begin
          sum = sum + mul_for_mac_q610(lane_read(x_word, lane), lane_read(w_word, lane));
        end
      end
      return sum;
    end
  endfunction

  function automatic acc_t mac_recurrent_tile_sum(input bit row, input logic [2:0] index);
    logic [511:0] x_word;
    logic [511:0] w_word;
    acc_t sum;
    int lane;
    begin
      x_word = select_prev_hx_tile(index);
      w_word = select_hh_tile(row, index);
      sum = '0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        sum = sum + mul_for_mac_q610(lane_read(x_word, lane), lane_read(w_word, lane));
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

  always_ff @(posedge ap_clk) begin
    logic [511:0] hx_work;
    logic [511:0] cx_work;
    logic [511:0] output_work;
    int lane0;
    int lane1;

    if (ap_rst) begin
      state <= ST_IDLE;
      tile_index <= '0;
      input_sum0_q20 <= '0;
      recurrent_sum0_q20 <= '0;
      input_sum1_q20 <= '0;
      recurrent_sum1_q20 <= '0;
      hx_result <= '0;
      cx_result <= '0;
      output_result <= '0;
    end else if (ap_ce) begin
      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            tile_index <= '0;
            input_sum0_q20 <= '0;
            recurrent_sum0_q20 <= '0;
            input_sum1_q20 <= '0;
            recurrent_sum1_q20 <= '0;
            hx_result <= hx_tile_in;
            cx_result <= cx_tile_in;
            output_result <= output_tile_in;
            state <= ST_ROW0;
          end
        end
        ST_ROW0: begin
          input_sum0_q20 <= input_sum0_q20 + mac_input_tile_sum(1'b0, tile_index, input_size);
          recurrent_sum0_q20 <= recurrent_sum0_q20 + mac_recurrent_tile_sum(1'b0, tile_index);
          if (tile_index == 3'd6) begin
            tile_index <= '0;
            state <= ST_ROW1;
          end else begin
            tile_index <= tile_index + 3'd1;
          end
        end
        ST_ROW1: begin
          input_sum1_q20 <= input_sum1_q20 + mac_input_tile_sum(1'b1, tile_index, input_size);
          recurrent_sum1_q20 <= recurrent_sum1_q20 + mac_recurrent_tile_sum(1'b1, tile_index);
          if (tile_index == 3'd6) begin
            state <= ST_UPDATE;
          end else begin
            tile_index <= tile_index + 3'd1;
          end
        end
        ST_UPDATE: begin
          hx_work = hx_result;
          cx_work = cx_result;
          output_work = output_result;
          lane0 = int'(hidden_lane_base[4:0]);
          lane1 = int'(hidden_lane_base[4:0]) + 1;
          update_hidden_lane(
              lane0, input_sum0_q20 + recurrent_sum0_q20, q_t'(forget_bias_0), q_t'(cell_bias_0),
              q_t'(bn_mul_0), q_t'(bn_add_0), cx_result, hx_work, cx_work, output_work);
          update_hidden_lane(
              lane1, input_sum1_q20 + recurrent_sum1_q20, q_t'(forget_bias_1), q_t'(cell_bias_1),
              q_t'(bn_mul_1), q_t'(bn_add_1), cx_result, hx_work, cx_work, output_work);
          hx_result <= hx_work;
          cx_result <= cx_work;
          output_result <= output_work;
          state <= ST_DONE;
        end
        ST_DONE: begin
          if (ap_continue) begin
            state <= ST_IDLE;
          end
        end
        default: state <= ST_IDLE;
      endcase
    end
  end
endmodule
