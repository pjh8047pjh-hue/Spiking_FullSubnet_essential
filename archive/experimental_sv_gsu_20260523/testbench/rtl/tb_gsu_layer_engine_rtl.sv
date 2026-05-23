`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module tb_gsu_layer_engine_rtl;
  localparam int HIDDEN_SIZE = 224;
  localparam int MAX_FRAMES = 4;
  localparam int MAX_SUBBANDS = 8;
  localparam int HIDDEN_PAR = 2;
  localparam int DOT_PAR = 32;
  localparam int MAX_SEQUENCE_WORDS = MAX_FRAMES * MAX_SUBBANDS * HIDDEN_SIZE;
  localparam int STATE_WORDS = MAX_SUBBANDS * HIDDEN_SIZE;
  localparam int WEIGHT_WORDS = HIDDEN_SIZE * HIDDEN_SIZE;
  localparam int BIAS_WORDS = 2 * HIDDEN_SIZE;
  localparam int MAX_CYCLES = 200000;

  logic ap_clk = 1'b0;
  logic ap_rst = 1'b1;
  logic ap_ce = 1'b1;
  logic ap_start = 1'b0;
  logic ap_continue = 1'b0;
  logic ap_done;
  logic ap_idle;
  logic ap_ready;
  logic [2:0] num_frames;
  logic [3:0] num_subbands;
  logic [7:0] input_size;

  q_t sequence_input [0:MAX_SEQUENCE_WORDS-1];
  q_t weight_ih [0:WEIGHT_WORDS-1];
  q_t weight_hh [0:WEIGHT_WORDS-1];
  q_t bias_ih [0:BIAS_WORDS-1];
  q_t bn_mul [0:HIDDEN_SIZE-1];
  q_t bn_add [0:HIDDEN_SIZE-1];
  q_t hx_state_in [0:STATE_WORDS-1];
  q_t cx_state_in [0:STATE_WORDS-1];
  q_t hx_state_out [0:STATE_WORDS-1];
  q_t cx_state_out [0:STATE_WORDS-1];
  q_t sequence_output [0:MAX_SEQUENCE_WORDS-1];

  q_t ref_hx [0:STATE_WORDS-1];
  q_t ref_cx [0:STATE_WORDS-1];
  q_t ref_output [0:MAX_SEQUENCE_WORDS-1];

  int scenario_count = 0;
  int mismatch_count = 0;
  int elements_checked = 0;
  int cycle_count = 0;

  gsu_layer_engine_rtl #(
      .HIDDEN_SIZE(HIDDEN_SIZE),
      .MAX_FRAMES(MAX_FRAMES),
      .MAX_SUBBANDS(MAX_SUBBANDS),
      .HIDDEN_PAR(HIDDEN_PAR),
      .DOT_PAR(DOT_PAR)
  ) dut (
      .ap_clk(ap_clk),
      .ap_rst(ap_rst),
      .ap_ce(ap_ce),
      .ap_start(ap_start),
      .ap_continue(ap_continue),
      .ap_done(ap_done),
      .ap_idle(ap_idle),
      .ap_ready(ap_ready),
      .num_frames(num_frames),
      .num_subbands(num_subbands),
      .input_size(input_size),
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

  function automatic q_t pattern_value(input int unsigned seed, input int profile, input int index, input int salt);
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

  task automatic check_equal(input string name, input int actual, input int expected);
    begin
      if (actual !== expected) begin
        $display("ARITH MISMATCH %s actual=%0d expected=%0d", name, actual, expected);
        mismatch_count++;
      end
    end
  endtask

  task automatic run_arithmetic_tests;
    begin
      check_equal("saturate_hi", saturate_int16(48'sd40000), 32767);
      check_equal("saturate_lo", saturate_int16(-48'sd40000), -32768);
      check_equal("round_pos", round_shift_right(48'sd1536, 10), 2);
      check_equal("round_neg", round_shift_right(-48'sd1536, 10), -2);
      check_equal("mul_one", mul_q610(q_t'(16'sd1024), q_t'(16'sd1024)), 1024);
      check_equal("mul_neg_one", mul_q610(q_t'(-16'sd1024), q_t'(16'sd1024)), -1024);
      check_equal("sigmoid_zero", sigmoid_pwl_q610(q_t'(16'sd0)), 512);
      check_equal("sigmoid_pos_256", sigmoid_pwl_q610(q_t'(16'sd256)), 576);
      check_equal("sigmoid_neg_256", sigmoid_pwl_q610(q_t'(-16'sd256)), 448);
      check_equal("sigmoid_hi_clamp", sigmoid_pwl_q610(q_t'(16'sd8192)), 1024);
      check_equal("sigmoid_lo_clamp", sigmoid_pwl_q610(q_t'(-16'sd8192)), 0);
      check_equal("step_pos", step_activation_q610(q_t'(16'sd0)), 1024);
      check_equal("step_neg", step_activation_q610(q_t'(-16'sd1)), 0);
    end
  endtask

  task automatic clear_arrays;
    int i;
    begin
      for (i = 0; i < MAX_SEQUENCE_WORDS; i = i + 1) begin
        sequence_input[i] = '0;
        sequence_output[i] = '0;
        ref_output[i] = '0;
      end
      for (i = 0; i < WEIGHT_WORDS; i = i + 1) begin
        weight_ih[i] = '0;
        weight_hh[i] = '0;
      end
      for (i = 0; i < BIAS_WORDS; i = i + 1) begin
        bias_ih[i] = '0;
      end
      for (i = 0; i < HIDDEN_SIZE; i = i + 1) begin
        bn_mul[i] = q_t'(Q_ONE);
        bn_add[i] = '0;
      end
      for (i = 0; i < STATE_WORDS; i = i + 1) begin
        hx_state_in[i] = '0;
        cx_state_in[i] = '0;
        hx_state_out[i] = '0;
        cx_state_out[i] = '0;
        ref_hx[i] = '0;
        ref_cx[i] = '0;
      end
    end
  endtask

  task automatic fill_scenario(input int unsigned seed, input int profile);
    int i;
    begin
      for (i = 0; i < MAX_SEQUENCE_WORDS; i = i + 1) begin
        sequence_input[i] = pattern_value(seed, profile, i, 11);
      end
      for (i = 0; i < WEIGHT_WORDS; i = i + 1) begin
        weight_ih[i] = pattern_value(seed, profile, i, 23);
        weight_hh[i] = (profile == 1) ? '0 : pattern_value(seed, profile, i, 37);
      end
      for (i = 0; i < BIAS_WORDS; i = i + 1) begin
        bias_ih[i] = pattern_value(seed, profile, i, 41);
      end
      for (i = 0; i < HIDDEN_SIZE; i = i + 1) begin
        if (profile == 3) begin
          bn_mul[i] = to_q(1024 + (((mix32(seed, i, 53) >> 25) & 7'h7f) - 64) * 4);
          bn_add[i] = to_q(((((mix32(seed, i, 59) >> 24) & 7'h7f) - 64) * 8));
        end else begin
          bn_mul[i] = q_t'(Q_ONE);
          bn_add[i] = '0;
        end
      end
      for (i = 0; i < STATE_WORDS; i = i + 1) begin
        hx_state_in[i] = pattern_value(seed, profile, i, 61);
        cx_state_in[i] = pattern_value(seed, profile, i, 67);
      end
    end
  endtask

  task automatic run_reference(input int frames, input int subbands, input int terms);
    int i;
    int frame;
    int subband;
    int hidden;
    int feature;
    int saddr;
    int oaddr;
    acc_t sum_q20;
    acc_t q_scale_q20;
    q_t prev_hx [0:HIDDEN_SIZE-1];
    q_t prev_cx [0:HIDDEN_SIZE-1];
    q_t forget_preact_q610;
    q_t cell_preact_q610;
    q_t forget_gate_q610;
    q_t one_minus_forget_q610;
    q_t retained_q610;
    q_t injected_q610;
    q_t cy_q610;
    q_t scaled_q610;
    begin
      for (i = 0; i < STATE_WORDS; i = i + 1) begin
        ref_hx[i] = hx_state_in[i];
        ref_cx[i] = cx_state_in[i];
      end

      q_scale_q20 = acc_t'(48'sd1 <<< Q_FRAC);
      for (frame = 0; frame < frames; frame = frame + 1) begin
        for (subband = 0; subband < subbands; subband = subband + 1) begin
          for (hidden = 0; hidden < HIDDEN_SIZE; hidden = hidden + 1) begin
            saddr = (subband * HIDDEN_SIZE) + hidden;
            prev_hx[hidden] = ref_hx[saddr];
            prev_cx[hidden] = ref_cx[saddr];
          end

          for (hidden = 0; hidden < HIDDEN_SIZE; hidden = hidden + 1) begin
            sum_q20 = 48'sd0;
            for (feature = 0; feature < terms; feature = feature + 1) begin
              oaddr = (((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + feature;
              sum_q20 = sum_q20 + mul_for_mac_q610(sequence_input[oaddr], weight_ih[(hidden * HIDDEN_SIZE) + feature]);
            end
            for (feature = 0; feature < HIDDEN_SIZE; feature = feature + 1) begin
              sum_q20 = sum_q20 + mul_for_mac_q610(prev_hx[feature], weight_hh[(hidden * HIDDEN_SIZE) + feature]);
            end
            forget_preact_q610 =
                saturate_int16(round_shift_right(sum_q20 + (acc_t'(bias_ih[hidden]) * q_scale_q20), Q_FRAC));
            cell_preact_q610 =
                saturate_int16(round_shift_right(sum_q20 + (acc_t'(bias_ih[HIDDEN_SIZE + hidden]) * q_scale_q20), Q_FRAC));
            forget_gate_q610 = sigmoid_pwl_q610(forget_preact_q610);
            one_minus_forget_q610 = sub_q610(q_t'(Q_ONE), forget_gate_q610);
            retained_q610 = mul_q610(forget_gate_q610, prev_cx[hidden]);
            injected_q610 = mul_q610(one_minus_forget_q610, cell_preact_q610);
            cy_q610 = add_q610(retained_q610, injected_q610);
            scaled_q610 = mul_q610(cy_q610, bn_mul[hidden]);
            cy_q610 = add_q610(scaled_q610, bn_add[hidden]);
            saddr = (subband * HIDDEN_SIZE) + hidden;
            oaddr = (((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + hidden;
            ref_cx[saddr] = cy_q610;
            ref_hx[saddr] = step_activation_q610(cy_q610);
            ref_output[oaddr] = ref_hx[saddr];
          end
        end
      end
    end
  endtask

  task automatic start_and_wait(input int max_cycles);
    int cycles;
    begin
      @(posedge ap_clk);
      ap_start <= 1'b1;
      @(posedge ap_clk);
      ap_start <= 1'b0;

      cycles = 0;
      while (!ap_done && cycles < max_cycles) begin
        @(posedge ap_clk);
        cycles++;
      end
      cycle_count = cycles;
      if (!ap_done) begin
        $display("TIMEOUT after %0d cycles", cycles);
        mismatch_count++;
      end
      ap_continue <= 1'b1;
      @(posedge ap_clk);
      ap_continue <= 1'b0;
      @(posedge ap_clk);
    end
  endtask

  task automatic compare_outputs(input int frames, input int subbands, input int seed, input int profile);
    int frame;
    int subband;
    int hidden;
    int idx;
    int printed;
    begin
      printed = 0;
      for (frame = 0; frame < frames; frame = frame + 1) begin
        for (subband = 0; subband < subbands; subband = subband + 1) begin
          for (hidden = 0; hidden < HIDDEN_SIZE; hidden = hidden + 1) begin
            idx = (((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + hidden;
            elements_checked++;
            if (sequence_output[idx] !== ref_output[idx]) begin
              mismatch_count++;
              if (printed < 8) begin
                $display("OUTPUT MISMATCH seed=%0d profile=%0d frame=%0d subband=%0d hidden=%0d actual=%0d expected=%0d",
                         seed, profile, frame, subband, hidden, sequence_output[idx], ref_output[idx]);
                printed++;
              end
            end
          end
        end
      end
      for (subband = 0; subband < subbands; subband = subband + 1) begin
        for (hidden = 0; hidden < HIDDEN_SIZE; hidden = hidden + 1) begin
          idx = (subband * HIDDEN_SIZE) + hidden;
          elements_checked += 2;
          if (hx_state_out[idx] !== ref_hx[idx]) begin
            mismatch_count++;
            if (printed < 8) begin
              $display("HX MISMATCH seed=%0d profile=%0d subband=%0d hidden=%0d actual=%0d expected=%0d",
                       seed, profile, subband, hidden, hx_state_out[idx], ref_hx[idx]);
              printed++;
            end
          end
          if (cx_state_out[idx] !== ref_cx[idx]) begin
            mismatch_count++;
            if (printed < 8) begin
              $display("CX MISMATCH seed=%0d profile=%0d subband=%0d hidden=%0d actual=%0d expected=%0d",
                       seed, profile, subband, hidden, cx_state_out[idx], ref_cx[idx]);
              printed++;
            end
          end
        end
      end
    end
  endtask

  task automatic run_scenario(
      input int unsigned seed,
      input int profile,
      input int frames,
      input int subbands,
      input int terms);
    begin
      clear_arrays();
      fill_scenario(seed, profile);
      num_frames = frames[2:0];
      num_subbands = subbands[3:0];
      input_size = terms[7:0];
      run_reference(frames, subbands, terms);
      start_and_wait(MAX_CYCLES);
      compare_outputs(frames, subbands, seed, profile);
      scenario_count++;
      $display("SCENARIO seed=%0d profile=%0d frames=%0d subbands=%0d input_size=%0d cycles=%0d mismatches=%0d",
               seed, profile, frames, subbands, terms, cycle_count, mismatch_count);
    end
  endtask

  initial begin
    int seed;
    int profile;

    clear_arrays();
    run_arithmetic_tests();

    repeat (5) @(posedge ap_clk);
    ap_rst = 1'b0;
    repeat (2) @(posedge ap_clk);

    run_scenario(99, 0, 0, 8, 38);
    run_scenario(100, 1, 4, 0, 94);
    run_scenario(101, 2, 1, 1, 1);
    run_scenario(102, 3, 1, 1, 0);

    for (seed = 1; seed <= 4; seed = seed + 1) begin
      for (profile = 0; profile < 5; profile = profile + 1) begin
        run_scenario(seed, profile, 4, 8, 38);
        run_scenario(seed + 17, profile, 4, 3, 94);
        run_scenario(seed + 31, profile, 4, 2, 158);
        run_scenario(seed + 43, profile, 2, 8, 224);
      end
    end

    $display("GSU_LAYER_RTL_SUMMARY scenarios=%0d elements_checked=%0d mismatches=%0d",
             scenario_count, elements_checked, mismatch_count);
    if (mismatch_count == 0) begin
      $display("GSU layer RTL unit/function test PASS");
      $finish;
    end
    $fatal(1, "GSU layer RTL unit/function test FAILED");
  end
endmodule
