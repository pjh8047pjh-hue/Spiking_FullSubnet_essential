`timescale 1 ns / 1 ps

module SubbandRealtimeTopQ610Ip_hls_deadlock_idx13_monitor ( // for module SubbandRealtimeTopQ610Ip_SubbandRealtimeTopQ610Ip_inst.grp_p_anonymous_namespace_RunRealtimeProjectionBandRowCachedPackedFixedQ610_fu_465.grp_p_anonymous_namespace_CallExternalProjectionIpQ610_fu_1477
    input wire clock,
    input wire reset,
    input wire [11:0] axis_block_sigs,
    input wire [17:0] inst_idle_sigs,
    input wire [0:0] inst_block_sigs,
    output wire block
);

// signal declare
reg monitor_find_block;
wire idx15_block;
wire idx14_block;
wire sub_parallel_block;
wire all_sub_parallel_has_block;
wire all_sub_single_has_block;
wire cur_axis_has_block;
wire seq_is_axis_block;

assign block = monitor_find_block;
assign idx15_block = axis_block_sigs[10];
assign idx14_block = axis_block_sigs[9];
assign all_sub_parallel_has_block = 1'b0;
assign all_sub_single_has_block = 1'b0 | (idx15_block & (axis_block_sigs[10])) | (idx14_block & (axis_block_sigs[9]));
assign cur_axis_has_block = 1'b0 | axis_block_sigs[8];
assign seq_is_axis_block = all_sub_parallel_has_block | all_sub_single_has_block | cur_axis_has_block;

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_find_block <= 1'b0;
    else if (seq_is_axis_block == 1'b1)
        monitor_find_block <= 1'b1;
    else
        monitor_find_block <= 1'b0;
end


// instant sub module
endmodule
