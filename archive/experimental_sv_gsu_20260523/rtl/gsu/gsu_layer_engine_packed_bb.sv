`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module RunSvGsuLayerPackedQ610 (
    input  wire        ap_clk,
    input  wire        ap_rst,
    input  wire        ap_ce,
    input  wire        ap_start,
    input  wire        ap_continue,
    output reg         ap_done,
    output reg         ap_idle,
    output reg         ap_ready,

    input  wire [31:0] num_frames,
    input  wire [31:0] num_subbands,
    input  wire [31:0] input_size,
    input  wire [31:0] state_subband_offset,

    output reg  [7:0]  sequence_input_tiles_address0,
    output reg         sequence_input_tiles_ce0,
    input  wire [511:0] sequence_input_tiles_q0,
    output reg  [7:0]  sequence_input_tiles_address1,
    output reg         sequence_input_tiles_ce1,
    input  wire [511:0] sequence_input_tiles_q1,

    output reg  [10:0] weight_ih_tiles_address0,
    output reg         weight_ih_tiles_ce0,
    input  wire [511:0] weight_ih_tiles_q0,
    output reg  [10:0] weight_ih_tiles_address1,
    output reg         weight_ih_tiles_ce1,
    input  wire [511:0] weight_ih_tiles_q1,

    output reg  [10:0] weight_hh_tiles_address0,
    output reg         weight_hh_tiles_ce0,
    input  wire [511:0] weight_hh_tiles_q0,
    output reg  [10:0] weight_hh_tiles_address1,
    output reg         weight_hh_tiles_ce1,
    input  wire [511:0] weight_hh_tiles_q1,

    output reg  [3:0]  bias_ih_tiles_address0,
    output reg         bias_ih_tiles_ce0,
    input  wire [511:0] bias_ih_tiles_q0,
    output reg  [3:0]  bias_ih_tiles_address1,
    output reg         bias_ih_tiles_ce1,
    input  wire [511:0] bias_ih_tiles_q1,

    output reg  [2:0]  bn_mul_tiles_address0,
    output reg         bn_mul_tiles_ce0,
    input  wire [511:0] bn_mul_tiles_q0,
    output reg  [2:0]  bn_mul_tiles_address1,
    output reg         bn_mul_tiles_ce1,
    input  wire [511:0] bn_mul_tiles_q1,

    output reg  [2:0]  bn_add_tiles_address0,
    output reg         bn_add_tiles_ce0,
    input  wire [511:0] bn_add_tiles_q0,
    output reg  [2:0]  bn_add_tiles_address1,
    output reg         bn_add_tiles_ce1,
    input  wire [511:0] bn_add_tiles_q1,

    output reg  [6:0]  hx_state_tiles_address0,
    output reg         hx_state_tiles_ce0,
    output reg         hx_state_tiles_we0,
    output reg  [511:0] hx_state_tiles_d0,
    input  wire [511:0] hx_state_tiles_q0,
    output reg  [6:0]  hx_state_tiles_address1,
    output reg         hx_state_tiles_ce1,
    output reg         hx_state_tiles_we1,
    output reg  [511:0] hx_state_tiles_d1,
    input  wire [511:0] hx_state_tiles_q1,

    output reg  [6:0]  cx_state_tiles_address0,
    output reg         cx_state_tiles_ce0,
    output reg         cx_state_tiles_we0,
    output reg  [511:0] cx_state_tiles_d0,
    input  wire [511:0] cx_state_tiles_q0,
    output reg  [6:0]  cx_state_tiles_address1,
    output reg         cx_state_tiles_ce1,
    output reg         cx_state_tiles_we1,
    output reg  [511:0] cx_state_tiles_d1,
    input  wire [511:0] cx_state_tiles_q1,

    output reg  [7:0]  sequence_output_tiles_address0,
    output reg         sequence_output_tiles_ce0,
    output reg         sequence_output_tiles_we0,
    output reg  [511:0] sequence_output_tiles_d0,
    output reg  [7:0]  sequence_output_tiles_address1,
    output reg         sequence_output_tiles_ce1,
    output reg         sequence_output_tiles_we1,
    output reg  [511:0] sequence_output_tiles_d1
);
  localparam int HIDDEN_SIZE = 224;
  localparam int MAX_FRAMES = 4;
  localparam int MAX_SUBBANDS = 8;
  localparam int TOTAL_SUBBANDS = 13;
  localparam int TILE_LANES = 32;
  localparam int HIDDEN_TILES = 7;
  localparam int SEQUENCE_TILES = MAX_FRAMES * MAX_SUBBANDS * HIDDEN_TILES;
  localparam int WEIGHT_TILES = HIDDEN_SIZE * HIDDEN_TILES;
  localparam int STATE_TILES = TOTAL_SUBBANDS * HIDDEN_TILES;
  localparam int LOCAL_STATE_WORDS = MAX_SUBBANDS * HIDDEN_SIZE;
  localparam int SEQUENCE_WORDS = MAX_FRAMES * MAX_SUBBANDS * HIDDEN_SIZE;
  localparam int WEIGHT_WORDS = HIDDEN_SIZE * HIDDEN_SIZE;
  localparam int BIAS_WORDS = 2 * HIDDEN_SIZE;

  typedef enum logic [5:0] {
    ST_IDLE,
    ST_SEQ_ADDR,
    ST_SEQ_DATA,
    ST_WIH_ADDR,
    ST_WIH_DATA,
    ST_WHH_ADDR,
    ST_WHH_DATA,
    ST_BIAS_ADDR,
    ST_BIAS_DATA,
    ST_BN_MUL_ADDR,
    ST_BN_MUL_DATA,
    ST_BN_ADD_ADDR,
    ST_BN_ADD_DATA,
    ST_HX_ADDR,
    ST_HX_DATA,
    ST_CX_ADDR,
    ST_CX_DATA,
    ST_CORE_START,
    ST_CORE_WAIT,
    ST_WRITE_OUT,
    ST_WRITE_HX,
    ST_WRITE_CX,
    ST_DONE
  } state_t;

  state_t state;
  int tile_index;
  int active_sequence_tiles;
  int active_state_tiles;
  int local_state_tile;
  logic core_start;
  logic core_continue;
  wire core_done;
  wire core_idle;
  wire core_ready;

  q_t sequence_input [0:SEQUENCE_WORDS-1];
  q_t sequence_output [0:SEQUENCE_WORDS-1];
  q_t weight_ih [0:WEIGHT_WORDS-1];
  q_t weight_hh [0:WEIGHT_WORDS-1];
  q_t bias_ih [0:BIAS_WORDS-1];
  q_t bn_mul [0:HIDDEN_SIZE-1];
  q_t bn_add [0:HIDDEN_SIZE-1];
  q_t hx_state_in [0:LOCAL_STATE_WORDS-1];
  q_t cx_state_in [0:LOCAL_STATE_WORDS-1];
  q_t hx_state_out [0:LOCAL_STATE_WORDS-1];
  q_t cx_state_out [0:LOCAL_STATE_WORDS-1];

  function automatic int seq_tile_addr(input int frame, input int subband, input int tile);
    return (((frame * MAX_SUBBANDS) + subband) * HIDDEN_TILES) + tile;
  endfunction

  function automatic int local_word_addr(input int subband, input int hidden);
    return (subband * HIDDEN_SIZE) + hidden;
  endfunction

  function automatic int state_tile_addr(input int local_tile);
    int subband;
    int tile;
    begin
      subband = local_tile / HIDDEN_TILES;
      tile = local_tile % HIDDEN_TILES;
      return ((int'(state_subband_offset) + subband) * HIDDEN_TILES) + tile;
    end
  endfunction

  function automatic [511:0] pack_sequence_tile(input int tile);
    int frame;
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    reg [511:0] pack_word;
    begin
      frame = tile / (MAX_SUBBANDS * HIDDEN_TILES);
      subband = (tile / HIDDEN_TILES) % MAX_SUBBANDS;
      hidden_tile = tile % HIDDEN_TILES;
      pack_word = 512'd0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        pack_word[(lane * 16) +: 16] = sequence_output[(((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + hidden];
      end
      return pack_word;
    end
  endfunction

  function automatic [511:0] pack_hx_state_tile(input int local_tile);
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    reg [511:0] pack_word;
    begin
      subband = local_tile / HIDDEN_TILES;
      hidden_tile = local_tile % HIDDEN_TILES;
      pack_word = 512'd0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        pack_word[(lane * 16) +: 16] = hx_state_out[local_word_addr(subband, hidden)];
      end
      return pack_word;
    end
  endfunction

  function automatic [511:0] pack_cx_state_tile(input int local_tile);
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    reg [511:0] pack_word;
    begin
      subband = local_tile / HIDDEN_TILES;
      hidden_tile = local_tile % HIDDEN_TILES;
      pack_word = 512'd0;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        pack_word[(lane * 16) +: 16] = cx_state_out[local_word_addr(subband, hidden)];
      end
      return pack_word;
    end
  endfunction

  task automatic unpack_sequence_tile(input int tile, input [511:0] pack_word);
    int frame;
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    begin
      frame = tile / (MAX_SUBBANDS * HIDDEN_TILES);
      subband = (tile / HIDDEN_TILES) % MAX_SUBBANDS;
      hidden_tile = tile % HIDDEN_TILES;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        sequence_input[(((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + hidden] =
            q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  task automatic unpack_weight_tile(output q_t memory [0:WEIGHT_WORDS-1], input int tile, input [511:0] pack_word);
    int hidden;
    int feature_tile;
    int lane;
    int feature;
    begin
      hidden = tile / HIDDEN_TILES;
      feature_tile = tile % HIDDEN_TILES;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        feature = (feature_tile * TILE_LANES) + lane;
        memory[(hidden * HIDDEN_SIZE) + feature] = q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  task automatic unpack_bias_tile(input int tile, input [511:0] pack_word);
    int gate;
    int hidden_tile;
    int lane;
    int hidden;
    begin
      gate = tile / HIDDEN_TILES;
      hidden_tile = tile % HIDDEN_TILES;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        bias_ih[(gate * HIDDEN_SIZE) + hidden] = q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  task automatic unpack_vector_tile(output q_t memory [0:HIDDEN_SIZE-1], input int tile, input [511:0] pack_word);
    int lane;
    int hidden;
    begin
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (tile * TILE_LANES) + lane;
        memory[hidden] = q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  task automatic unpack_hx_state_tile(input int local_tile, input [511:0] pack_word);
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    begin
      subband = local_tile / HIDDEN_TILES;
      hidden_tile = local_tile % HIDDEN_TILES;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        hx_state_in[local_word_addr(subband, hidden)] = q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  task automatic unpack_cx_state_tile(input int local_tile, input [511:0] pack_word);
    int subband;
    int hidden_tile;
    int lane;
    int hidden;
    begin
      subband = local_tile / HIDDEN_TILES;
      hidden_tile = local_tile % HIDDEN_TILES;
      for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
        hidden = (hidden_tile * TILE_LANES) + lane;
        cx_state_in[local_word_addr(subband, hidden)] = q_t'(pack_word[(lane * 16) +: 16]);
      end
    end
  endtask

  gsu_layer_engine_rtl #(
      .HIDDEN_SIZE(HIDDEN_SIZE),
      .MAX_FRAMES(MAX_FRAMES),
      .MAX_SUBBANDS(MAX_SUBBANDS),
      .HIDDEN_PAR(2),
      .DOT_PAR(32),
      .STATE_WORDS(LOCAL_STATE_WORDS)
  ) core (
      .ap_clk(ap_clk),
      .ap_rst(ap_rst),
      .ap_ce(ap_ce),
      .ap_start(core_start),
      .ap_continue(core_continue),
      .ap_done(core_done),
      .ap_idle(core_idle),
      .ap_ready(core_ready),
      .num_frames(num_frames[2:0]),
      .num_subbands(num_subbands[3:0]),
      .input_size(input_size[7:0]),
      .sequence_input(sequence_input),
      .weight_ih(weight_ih),
      .weight_hh(weight_hh),
      .bias_ih(bias_ih),
      .bn_mul(bn_mul),
      .bn_add(bn_add),
      .hx_state_in(hx_state_in),
      .cx_state_in(cx_state_in),
      .hx_state_out(hx_state_out),
      .cx_state_out(cx_state_out),
      .sequence_output(sequence_output)
  );

  always_comb begin
    sequence_input_tiles_address1 = 8'd0;
    sequence_input_tiles_ce1 = 1'b0;
    weight_ih_tiles_address1 = 11'd0;
    weight_ih_tiles_ce1 = 1'b0;
    weight_hh_tiles_address1 = 11'd0;
    weight_hh_tiles_ce1 = 1'b0;
    bias_ih_tiles_address1 = 4'd0;
    bias_ih_tiles_ce1 = 1'b0;
    bn_mul_tiles_address1 = 3'd0;
    bn_mul_tiles_ce1 = 1'b0;
    bn_add_tiles_address1 = 3'd0;
    bn_add_tiles_ce1 = 1'b0;
    hx_state_tiles_address1 = 7'd0;
    hx_state_tiles_ce1 = 1'b0;
    hx_state_tiles_we1 = 1'b0;
    hx_state_tiles_d1 = 512'd0;
    cx_state_tiles_address1 = 7'd0;
    cx_state_tiles_ce1 = 1'b0;
    cx_state_tiles_we1 = 1'b0;
    cx_state_tiles_d1 = 512'd0;
    sequence_output_tiles_address1 = 8'd0;
    sequence_output_tiles_ce1 = 1'b0;
    sequence_output_tiles_we1 = 1'b0;
    sequence_output_tiles_d1 = 512'd0;
  end

  always_ff @(posedge ap_clk) begin
    if (ap_rst) begin
      state <= ST_IDLE;
      tile_index <= 0;
      local_state_tile <= 0;
      active_sequence_tiles <= 0;
      active_state_tiles <= 0;
      core_start <= 1'b0;
      core_continue <= 1'b0;
      ap_done <= 1'b0;
      ap_idle <= 1'b1;
      ap_ready <= 1'b0;
      sequence_input_tiles_ce0 <= 1'b0;
      weight_ih_tiles_ce0 <= 1'b0;
      weight_hh_tiles_ce0 <= 1'b0;
      bias_ih_tiles_ce0 <= 1'b0;
      bn_mul_tiles_ce0 <= 1'b0;
      bn_add_tiles_ce0 <= 1'b0;
      hx_state_tiles_ce0 <= 1'b0;
      hx_state_tiles_we0 <= 1'b0;
      cx_state_tiles_ce0 <= 1'b0;
      cx_state_tiles_we0 <= 1'b0;
      sequence_output_tiles_ce0 <= 1'b0;
      sequence_output_tiles_we0 <= 1'b0;
    end else if (ap_ce) begin
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      ap_idle <= (state == ST_IDLE);
      core_start <= 1'b0;
      core_continue <= 1'b0;
      sequence_input_tiles_ce0 <= 1'b0;
      weight_ih_tiles_ce0 <= 1'b0;
      weight_hh_tiles_ce0 <= 1'b0;
      bias_ih_tiles_ce0 <= 1'b0;
      bn_mul_tiles_ce0 <= 1'b0;
      bn_add_tiles_ce0 <= 1'b0;
      hx_state_tiles_ce0 <= 1'b0;
      hx_state_tiles_we0 <= 1'b0;
      cx_state_tiles_ce0 <= 1'b0;
      cx_state_tiles_we0 <= 1'b0;
      sequence_output_tiles_ce0 <= 1'b0;
      sequence_output_tiles_we0 <= 1'b0;

      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            active_sequence_tiles <= int'(num_frames) * MAX_SUBBANDS * HIDDEN_TILES;
            active_state_tiles <= int'(num_subbands) * HIDDEN_TILES;
            tile_index <= 0;
            state <= ST_SEQ_ADDR;
            ap_idle <= 1'b0;
          end
        end

        ST_SEQ_ADDR: begin
          if (tile_index < active_sequence_tiles) begin
            sequence_input_tiles_address0 <= tile_index[7:0];
            sequence_input_tiles_ce0 <= 1'b1;
            state <= ST_SEQ_DATA;
          end else begin
            tile_index <= 0;
            state <= ST_WIH_ADDR;
          end
        end

        ST_SEQ_DATA: begin
          unpack_sequence_tile(tile_index, sequence_input_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_SEQ_ADDR;
        end

        ST_WIH_ADDR: begin
          if (tile_index < WEIGHT_TILES) begin
            weight_ih_tiles_address0 <= tile_index[10:0];
            weight_ih_tiles_ce0 <= 1'b1;
            state <= ST_WIH_DATA;
          end else begin
            tile_index <= 0;
            state <= ST_WHH_ADDR;
          end
        end

        ST_WIH_DATA: begin
          unpack_weight_tile(weight_ih, tile_index, weight_ih_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_WIH_ADDR;
        end

        ST_WHH_ADDR: begin
          if (tile_index < WEIGHT_TILES) begin
            weight_hh_tiles_address0 <= tile_index[10:0];
            weight_hh_tiles_ce0 <= 1'b1;
            state <= ST_WHH_DATA;
          end else begin
            tile_index <= 0;
            state <= ST_BIAS_ADDR;
          end
        end

        ST_WHH_DATA: begin
          unpack_weight_tile(weight_hh, tile_index, weight_hh_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_WHH_ADDR;
        end

        ST_BIAS_ADDR: begin
          if (tile_index < (2 * HIDDEN_TILES)) begin
            bias_ih_tiles_address0 <= tile_index[3:0];
            bias_ih_tiles_ce0 <= 1'b1;
            state <= ST_BIAS_DATA;
          end else begin
            tile_index <= 0;
            state <= ST_BN_MUL_ADDR;
          end
        end

        ST_BIAS_DATA: begin
          unpack_bias_tile(tile_index, bias_ih_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_BIAS_ADDR;
        end

        ST_BN_MUL_ADDR: begin
          if (tile_index < HIDDEN_TILES) begin
            bn_mul_tiles_address0 <= tile_index[2:0];
            bn_mul_tiles_ce0 <= 1'b1;
            state <= ST_BN_MUL_DATA;
          end else begin
            tile_index <= 0;
            state <= ST_BN_ADD_ADDR;
          end
        end

        ST_BN_MUL_DATA: begin
          unpack_vector_tile(bn_mul, tile_index, bn_mul_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_BN_MUL_ADDR;
        end

        ST_BN_ADD_ADDR: begin
          if (tile_index < HIDDEN_TILES) begin
            bn_add_tiles_address0 <= tile_index[2:0];
            bn_add_tiles_ce0 <= 1'b1;
            state <= ST_BN_ADD_DATA;
          end else begin
            tile_index <= 0;
            local_state_tile <= 0;
            state <= ST_HX_ADDR;
          end
        end

        ST_BN_ADD_DATA: begin
          unpack_vector_tile(bn_add, tile_index, bn_add_tiles_q0);
          tile_index <= tile_index + 1;
          state <= ST_BN_ADD_ADDR;
        end

        ST_HX_ADDR: begin
          if (local_state_tile < active_state_tiles) begin
            hx_state_tiles_address0 <= state_tile_addr(local_state_tile);
            hx_state_tiles_ce0 <= 1'b1;
            state <= ST_HX_DATA;
          end else begin
            local_state_tile <= 0;
            state <= ST_CX_ADDR;
          end
        end

        ST_HX_DATA: begin
          unpack_hx_state_tile(local_state_tile, hx_state_tiles_q0);
          local_state_tile <= local_state_tile + 1;
          state <= ST_HX_ADDR;
        end

        ST_CX_ADDR: begin
          if (local_state_tile < active_state_tiles) begin
            cx_state_tiles_address0 <= state_tile_addr(local_state_tile);
            cx_state_tiles_ce0 <= 1'b1;
            state <= ST_CX_DATA;
          end else begin
            state <= ST_CORE_START;
          end
        end

        ST_CX_DATA: begin
          unpack_cx_state_tile(local_state_tile, cx_state_tiles_q0);
          local_state_tile <= local_state_tile + 1;
          state <= ST_CX_ADDR;
        end

        ST_CORE_START: begin
          core_start <= 1'b1;
          state <= ST_CORE_WAIT;
        end

        ST_CORE_WAIT: begin
          if (core_done) begin
            core_continue <= 1'b1;
            tile_index <= 0;
            state <= ST_WRITE_OUT;
          end
        end

        ST_WRITE_OUT: begin
          if (tile_index < active_sequence_tiles) begin
            sequence_output_tiles_address0 <= tile_index[7:0];
            sequence_output_tiles_d0 <= pack_sequence_tile(tile_index);
            sequence_output_tiles_we0 <= 1'b1;
            sequence_output_tiles_ce0 <= 1'b1;
            tile_index <= tile_index + 1;
          end else begin
            local_state_tile <= 0;
            state <= ST_WRITE_HX;
          end
        end

        ST_WRITE_HX: begin
          if (local_state_tile < active_state_tiles) begin
            hx_state_tiles_address0 <= state_tile_addr(local_state_tile);
            hx_state_tiles_d0 <= pack_hx_state_tile(local_state_tile);
            hx_state_tiles_we0 <= 1'b1;
            hx_state_tiles_ce0 <= 1'b1;
            local_state_tile <= local_state_tile + 1;
          end else begin
            local_state_tile <= 0;
            state <= ST_WRITE_CX;
          end
        end

        ST_WRITE_CX: begin
          if (local_state_tile < active_state_tiles) begin
            cx_state_tiles_address0 <= state_tile_addr(local_state_tile);
            cx_state_tiles_d0 <= pack_cx_state_tile(local_state_tile);
            cx_state_tiles_we0 <= 1'b1;
            cx_state_tiles_ce0 <= 1'b1;
            local_state_tile <= local_state_tile + 1;
          end else begin
            state <= ST_DONE;
          end
        end

        ST_DONE: begin
          ap_done <= 1'b1;
          ap_ready <= 1'b1;
          if (ap_continue) begin
            state <= ST_IDLE;
            ap_idle <= 1'b1;
          end
        end
      endcase
    end
  end
endmodule
