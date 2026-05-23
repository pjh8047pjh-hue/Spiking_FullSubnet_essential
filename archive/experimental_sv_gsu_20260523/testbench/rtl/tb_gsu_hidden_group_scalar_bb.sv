`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module tb_gsu_hidden_group_scalar_bb;
  localparam int TILE_COUNT = 7;
  localparam int TILE_LANES = 32;
  localparam int MAX_CYCLES = 2000;

  logic ap_clk = 1'b0;
  logic ap_rst = 1'b1;
  logic ap_ce = 1'b1;
  logic ap_start = 1'b0;
  logic ap_continue = 1'b0;
  logic ap_done;
  logic ap_idle;
  logic ap_ready;

  logic [31:0] input_size;
  logic [31:0] hidden_lane_base;
  logic [511:0] input_tiles [0:TILE_COUNT-1];
  logic [511:0] prev_hx_tiles [0:TILE_COUNT-1];
  logic [511:0] weight_ih [0:1][0:TILE_COUNT-1];
  logic [511:0] weight_hh [0:1][0:TILE_COUNT-1];
  logic [511:0] hx_tile_in;
  logic [511:0] cx_tile_in;
  logic [511:0] output_tile_in;
  q_t forget_bias [0:1];
  q_t cell_bias [0:1];
  q_t bn_mul [0:1];
  q_t bn_add [0:1];
  logic [511:0] hx_tile_out;
  logic [511:0] cx_tile_out;
  logic [511:0] output_tile_out;
  logic hx_tile_out_ap_vld;
  logic cx_tile_out_ap_vld;
  logic output_tile_out_ap_vld;

  int scenario_count = 0;
  int mismatch_count = 0;
  int timeout_count = 0;
  int element_count = 0;

  RunSvGsuHiddenGroupScalarQ610 dut (
      .ap_clk(ap_clk),
      .ap_rst(ap_rst),
      .ap_ce(ap_ce),
      .ap_start(ap_start),
      .ap_continue(ap_continue),
      .ap_done(ap_done),
      .ap_idle(ap_idle),
      .ap_ready(ap_ready),
      .input_size(input_size),
      .hidden_lane_base(hidden_lane_base),
      .input_tile_0(input_tiles[0]),
      .input_tile_1(input_tiles[1]),
      .input_tile_2(input_tiles[2]),
      .input_tile_3(input_tiles[3]),
      .input_tile_4(input_tiles[4]),
      .input_tile_5(input_tiles[5]),
      .input_tile_6(input_tiles[6]),
      .prev_hx_tile_0(prev_hx_tiles[0]),
      .prev_hx_tile_1(prev_hx_tiles[1]),
      .prev_hx_tile_2(prev_hx_tiles[2]),
      .prev_hx_tile_3(prev_hx_tiles[3]),
      .prev_hx_tile_4(prev_hx_tiles[4]),
      .prev_hx_tile_5(prev_hx_tiles[5]),
      .prev_hx_tile_6(prev_hx_tiles[6]),
      .hx_tile_in(hx_tile_in),
      .cx_tile_in(cx_tile_in),
      .output_tile_in(output_tile_in),
      .weight_ih_row0_tile_0(weight_ih[0][0]),
      .weight_ih_row0_tile_1(weight_ih[0][1]),
      .weight_ih_row0_tile_2(weight_ih[0][2]),
      .weight_ih_row0_tile_3(weight_ih[0][3]),
      .weight_ih_row0_tile_4(weight_ih[0][4]),
      .weight_ih_row0_tile_5(weight_ih[0][5]),
      .weight_ih_row0_tile_6(weight_ih[0][6]),
      .weight_ih_row1_tile_0(weight_ih[1][0]),
      .weight_ih_row1_tile_1(weight_ih[1][1]),
      .weight_ih_row1_tile_2(weight_ih[1][2]),
      .weight_ih_row1_tile_3(weight_ih[1][3]),
      .weight_ih_row1_tile_4(weight_ih[1][4]),
      .weight_ih_row1_tile_5(weight_ih[1][5]),
      .weight_ih_row1_tile_6(weight_ih[1][6]),
      .weight_hh_row0_tile_0(weight_hh[0][0]),
      .weight_hh_row0_tile_1(weight_hh[0][1]),
      .weight_hh_row0_tile_2(weight_hh[0][2]),
      .weight_hh_row0_tile_3(weight_hh[0][3]),
      .weight_hh_row0_tile_4(weight_hh[0][4]),
      .weight_hh_row0_tile_5(weight_hh[0][5]),
      .weight_hh_row0_tile_6(weight_hh[0][6]),
      .weight_hh_row1_tile_0(weight_hh[1][0]),
      .weight_hh_row1_tile_1(weight_hh[1][1]),
      .weight_hh_row1_tile_2(weight_hh[1][2]),
      .weight_hh_row1_tile_3(weight_hh[1][3]),
      .weight_hh_row1_tile_4(weight_hh[1][4]),
      .weight_hh_row1_tile_5(weight_hh[1][5]),
      .weight_hh_row1_tile_6(weight_hh[1][6]),
      .forget_bias_0(forget_bias[0]),
      .forget_bias_1(forget_bias[1]),
      .cell_bias_0(cell_bias[0]),
      .cell_bias_1(cell_bias[1]),
      .bn_mul_0(bn_mul[0]),
      .bn_mul_1(bn_mul[1]),
      .bn_add_0(bn_add[0]),
      .bn_add_1(bn_add[1]),
      .hx_tile_out(hx_tile_out),
      .hx_tile_out_ap_vld(hx_tile_out_ap_vld),
      .cx_tile_out(cx_tile_out),
      .cx_tile_out_ap_vld(cx_tile_out_ap_vld),
      .output_tile_out(output_tile_out),
      .output_tile_out_ap_vld(output_tile_out_ap_vld)
  );

  always #5 ap_clk = ~ap_clk;

  function automatic int unsigned mix32(input int unsigned seed, input int index, input int salt);
    int unsigned x;
    begin
      x = seed ^ (32'(index) * 32'h9e3779b9) ^ (32'(salt) * 32'h85ebca6b);
      x = (x ^ (x >> 16)) * 32'h7feb352d;
      x = (x ^ (x >> 15)) * 32'h846ca68b;
      return x ^ (x >> 16);
    end
  endfunction

  function automatic q_t to_q(input int value);
    return q_t'(value[15:0]);
  endfunction

  function automatic q_t pattern_q(input int unsigned seed, input int profile, input int index, input int salt);
    int unsigned x;
    int signed_value;
    begin
      x = mix32(seed, index, salt);
      case (profile)
        0: signed_value = ((x >> 24) & 8'h7f) - 64;
        1: signed_value = shortint'(x[15:0]);
        2: signed_value = ((x & 7) < 6) ? 0 : ((((x >> 23) & 8'hff) - 128) * 4);
        3: signed_value = ((index & 1) ? -1024 : 1024) + int'((x >> 28) & 4'hf) - 8;
        default: begin
          case ((index + salt + int'(x & 3)) % 11)
            0: signed_value = -32768;
            1: signed_value = -24576;
            2: signed_value = -16384;
            3: signed_value = -8192;
            4: signed_value = -1024;
            5: signed_value = 0;
            6: signed_value = 1024;
            7: signed_value = 8192;
            8: signed_value = 16384;
            9: signed_value = 24576;
            default: signed_value = 32767;
          endcase
        end
      endcase
      return to_q(signed_value);
    end
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

  function automatic acc_t row_input_sum(input int row, input int size);
    acc_t sum;
    int tile;
    int lane;
    int feature_index;
    begin
      sum = '0;
      for (tile = 0; tile < TILE_COUNT; tile = tile + 1) begin
        for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
          feature_index = (tile * TILE_LANES) + lane;
          if (feature_index < size) begin
            sum = sum + mul_for_mac_q610(lane_read(input_tiles[tile], lane), lane_read(weight_ih[row][tile], lane));
          end
        end
      end
      return sum;
    end
  endfunction

  function automatic acc_t row_recurrent_sum(input int row);
    acc_t sum;
    int tile;
    int lane;
    begin
      sum = '0;
      for (tile = 0; tile < TILE_COUNT; tile = tile + 1) begin
        for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
          sum = sum + mul_for_mac_q610(lane_read(prev_hx_tiles[tile], lane), lane_read(weight_hh[row][tile], lane));
        end
      end
      return sum;
    end
  endfunction

  task automatic apply_ref_lane(
      input int lane,
      input acc_t common_q20,
      input q_t forget_bias_value,
      input q_t cell_bias_value,
      input q_t bn_mul_value,
      input q_t bn_add_value,
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
    q_t retained_q610;
    q_t injected_q610;
    q_t cy_q610;
    q_t hy_q610;
    begin
      forget_q20 = common_q20 + (acc_t'(forget_bias_value) <<< Q_FRAC);
      cell_q20 = common_q20 + (acc_t'(cell_bias_value) <<< Q_FRAC);
      forget_preact_q610 = saturate_int16(round_shift_right(forget_q20, Q_FRAC));
      cell_preact_q610 = saturate_int16(round_shift_right(cell_q20, Q_FRAC));
      forget_gate_q610 = sigmoid_pwl_q610(forget_preact_q610);
      one_minus_forget_q610 = sub_q610(q_t'(Q_ONE), forget_gate_q610);
      retained_q610 = mul_q610(forget_gate_q610, lane_read(cx_before, lane));
      injected_q610 = mul_q610(one_minus_forget_q610, cell_preact_q610);
      cy_q610 = add_q610(retained_q610, injected_q610);
      cy_q610 = add_q610(mul_q610(cy_q610, bn_mul_value), bn_add_value);
      hy_q610 = step_activation_q610(cy_q610);
      hx_word = lane_write(hx_word, lane, hy_q610);
      cx_word = lane_write(cx_word, lane, cy_q610);
      output_word = lane_write(output_word, lane, hy_q610);
    end
  endtask

  task automatic compute_expected(input int size, input int lane_base, output logic [1535:0] expected);
    acc_t common0;
    acc_t common1;
    logic [511:0] hx_word;
    logic [511:0] cx_word;
    logic [511:0] output_word;
    begin
      hx_word = hx_tile_in;
      cx_word = cx_tile_in;
      output_word = output_tile_in;
      common0 = row_input_sum(0, size) + row_recurrent_sum(0);
      common1 = row_input_sum(1, size) + row_recurrent_sum(1);
      apply_ref_lane(lane_base, common0, forget_bias[0], cell_bias[0], bn_mul[0], bn_add[0],
                     cx_tile_in, hx_word, cx_word, output_word);
      apply_ref_lane(lane_base + 1, common1, forget_bias[1], cell_bias[1], bn_mul[1], bn_add[1],
                     cx_tile_in, hx_word, cx_word, output_word);
      expected = {output_word, cx_word, hx_word};
    end
  endtask

  task automatic fill_scenario(input int unsigned seed, input int profile, input int size_value, input int lane_base);
    int tile;
    int lane;
    int index;
    begin
      input_size = size_value;
      hidden_lane_base = lane_base;
      hx_tile_in = '0;
      cx_tile_in = '0;
      output_tile_in = '0;
      for (tile = 0; tile < TILE_COUNT; tile = tile + 1) begin
        input_tiles[tile] = '0;
        prev_hx_tiles[tile] = '0;
        weight_ih[0][tile] = '0;
        weight_ih[1][tile] = '0;
        weight_hh[0][tile] = '0;
        weight_hh[1][tile] = '0;
        for (lane = 0; lane < TILE_LANES; lane = lane + 1) begin
          index = (tile * TILE_LANES) + lane;
          input_tiles[tile] = lane_write(input_tiles[tile], lane, pattern_q(seed, profile, index, 11));
          prev_hx_tiles[tile] = lane_write(prev_hx_tiles[tile], lane, pattern_q(seed, profile, index, 17));
          weight_ih[0][tile] = lane_write(weight_ih[0][tile], lane, pattern_q(seed, profile, index, 23));
          weight_ih[1][tile] = lane_write(weight_ih[1][tile], lane, pattern_q(seed, profile, index, 29));
          weight_hh[0][tile] = lane_write(weight_hh[0][tile], lane, pattern_q(seed, profile, index, 31));
          weight_hh[1][tile] = lane_write(weight_hh[1][tile], lane, pattern_q(seed, profile, index, 37));
          hx_tile_in = lane_write(hx_tile_in, lane, pattern_q(seed, profile, lane, 41));
          cx_tile_in = lane_write(cx_tile_in, lane, pattern_q(seed, profile, lane, 43));
          output_tile_in = lane_write(output_tile_in, lane, pattern_q(seed, profile, lane, 47));
        end
      end
      forget_bias[0] = pattern_q(seed, profile, 0, 53);
      forget_bias[1] = pattern_q(seed, profile, 1, 53);
      cell_bias[0] = pattern_q(seed, profile, 0, 59);
      cell_bias[1] = pattern_q(seed, profile, 1, 59);
      bn_mul[0] = pattern_q(seed, profile, 0, 61);
      bn_mul[1] = pattern_q(seed, profile, 1, 61);
      bn_add[0] = pattern_q(seed, profile, 0, 67);
      bn_add[1] = pattern_q(seed, profile, 1, 67);
    end
  endtask

  task automatic run_one(input int unsigned seed, input int profile, input int size_value, input int lane_base);
    logic [1535:0] expected;
    logic [1535:0] actual;
    int cycles;
    begin
      fill_scenario(seed, profile, size_value, lane_base);
      compute_expected(size_value, lane_base, expected);
      scenario_count++;
      @(posedge ap_clk);
      ap_start <= 1'b1;
      @(posedge ap_clk);
      ap_start <= 1'b0;
      cycles = 0;
      while (!ap_done && cycles < MAX_CYCLES) begin
        @(posedge ap_clk);
        cycles++;
      end
      if (!ap_done) begin
        timeout_count++;
        $display("TIMEOUT seed=%0d profile=%0d input_size=%0d lane_base=%0d", seed, profile, size_value, lane_base);
      end else begin
        element_count += 96;
        actual = {output_tile_out, cx_tile_out, hx_tile_out};
        if (!hx_tile_out_ap_vld || !cx_tile_out_ap_vld || !output_tile_out_ap_vld) begin
          mismatch_count++;
          if (mismatch_count <= 20) begin
            $display("VALID_MISMATCH seed=%0d profile=%0d input_size=%0d lane_base=%0d valid=%0b%0b%0b",
                     seed, profile, size_value, lane_base,
                     hx_tile_out_ap_vld, cx_tile_out_ap_vld, output_tile_out_ap_vld);
          end
        end else if (actual !== expected) begin
          mismatch_count++;
          if (mismatch_count <= 20) begin
            $display("MISMATCH seed=%0d profile=%0d input_size=%0d lane_base=%0d actual=%h expected=%h",
                     seed, profile, size_value, lane_base, actual, expected);
          end
        end
      end
      ap_continue <= 1'b1;
      @(posedge ap_clk);
      ap_continue <= 1'b0;
      @(posedge ap_clk);
    end
  endtask

  initial begin
    int seeds [0:7] = '{32'h1, 32'h5a17, 32'hc001d00d, 32'h12345678, 32'h89abcdef, 32'hfedcba98, 32'h31415926, 32'h27182818};
    int sizes [0:5] = '{0, 1, 38, 94, 158, 224};
    int lanes [0:3] = '{0, 2, 14, 30};
    int seed_index;
    int profile;
    int size_index;
    int lane_index;

    repeat (4) @(posedge ap_clk);
    ap_rst <= 1'b0;
    repeat (2) @(posedge ap_clk);

    for (seed_index = 0; seed_index < 8; seed_index = seed_index + 1) begin
      for (profile = 0; profile < 5; profile = profile + 1) begin
        for (size_index = 0; size_index < 6; size_index = size_index + 1) begin
          for (lane_index = 0; lane_index < 4; lane_index = lane_index + 1) begin
            run_one(seeds[seed_index], profile, sizes[size_index], lanes[lane_index]);
          end
        end
      end
    end

    $display("GSU_HIDDEN_GROUP_SCALAR_SUMMARY scenarios=%0d elements=%0d mismatches=%0d timeouts=%0d",
             scenario_count, element_count, mismatch_count, timeout_count);
    if ((mismatch_count == 0) && (timeout_count == 0)) begin
      $display("GSU_HIDDEN_GROUP_SCALAR_PASS");
      $finish;
    end
    $fatal(1, "GSU_HIDDEN_GROUP_SCALAR_FAIL");
  end
endmodule
