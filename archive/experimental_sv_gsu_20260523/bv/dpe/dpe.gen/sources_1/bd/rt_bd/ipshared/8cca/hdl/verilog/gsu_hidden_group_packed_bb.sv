`timescale 1 ns / 1 ps

module RunSvGsuHiddenGroupPackedQ610 (
    input  wire          ap_clk,
    input  wire          ap_rst,
    input  wire          ap_ce,
    input  wire          ap_start,
    input  wire          ap_continue,
    output wire          ap_done,
    output wire          ap_idle,
    output wire          ap_ready,

    input  wire [31:0]   input_size,
    input  wire [31:0]   hidden_base,

    output reg  [2:0]    input_tiles_address0,
    output reg           input_tiles_ce0,
    input  wire [511:0]  input_tiles_q0,
    output reg  [2:0]    input_tiles_address1,
    output reg           input_tiles_ce1,
    input  wire [511:0]  input_tiles_q1,

    output reg  [2:0]    prev_hx_tiles_address0,
    output reg           prev_hx_tiles_ce0,
    input  wire [511:0]  prev_hx_tiles_q0,
    output reg  [2:0]    prev_hx_tiles_address1,
    output reg           prev_hx_tiles_ce1,
    input  wire [511:0]  prev_hx_tiles_q1,

    input  wire [511:0]  hx_tile_in,
    input  wire [511:0]  cx_tile_in,
    input  wire [511:0]  output_tile_in,

    output reg  [3:0]    weight_ih_group_address0,
    output reg           weight_ih_group_ce0,
    input  wire [511:0]  weight_ih_group_q0,
    output reg  [3:0]    weight_ih_group_address1,
    output reg           weight_ih_group_ce1,
    input  wire [511:0]  weight_ih_group_q1,

    output reg  [3:0]    weight_hh_group_address0,
    output reg           weight_hh_group_ce0,
    input  wire [511:0]  weight_hh_group_q0,
    output reg  [3:0]    weight_hh_group_address1,
    output reg           weight_hh_group_ce1,
    input  wire [511:0]  weight_hh_group_q1,

    output reg           forget_bias_address0,
    output reg           forget_bias_ce0,
    input  wire [15:0]   forget_bias_q0,
    output reg           forget_bias_address1,
    output reg           forget_bias_ce1,
    input  wire [15:0]   forget_bias_q1,

    output reg           cell_bias_address0,
    output reg           cell_bias_ce0,
    input  wire [15:0]   cell_bias_q0,
    output reg           cell_bias_address1,
    output reg           cell_bias_ce1,
    input  wire [15:0]   cell_bias_q1,

    output reg           bn_mul_address0,
    output reg           bn_mul_ce0,
    input  wire [15:0]   bn_mul_q0,
    output reg           bn_mul_address1,
    output reg           bn_mul_ce1,
    input  wire [15:0]   bn_mul_q1,

    output reg           bn_add_address0,
    output reg           bn_add_ce0,
    input  wire [15:0]   bn_add_q0,
    output reg           bn_add_address1,
    output reg           bn_add_ce1,
    input  wire [15:0]   bn_add_q1,

    output reg  [1:0]    result_tiles_address0,
    output reg           result_tiles_ce0,
    output reg           result_tiles_we0,
    output reg  [511:0]  result_tiles_d0,
    output reg  [1:0]    result_tiles_address1,
    output reg           result_tiles_ce1,
    output reg           result_tiles_we1,
    output reg  [511:0]  result_tiles_d1
);
  localparam int TILE_COUNT = 7;

  typedef enum logic [3:0] {
    ST_IDLE,
    ST_TILE_ADDR,
    ST_TILE_DATA,
    ST_WEIGHT_ADDR,
    ST_WEIGHT_DATA,
    ST_PARAM_ADDR,
    ST_PARAM_DATA,
    ST_CORE_START,
    ST_CORE_WAIT,
    ST_RESULT_HX,
    ST_RESULT_CX,
    ST_RESULT_OUTPUT,
    ST_DONE
  } state_t;

  state_t state;
  logic [2:0] tile_pair_index;
  logic [2:0] weight_pair_index;
  logic core_start;
  logic core_continue;
  wire core_done;
  wire core_idle;
  wire core_ready;
  wire core_hx_vld;
  wire core_cx_vld;
  wire core_output_vld;
  wire [511:0] core_hx_tile_out;
  wire [511:0] core_cx_tile_out;
  wire [511:0] core_output_tile_out;

  logic [511:0] input_tile_reg [0:TILE_COUNT-1];
  logic [511:0] prev_hx_tile_reg [0:TILE_COUNT-1];
  logic [511:0] weight_ih_reg [0:1][0:TILE_COUNT-1];
  logic [511:0] weight_hh_reg [0:1][0:TILE_COUNT-1];
  logic [15:0] forget_bias_reg [0:1];
  logic [15:0] cell_bias_reg [0:1];
  logic [15:0] bn_mul_reg [0:1];
  logic [15:0] bn_add_reg [0:1];

  assign ap_idle = (state == ST_IDLE);
  assign ap_done = (state == ST_DONE);
  assign ap_ready = (state == ST_DONE);
  assign core_start = (state == ST_CORE_START);
  assign core_continue = (state == ST_DONE) && ap_continue;

  RunSvGsuHiddenGroupScalarQ610 core (
      .ap_clk(ap_clk),
      .ap_rst(ap_rst),
      .ap_ce(ap_ce),
      .ap_start(core_start),
      .ap_continue(core_continue),
      .ap_done(core_done),
      .ap_idle(core_idle),
      .ap_ready(core_ready),
      .input_size(input_size),
      .hidden_lane_base({27'd0, hidden_base[4:0]}),
      .input_tile_0(input_tile_reg[0]),
      .input_tile_1(input_tile_reg[1]),
      .input_tile_2(input_tile_reg[2]),
      .input_tile_3(input_tile_reg[3]),
      .input_tile_4(input_tile_reg[4]),
      .input_tile_5(input_tile_reg[5]),
      .input_tile_6(input_tile_reg[6]),
      .prev_hx_tile_0(prev_hx_tile_reg[0]),
      .prev_hx_tile_1(prev_hx_tile_reg[1]),
      .prev_hx_tile_2(prev_hx_tile_reg[2]),
      .prev_hx_tile_3(prev_hx_tile_reg[3]),
      .prev_hx_tile_4(prev_hx_tile_reg[4]),
      .prev_hx_tile_5(prev_hx_tile_reg[5]),
      .prev_hx_tile_6(prev_hx_tile_reg[6]),
      .hx_tile_in(hx_tile_in),
      .cx_tile_in(cx_tile_in),
      .output_tile_in(output_tile_in),
      .weight_ih_row0_tile_0(weight_ih_reg[0][0]),
      .weight_ih_row0_tile_1(weight_ih_reg[0][1]),
      .weight_ih_row0_tile_2(weight_ih_reg[0][2]),
      .weight_ih_row0_tile_3(weight_ih_reg[0][3]),
      .weight_ih_row0_tile_4(weight_ih_reg[0][4]),
      .weight_ih_row0_tile_5(weight_ih_reg[0][5]),
      .weight_ih_row0_tile_6(weight_ih_reg[0][6]),
      .weight_ih_row1_tile_0(weight_ih_reg[1][0]),
      .weight_ih_row1_tile_1(weight_ih_reg[1][1]),
      .weight_ih_row1_tile_2(weight_ih_reg[1][2]),
      .weight_ih_row1_tile_3(weight_ih_reg[1][3]),
      .weight_ih_row1_tile_4(weight_ih_reg[1][4]),
      .weight_ih_row1_tile_5(weight_ih_reg[1][5]),
      .weight_ih_row1_tile_6(weight_ih_reg[1][6]),
      .weight_hh_row0_tile_0(weight_hh_reg[0][0]),
      .weight_hh_row0_tile_1(weight_hh_reg[0][1]),
      .weight_hh_row0_tile_2(weight_hh_reg[0][2]),
      .weight_hh_row0_tile_3(weight_hh_reg[0][3]),
      .weight_hh_row0_tile_4(weight_hh_reg[0][4]),
      .weight_hh_row0_tile_5(weight_hh_reg[0][5]),
      .weight_hh_row0_tile_6(weight_hh_reg[0][6]),
      .weight_hh_row1_tile_0(weight_hh_reg[1][0]),
      .weight_hh_row1_tile_1(weight_hh_reg[1][1]),
      .weight_hh_row1_tile_2(weight_hh_reg[1][2]),
      .weight_hh_row1_tile_3(weight_hh_reg[1][3]),
      .weight_hh_row1_tile_4(weight_hh_reg[1][4]),
      .weight_hh_row1_tile_5(weight_hh_reg[1][5]),
      .weight_hh_row1_tile_6(weight_hh_reg[1][6]),
      .forget_bias_0(forget_bias_reg[0]),
      .forget_bias_1(forget_bias_reg[1]),
      .cell_bias_0(cell_bias_reg[0]),
      .cell_bias_1(cell_bias_reg[1]),
      .bn_mul_0(bn_mul_reg[0]),
      .bn_mul_1(bn_mul_reg[1]),
      .bn_add_0(bn_add_reg[0]),
      .bn_add_1(bn_add_reg[1]),
      .hx_tile_out(core_hx_tile_out),
      .hx_tile_out_ap_vld(core_hx_vld),
      .cx_tile_out(core_cx_tile_out),
      .cx_tile_out_ap_vld(core_cx_vld),
      .output_tile_out(core_output_tile_out),
      .output_tile_out_ap_vld(core_output_vld)
  );

  always_comb begin
    input_tiles_address0 = 3'd0;
    input_tiles_address1 = 3'd0;
    input_tiles_ce0 = 1'b0;
    input_tiles_ce1 = 1'b0;
    prev_hx_tiles_address0 = 3'd0;
    prev_hx_tiles_address1 = 3'd0;
    prev_hx_tiles_ce0 = 1'b0;
    prev_hx_tiles_ce1 = 1'b0;
    weight_ih_group_address0 = 4'd0;
    weight_ih_group_address1 = 4'd0;
    weight_ih_group_ce0 = 1'b0;
    weight_ih_group_ce1 = 1'b0;
    weight_hh_group_address0 = 4'd0;
    weight_hh_group_address1 = 4'd0;
    weight_hh_group_ce0 = 1'b0;
    weight_hh_group_ce1 = 1'b0;
    forget_bias_address0 = 1'b0;
    forget_bias_address1 = 1'b0;
    forget_bias_ce0 = 1'b0;
    forget_bias_ce1 = 1'b0;
    cell_bias_address0 = 1'b0;
    cell_bias_address1 = 1'b0;
    cell_bias_ce0 = 1'b0;
    cell_bias_ce1 = 1'b0;
    bn_mul_address0 = 1'b0;
    bn_mul_address1 = 1'b0;
    bn_mul_ce0 = 1'b0;
    bn_mul_ce1 = 1'b0;
    bn_add_address0 = 1'b0;
    bn_add_address1 = 1'b0;
    bn_add_ce0 = 1'b0;
    bn_add_ce1 = 1'b0;
    result_tiles_address0 = 2'd0;
    result_tiles_ce0 = 1'b0;
    result_tiles_we0 = 1'b0;
    result_tiles_d0 = 512'd0;
    result_tiles_address1 = 2'd0;
    result_tiles_ce1 = 1'b0;
    result_tiles_we1 = 1'b0;
    result_tiles_d1 = 512'd0;

    if (state == ST_TILE_ADDR) begin
      input_tiles_address0 = tile_pair_index * 2;
      prev_hx_tiles_address0 = tile_pair_index * 2;
      input_tiles_ce0 = 1'b1;
      prev_hx_tiles_ce0 = 1'b1;
      if (((tile_pair_index * 2) + 1) < TILE_COUNT) begin
        input_tiles_address1 = (tile_pair_index * 2) + 1;
        prev_hx_tiles_address1 = (tile_pair_index * 2) + 1;
        input_tiles_ce1 = 1'b1;
        prev_hx_tiles_ce1 = 1'b1;
      end
    end

    if (state == ST_WEIGHT_ADDR) begin
      weight_ih_group_address0 = weight_pair_index * 2;
      weight_hh_group_address0 = weight_pair_index * 2;
      weight_ih_group_address1 = (weight_pair_index * 2) + 1;
      weight_hh_group_address1 = (weight_pair_index * 2) + 1;
      weight_ih_group_ce0 = 1'b1;
      weight_ih_group_ce1 = 1'b1;
      weight_hh_group_ce0 = 1'b1;
      weight_hh_group_ce1 = 1'b1;
    end

    if (state == ST_PARAM_ADDR) begin
      forget_bias_address0 = 1'b0;
      forget_bias_address1 = 1'b1;
      forget_bias_ce0 = 1'b1;
      forget_bias_ce1 = 1'b1;
      cell_bias_address0 = 1'b0;
      cell_bias_address1 = 1'b1;
      cell_bias_ce0 = 1'b1;
      cell_bias_ce1 = 1'b1;
      bn_mul_address0 = 1'b0;
      bn_mul_address1 = 1'b1;
      bn_mul_ce0 = 1'b1;
      bn_mul_ce1 = 1'b1;
      bn_add_address0 = 1'b0;
      bn_add_address1 = 1'b1;
      bn_add_ce0 = 1'b1;
      bn_add_ce1 = 1'b1;
    end

    if (state == ST_RESULT_HX) begin
      result_tiles_address0 = 2'd0;
      result_tiles_ce0 = core_hx_vld;
      result_tiles_we0 = core_hx_vld;
      result_tiles_d0 = core_hx_tile_out;
    end

    if (state == ST_RESULT_CX) begin
      result_tiles_address0 = 2'd1;
      result_tiles_ce0 = core_cx_vld;
      result_tiles_we0 = core_cx_vld;
      result_tiles_d0 = core_cx_tile_out;
    end

    if (state == ST_RESULT_OUTPUT) begin
      result_tiles_address0 = 2'd2;
      result_tiles_ce0 = core_output_vld;
      result_tiles_we0 = core_output_vld;
      result_tiles_d0 = core_output_tile_out;
    end
  end

  always_ff @(posedge ap_clk) begin
    int addr0;
    int addr1;
    int row0;
    int row1;
    int tile0;
    int tile1;

    if (ap_rst) begin
      state <= ST_IDLE;
      tile_pair_index <= '0;
      weight_pair_index <= '0;
    end else if (ap_ce) begin
      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            tile_pair_index <= '0;
            weight_pair_index <= '0;
            state <= ST_TILE_ADDR;
          end
        end
        ST_TILE_ADDR: begin
          state <= ST_TILE_DATA;
        end
        ST_TILE_DATA: begin
          addr0 = int'(tile_pair_index) * 2;
          addr1 = addr0 + 1;
          input_tile_reg[addr0] <= input_tiles_q0;
          prev_hx_tile_reg[addr0] <= prev_hx_tiles_q0;
          if (addr1 < TILE_COUNT) begin
            input_tile_reg[addr1] <= input_tiles_q1;
            prev_hx_tile_reg[addr1] <= prev_hx_tiles_q1;
          end
          if (tile_pair_index == 3'd3) begin
            weight_pair_index <= '0;
            state <= ST_WEIGHT_ADDR;
          end else begin
            tile_pair_index <= tile_pair_index + 3'd1;
            state <= ST_TILE_ADDR;
          end
        end
        ST_WEIGHT_ADDR: begin
          state <= ST_WEIGHT_DATA;
        end
        ST_WEIGHT_DATA: begin
          addr0 = int'(weight_pair_index) * 2;
          addr1 = addr0 + 1;
          row0 = addr0 / TILE_COUNT;
          tile0 = addr0 % TILE_COUNT;
          row1 = addr1 / TILE_COUNT;
          tile1 = addr1 % TILE_COUNT;
          weight_ih_reg[row0][tile0] <= weight_ih_group_q0;
          weight_hh_reg[row0][tile0] <= weight_hh_group_q0;
          weight_ih_reg[row1][tile1] <= weight_ih_group_q1;
          weight_hh_reg[row1][tile1] <= weight_hh_group_q1;
          if (weight_pair_index == 3'd6) begin
            state <= ST_PARAM_ADDR;
          end else begin
            weight_pair_index <= weight_pair_index + 3'd1;
            state <= ST_WEIGHT_ADDR;
          end
        end
        ST_PARAM_ADDR: begin
          state <= ST_PARAM_DATA;
        end
        ST_PARAM_DATA: begin
          forget_bias_reg[0] <= forget_bias_q0;
          forget_bias_reg[1] <= forget_bias_q1;
          cell_bias_reg[0] <= cell_bias_q0;
          cell_bias_reg[1] <= cell_bias_q1;
          bn_mul_reg[0] <= bn_mul_q0;
          bn_mul_reg[1] <= bn_mul_q1;
          bn_add_reg[0] <= bn_add_q0;
          bn_add_reg[1] <= bn_add_q1;
          state <= ST_CORE_START;
        end
        ST_CORE_START: begin
          state <= ST_CORE_WAIT;
        end
        ST_CORE_WAIT: begin
          if (core_done) begin
            state <= ST_RESULT_HX;
          end
        end
        ST_RESULT_HX: begin
          state <= ST_RESULT_CX;
        end
        ST_RESULT_CX: begin
          state <= ST_RESULT_OUTPUT;
        end
        ST_RESULT_OUTPUT: begin
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
