
wire kernel_monitor_reset;
wire kernel_monitor_clock;
wire kernel_monitor_report;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
assign kernel_monitor_report = 1'b0;
wire [2:0] axis_block_sigs;
wire [5:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84.noisy_fft_stream_TDATA_blk_n;
assign axis_block_sigs[1] = ~grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99.fb_fft_stream_TDATA_blk_n;
assign axis_block_sigs[2] = ~grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_fu_409.grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78.df_coef_stream_TDATA_blk_n;

assign inst_block_sigs[0] = 1'b0;

assign inst_idle_sigs[0] = 1'b0;
assign inst_idle_sigs[1] = grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252.ap_idle;
assign inst_idle_sigs[2] = grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84.ap_idle;
assign inst_idle_sigs[3] = grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252.grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99.ap_idle;
assign inst_idle_sigs[4] = grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_fu_409.ap_idle;
assign inst_idle_sigs[5] = grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_fu_409.grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78.ap_idle;

SubbandRealtimeTopQ610Ip_hls_deadlock_idx0_monitor SubbandRealtimeTopQ610Ip_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);


always @ (kernel_block or kernel_monitor_reset) begin
    if (kernel_block == 1'b1 && kernel_monitor_reset == 1'b0) begin
        find_kernel_block = 1'b1;
    end
    else begin
        find_kernel_block = 1'b0;
    end
end
