`timescale 1 ns / 1 ps

// Thin wrapper reserved for Vitis HLS RTL-blackbox integration.
// The current verified core is SystemVerilog (gsu_layer_engine_rtl.sv). A
// production HLS blackbox should replace these flat vector ports with RAM_T2P
// ports in the JSON mapping so the top-level HLS interface remains unchanged.
module gsu_layer_engine_bb #(
    parameter HIDDEN_SIZE = 224,
    parameter MAX_FRAMES = 4,
    parameter MAX_SUBBANDS = 8,
    parameter HIDDEN_PAR = 2,
    parameter DOT_PAR = 32,
    parameter MAX_SEQUENCE_WORDS = MAX_FRAMES * MAX_SUBBANDS * HIDDEN_SIZE,
    parameter STATE_WORDS = MAX_SUBBANDS * HIDDEN_SIZE,
    parameter WEIGHT_WORDS = HIDDEN_SIZE * HIDDEN_SIZE,
    parameter BIAS_WORDS = 2 * HIDDEN_SIZE
) (
    input  wire ap_clk,
    input  wire ap_rst,
    input  wire ap_ce,
    input  wire ap_start,
    input  wire ap_continue,
    output wire ap_done,
    output wire ap_idle,
    output wire ap_ready
);
  assign ap_done = ap_start;
  assign ap_idle = ~ap_start;
  assign ap_ready = ap_start | ap_continue;
endmodule
