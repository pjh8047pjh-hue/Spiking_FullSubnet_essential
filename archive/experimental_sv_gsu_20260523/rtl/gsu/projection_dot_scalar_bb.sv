`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module ProjectionDotProductPackedScalarSvQ610 (
    input  wire         ap_clk,
    input  wire         ap_rst,
    input  wire         ap_ce,
    input  wire         ap_start,
    input  wire         ap_continue,
    output reg          ap_done,
    output reg          ap_idle,
    output reg          ap_ready,

    input  wire [511:0] input_tile_0,
    input  wire [511:0] input_tile_1,
    input  wire [511:0] input_tile_2,
    input  wire [511:0] input_tile_3,
    input  wire [511:0] input_tile_4,
    input  wire [511:0] input_tile_5,
    input  wire [511:0] input_tile_6,
    input  wire [511:0] proj_tile_0,
    input  wire [511:0] proj_tile_1,
    input  wire [511:0] proj_tile_2,
    input  wire [511:0] proj_tile_3,
    input  wire [511:0] proj_tile_4,
    input  wire [511:0] proj_tile_5,
    input  wire [511:0] proj_tile_6,
    output reg  [47:0]  sum_q20,
    output reg          sum_q20_ap_vld
);
  localparam int HIDDEN_TILES = 7;
  localparam int TILE_LANES = 32;

  typedef enum logic [1:0] {
    ST_IDLE,
    ST_ACCUM,
    ST_DONE
  } state_t;

  state_t state;
  int tile_index;
  acc_t acc_next;

  function automatic q_t lane_read(input logic [511:0] word, input int lane);
    return q_t'(word[(lane * 16) +: 16]);
  endfunction

  function automatic logic [511:0] select_input_tile(input int index);
    case (index)
      0: return input_tile_0;
      1: return input_tile_1;
      2: return input_tile_2;
      3: return input_tile_3;
      4: return input_tile_4;
      5: return input_tile_5;
      default: return input_tile_6;
    endcase
  endfunction

  function automatic logic [511:0] select_proj_tile(input int index);
    case (index)
      0: return proj_tile_0;
      1: return proj_tile_1;
      2: return proj_tile_2;
      3: return proj_tile_3;
      4: return proj_tile_4;
      5: return proj_tile_5;
      default: return proj_tile_6;
    endcase
  endfunction

  always_comb begin
    logic [511:0] input_word;
    logic [511:0] proj_word;
    int lane;
    input_word = select_input_tile(tile_index);
    proj_word = select_proj_tile(tile_index);
    acc_next = acc_t'(sum_q20);
    for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
      acc_next = acc_next + mul_for_mac_q610(lane_read(input_word, lane), lane_read(proj_word, lane));
    end
  end

  always_ff @(posedge ap_clk) begin
    if (ap_rst) begin
      state <= ST_IDLE;
      tile_index <= 0;
      sum_q20 <= 48'sd0;
      sum_q20_ap_vld <= 1'b0;
      ap_done <= 1'b0;
      ap_idle <= 1'b1;
      ap_ready <= 1'b0;
    end else if (ap_ce) begin
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      sum_q20_ap_vld <= 1'b0;
      ap_idle <= (state == ST_IDLE);

      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            tile_index <= 0;
            sum_q20 <= 48'sd0;
            ap_idle <= 1'b0;
            state <= ST_ACCUM;
          end
        end

        ST_ACCUM: begin
          sum_q20 <= acc_next;
          if (tile_index == (HIDDEN_TILES - 1)) begin
            state <= ST_DONE;
          end else begin
            tile_index <= tile_index + 1;
          end
        end

        ST_DONE: begin
          ap_done <= 1'b1;
          ap_ready <= 1'b1;
          sum_q20_ap_vld <= 1'b1;
          if (ap_continue) begin
            state <= ST_IDLE;
          end
        end

        default: state <= ST_IDLE;
      endcase
    end
  end
endmodule
