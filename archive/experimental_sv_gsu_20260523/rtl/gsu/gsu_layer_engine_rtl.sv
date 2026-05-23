`timescale 1 ns / 1 ps

import gsu_q610_pkg::*;

module gsu_layer_engine_rtl #(
    parameter int HIDDEN_SIZE = 224,
    parameter int MAX_FRAMES = 4,
    parameter int MAX_SUBBANDS = 8,
    parameter int HIDDEN_PAR = 2,
    parameter int DOT_PAR = 32,
    parameter int MAX_SEQUENCE_WORDS = MAX_FRAMES * MAX_SUBBANDS * HIDDEN_SIZE,
    parameter int STATE_WORDS = MAX_SUBBANDS * HIDDEN_SIZE,
    parameter int WEIGHT_WORDS = HIDDEN_SIZE * HIDDEN_SIZE,
    parameter int BIAS_WORDS = 2 * HIDDEN_SIZE
) (
    input  logic ap_clk,
    input  logic ap_rst,
    input  logic ap_ce,
    input  logic ap_start,
    input  logic ap_continue,
    output logic ap_done,
    output logic ap_idle,
    output logic ap_ready,

    input  logic [2:0] num_frames,
    input  logic [3:0] num_subbands,
    input  logic [7:0] input_size,

    input  q_t sequence_input  [0:MAX_SEQUENCE_WORDS-1],
    input  q_t weight_ih       [0:WEIGHT_WORDS-1],
    input  q_t weight_hh       [0:WEIGHT_WORDS-1],
    input  q_t bias_ih         [0:BIAS_WORDS-1],
    input  q_t bn_mul          [0:HIDDEN_SIZE-1],
    input  q_t bn_add          [0:HIDDEN_SIZE-1],
    input  q_t hx_state_in     [0:STATE_WORDS-1],
    input  q_t cx_state_in     [0:STATE_WORDS-1],
    output q_t hx_state_out    [0:STATE_WORDS-1],
    output q_t cx_state_out    [0:STATE_WORDS-1],
    output q_t sequence_output [0:MAX_SEQUENCE_WORDS-1]
);
  localparam int HIDDEN_GROUPS = HIDDEN_SIZE / HIDDEN_PAR;
  localparam int DOT_TILES = HIDDEN_SIZE / DOT_PAR;

  typedef enum logic [3:0] {
    ST_IDLE,
    ST_COPY_STATE,
    ST_SNAPSHOT,
    ST_MAC_INIT,
    ST_MAC_TILE,
    ST_GATE,
    ST_ADVANCE,
    ST_DONE
  } state_t;

  state_t state;
  int frame_index;
  int subband_index;
  int hidden_base;
  int copy_index;
  int snapshot_base;
  int dot_tile;

  q_t prev_hx [0:HIDDEN_SIZE-1];
  q_t prev_cx [0:HIDDEN_SIZE-1];
  acc_t common_sum [0:HIDDEN_PAR-1];
  acc_t mac_next [0:HIDDEN_PAR-1];
  q_t gate_cy [0:HIDDEN_PAR-1];
  q_t gate_hy [0:HIDDEN_PAR-1];

  function automatic int state_addr(input int subband, input int hidden);
    return (subband * HIDDEN_SIZE) + hidden;
  endfunction

  function automatic int seq_addr(input int frame, input int subband, input int feature);
    return (((frame * MAX_SUBBANDS) + subband) * HIDDEN_SIZE) + feature;
  endfunction

  function automatic int weight_addr(input int hidden, input int feature);
    return (hidden * HIDDEN_SIZE) + feature;
  endfunction

  always_comb begin
    int hb;
    int lane;
    int hidden;
    int feature;
    int saddr;
    int iaddr;
    int waddr;

    for (hb = 0; hb < HIDDEN_PAR; hb = hb + 1) begin
      mac_next[hb] = common_sum[hb];
    end

    for (hb = 0; hb < HIDDEN_PAR; hb = hb + 1) begin
      hidden = hidden_base + hb;
      for (lane = 0; lane < DOT_PAR; lane = lane + 1) begin
        feature = (dot_tile * DOT_PAR) + lane;
        if (feature < input_size) begin
          iaddr = seq_addr(frame_index, subband_index, feature);
          waddr = weight_addr(hidden, feature);
          mac_next[hb] = mac_next[hb] + mul_for_mac_q610(sequence_input[iaddr], weight_ih[waddr]);
        end
        saddr = feature;
        waddr = weight_addr(hidden, feature);
        mac_next[hb] = mac_next[hb] + mul_for_mac_q610(prev_hx[saddr], weight_hh[waddr]);
      end
    end
  end

  always_comb begin
    int hb;
    int hidden;
    int saddr;
    acc_t q_scale_q20;
    acc_t forget_q20;
    acc_t cell_q20;
    q_t forget_preact_q610;
    q_t cell_preact_q610;
    q_t forget_gate_q610;
    q_t one_minus_forget_q610;
    q_t retained_q610;
    q_t injected_q610;
    q_t cy_q610;
    q_t scaled_q610;

    q_scale_q20 = acc_t'(48'sd1 <<< Q_FRAC);
    for (hb = 0; hb < HIDDEN_PAR; hb = hb + 1) begin
      hidden = hidden_base + hb;
      saddr = state_addr(subband_index, hidden);
      forget_q20 = common_sum[hb] + (acc_t'(bias_ih[hidden]) * q_scale_q20);
      cell_q20 = common_sum[hb] + (acc_t'(bias_ih[HIDDEN_SIZE + hidden]) * q_scale_q20);
      forget_preact_q610 = saturate_int16(round_shift_right(forget_q20, Q_FRAC));
      cell_preact_q610 = saturate_int16(round_shift_right(cell_q20, Q_FRAC));
      forget_gate_q610 = sigmoid_pwl_q610(forget_preact_q610);
      one_minus_forget_q610 = sub_q610(q_t'(Q_ONE), forget_gate_q610);
      retained_q610 = mul_q610(forget_gate_q610, prev_cx[hidden]);
      injected_q610 = mul_q610(one_minus_forget_q610, cell_preact_q610);
      cy_q610 = add_q610(retained_q610, injected_q610);
      scaled_q610 = mul_q610(cy_q610, bn_mul[hidden]);
      gate_cy[hb] = add_q610(scaled_q610, bn_add[hidden]);
      gate_hy[hb] = step_activation_q610(gate_cy[hb]);
    end
  end

  always_ff @(posedge ap_clk) begin
    int lane;
    int idx;
    int hidden;
    int saddr;
    int oaddr;

    if (ap_rst) begin
      state <= ST_IDLE;
      frame_index <= 0;
      subband_index <= 0;
      hidden_base <= 0;
      copy_index <= 0;
      snapshot_base <= 0;
      dot_tile <= 0;
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      ap_idle <= 1'b1;
    end else if (ap_ce) begin
      ap_done <= 1'b0;
      ap_ready <= 1'b0;
      ap_idle <= (state == ST_IDLE);

      case (state)
        ST_IDLE: begin
          if (ap_start) begin
            frame_index <= 0;
            subband_index <= 0;
            hidden_base <= 0;
            copy_index <= 0;
            state <= ST_COPY_STATE;
            ap_idle <= 1'b0;
          end
        end

        ST_COPY_STATE: begin
          for (lane = 0; lane < HIDDEN_PAR; lane = lane + 1) begin
            idx = copy_index + lane;
            hx_state_out[idx] <= hx_state_in[idx];
            cx_state_out[idx] <= cx_state_in[idx];
          end
          if ((copy_index + HIDDEN_PAR) >= STATE_WORDS) begin
            if ((num_frames == 0) || (num_subbands == 0)) begin
              state <= ST_DONE;
            end else begin
              snapshot_base <= 0;
              state <= ST_SNAPSHOT;
            end
          end
          copy_index <= copy_index + HIDDEN_PAR;
        end

        ST_SNAPSHOT: begin
          for (lane = 0; lane < HIDDEN_PAR; lane = lane + 1) begin
            hidden = snapshot_base + lane;
            saddr = state_addr(subband_index, hidden);
            prev_hx[hidden] <= hx_state_out[saddr];
            prev_cx[hidden] <= cx_state_out[saddr];
          end
          if ((snapshot_base + HIDDEN_PAR) >= HIDDEN_SIZE) begin
            hidden_base <= 0;
            state <= ST_MAC_INIT;
          end
          snapshot_base <= snapshot_base + HIDDEN_PAR;
        end

        ST_MAC_INIT: begin
          for (lane = 0; lane < HIDDEN_PAR; lane = lane + 1) begin
            common_sum[lane] <= 48'sd0;
          end
          dot_tile <= 0;
          state <= ST_MAC_TILE;
        end

        ST_MAC_TILE: begin
          for (lane = 0; lane < HIDDEN_PAR; lane = lane + 1) begin
            common_sum[lane] <= mac_next[lane];
          end
          if ((dot_tile + 1) >= DOT_TILES) begin
            state <= ST_GATE;
          end
          dot_tile <= dot_tile + 1;
        end

        ST_GATE: begin
          for (lane = 0; lane < HIDDEN_PAR; lane = lane + 1) begin
            hidden = hidden_base + lane;
            saddr = state_addr(subband_index, hidden);
            oaddr = seq_addr(frame_index, subband_index, hidden);
            cx_state_out[saddr] <= gate_cy[lane];
            hx_state_out[saddr] <= gate_hy[lane];
            sequence_output[oaddr] <= gate_hy[lane];
          end
          state <= ST_ADVANCE;
        end

        ST_ADVANCE: begin
          if ((hidden_base + HIDDEN_PAR) < HIDDEN_SIZE) begin
            hidden_base <= hidden_base + HIDDEN_PAR;
            state <= ST_MAC_INIT;
          end else if ((subband_index + 1) < num_subbands) begin
            subband_index <= subband_index + 1;
            snapshot_base <= 0;
            state <= ST_SNAPSHOT;
          end else if ((frame_index + 1) < num_frames) begin
            frame_index <= frame_index + 1;
            subband_index <= 0;
            snapshot_base <= 0;
            state <= ST_SNAPSHOT;
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
