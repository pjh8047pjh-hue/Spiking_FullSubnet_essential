`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module ProjectionDotProductPackedTilesSvQ610 (
    input  wire         ap_clk,
    input  wire         ap_rst,
    input  wire         ap_ce,
    input  wire         ap_start,
    input  wire         ap_continue,
    output reg          ap_done,
    output reg          ap_idle,
    output reg          ap_ready,

    output reg  [2:0]   input_tiles_address0,
    output reg          input_tiles_ce0,
    input  wire [511:0] input_tiles_q0,
    output reg  [2:0]   input_tiles_address1,
    output reg          input_tiles_ce1,
    input  wire [511:0] input_tiles_q1,

    output reg  [2:0]   proj_row_tiles_address0,
    output reg          proj_row_tiles_ce0,
    input  wire [511:0] proj_row_tiles_q0,
    output reg  [2:0]   proj_row_tiles_address1,
    output reg          proj_row_tiles_ce1,
    input  wire [511:0] proj_row_tiles_q1,

    output reg  [47:0] sum_q20,
    output reg         sum_q20_ap_vld
);
  localparam int HIDDEN_TILES = 7;
  localparam int TILE_LANES = 32;

  typedef enum logic [1:0] {
    ST_IDLE,
    ST_ADDR,
    ST_DATA,
    ST_DONE
  } state_t;

  state_t state;
  int tile_index;
  acc_t acc_next;

  function automatic q_t lane_q(input logic [511:0] word, input int lane);
    return q_t'(word[(lane * 16) +: 16]);
  endfunction

  always_comb begin
    int lane;
    acc_next = acc_t'(sum_q20);
    for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
      acc_next = acc_next + mul_for_mac_q610(lane_q(input_tiles_q0, lane), lane_q(proj_row_tiles_q0, lane));
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
      input_tiles_address0 <= 3'd0;
      input_tiles_address1 <= 3'd0;
      input_tiles_ce0 <= 1'b0;
      input_tiles_ce1 <= 1'b0;
      proj_row_tiles_address0 <= 3'd0;
      proj_row_tiles_address1 <= 3'd0;
      proj_row_tiles_ce0 <= 1'b0;
      proj_row_tiles_ce1 <= 1'b0;
    end else if (ap_ce) begin
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      sum_q20_ap_vld <= 1'b0;
      input_tiles_ce0 <= 1'b0;
      input_tiles_ce1 <= 1'b0;
      proj_row_tiles_ce0 <= 1'b0;
      proj_row_tiles_ce1 <= 1'b0;
      ap_idle <= (state == ST_IDLE);

      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            tile_index <= 0;
            sum_q20 <= 48'sd0;
            ap_idle <= 1'b0;
            state <= ST_ADDR;
          end
        end

        ST_ADDR: begin
          input_tiles_address0 <= tile_index[2:0];
          input_tiles_ce0 <= 1'b1;
          proj_row_tiles_address0 <= tile_index[2:0];
          proj_row_tiles_ce0 <= 1'b1;
          state <= ST_DATA;
        end

        ST_DATA: begin
          sum_q20 <= acc_next;
          if (tile_index == (HIDDEN_TILES - 1)) begin
            state <= ST_DONE;
          end else begin
            tile_index <= tile_index + 1;
            state <= ST_ADDR;
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
