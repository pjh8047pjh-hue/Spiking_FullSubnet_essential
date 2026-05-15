; ModuleID = 'H:/subband_q610_realtime_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<256>" = type { %"struct.ap_int_base<256, false>" }
%"struct.ap_int_base<256, false>" = type { %"struct.ssdm_int<256, false>" }
%"struct.ssdm_int<256, false>" = type { i256 }
%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" = type { %"struct.hls::axis<ap_uint<16>, 0, 0, 0, '8', false>" }
%"struct.hls::axis<ap_uint<16>, 0, 0, 0, '8', false>" = type { %"struct.ap_int<16>", %"struct.ap_uint<2>", %"struct.ap_uint<2>", %"class.std::ios_base::Init", %"struct.ap_uint<1>", %"class.std::ios_base::Init", %"class.std::ios_base::Init" }
%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }
%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"class.std::ios_base::Init" = type { i8 }

; Function Attrs: noinline
define void @apatb_SubbandRealtimeTopQ610Ip_ir(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias nonnull dereferenceable(8) %noisy_fft_stream, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias nonnull dereferenceable(8) %fb_fft_stream, %"struct.ap_uint<256>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="43031" "maxi" %weights_q610, i32 %num_frames, i1 zeroext %reset_state, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias nonnull dereferenceable(8) %df_coef_stream) local_unnamed_addr #0 {
entry:
  %noisy_fft_stream_copy.data = alloca i16, align 512
  %noisy_fft_stream_copy.keep = alloca i2, align 512
  %noisy_fft_stream_copy.strb = alloca i2, align 512
  %noisy_fft_stream_copy.last = alloca i1, align 512
  %fb_fft_stream_copy.data = alloca i16, align 512
  %fb_fft_stream_copy.keep = alloca i2, align 512
  %fb_fft_stream_copy.strb = alloca i2, align 512
  %fb_fft_stream_copy.last = alloca i1, align 512
  %malloccall = call i8* @malloc(i64 1376992)
  %weights_q610_copy = bitcast i8* %malloccall to [43031 x i256]*
  %df_coef_stream_copy.data = alloca i16, align 512
  %df_coef_stream_copy.keep = alloca i2, align 512
  %df_coef_stream_copy.strb = alloca i2, align 512
  %df_coef_stream_copy.last = alloca i1, align 512
  %0 = bitcast %"struct.ap_uint<256>"* %weights_q610 to [43031 x %"struct.ap_uint<256>"]*
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* nonnull %noisy_fft_stream, i16* nonnull align 512 %noisy_fft_stream_copy.data, i2* nonnull align 512 %noisy_fft_stream_copy.keep, i2* nonnull align 512 %noisy_fft_stream_copy.strb, i1* nonnull align 512 %noisy_fft_stream_copy.last, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* nonnull %fb_fft_stream, i16* nonnull align 512 %fb_fft_stream_copy.data, i2* nonnull align 512 %fb_fft_stream_copy.keep, i2* nonnull align 512 %fb_fft_stream_copy.strb, i1* nonnull align 512 %fb_fft_stream_copy.last, [43031 x %"struct.ap_uint<256>"]* nonnull %0, [43031 x i256]* %weights_q610_copy, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* nonnull %df_coef_stream, i16* nonnull align 512 %df_coef_stream_copy.data, i2* nonnull align 512 %df_coef_stream_copy.keep, i2* nonnull align 512 %df_coef_stream_copy.strb, i1* nonnull align 512 %df_coef_stream_copy.last)
  call void @apatb_SubbandRealtimeTopQ610Ip_hw(i16* %noisy_fft_stream_copy.data, i2* %noisy_fft_stream_copy.keep, i2* %noisy_fft_stream_copy.strb, i1* %noisy_fft_stream_copy.last, i16* %fb_fft_stream_copy.data, i2* %fb_fft_stream_copy.keep, i2* %fb_fft_stream_copy.strb, i1* %fb_fft_stream_copy.last, [43031 x i256]* %weights_q610_copy, i32 %num_frames, i1 %reset_state, i16* %df_coef_stream_copy.data, i2* %df_coef_stream_copy.keep, i2* %df_coef_stream_copy.strb, i1* %df_coef_stream_copy.last)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %noisy_fft_stream, i16* %noisy_fft_stream_copy.data, i2* %noisy_fft_stream_copy.keep, i2* %noisy_fft_stream_copy.strb, i1* %noisy_fft_stream_copy.last, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %fb_fft_stream, i16* %fb_fft_stream_copy.data, i2* %fb_fft_stream_copy.keep, i2* %fb_fft_stream_copy.strb, i1* %fb_fft_stream_copy.last, [43031 x %"struct.ap_uint<256>"]* %0, [43031 x i256]* %weights_q610_copy, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %df_coef_stream, i16* %df_coef_stream_copy.data, i2* %df_coef_stream_copy.keep, i2* %df_coef_stream_copy.strb, i1* %df_coef_stream_copy.last)
  call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="0", i16* noalias align 512 "unpacked"="1.0" %_V_data_V, i2* noalias align 512 "unpacked"="1.1" %_V_keep_V, i2* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="2", i16* noalias align 512 "unpacked"="3.0" %_V_data_V1, i2* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i2* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_last_V4, [43031 x %"struct.ap_uint<256>"]* noalias readonly "unpacked"="4", [43031 x i256]* noalias nocapture "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="6", i16* noalias align 512 "unpacked"="7.0" %_V_data_V15, i2* noalias align 512 "unpacked"="7.1" %_V_keep_V26, i2* noalias align 512 "unpacked"="7.2" %_V_strb_V37, i1* noalias align 512 "unpacked"="7.3" %_V_last_V48) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.430"(i16* align 512 %_V_data_V, i2* align 512 %_V_keep_V, i2* align 512 %_V_strb_V, i1* align 512 %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.430"(i16* align 512 %_V_data_V1, i2* align 512 %_V_keep_V2, i2* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %1)
  call fastcc void @"onebyonecpy_hls.p0a43031struct.ap_uint<256>"([43031 x i256]* %3, [43031 x %"struct.ap_uint<256>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.430"(i16* align 512 %_V_data_V15, i2* align 512 %_V_keep_V26, i2* align 512 %_V_strb_V37, i1* align 512 %_V_last_V48, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a43031struct.ap_uint<256>"([43031 x i256]* noalias nocapture "unpacked"="0.0" %dst, [43031 x %"struct.ap_uint<256>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [43031 x %"struct.ap_uint<256>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a43031struct.ap_uint<256>"([43031 x i256]* %dst, [43031 x %"struct.ap_uint<256>"]* nonnull %src, i64 43031)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a43031struct.ap_uint<256>"([43031 x i256]* nocapture "unpacked"="0.0" %dst, [43031 x %"struct.ap_uint<256>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [43031 x %"struct.ap_uint<256>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [43031 x %"struct.ap_uint<256>"], [43031 x %"struct.ap_uint<256>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [43031 x i256], [43031 x i256]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i256, i256* %src.addr.0.0.05, align 32
  store i256 %1, i256* %dst.addr.0.0.06, align 32
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="0", i16* noalias align 512 "unpacked"="1.0" %_V_data_V, i2* noalias align 512 "unpacked"="1.1" %_V_keep_V, i2* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="2", i16* noalias align 512 "unpacked"="3.0" %_V_data_V1, i2* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i2* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_last_V4, [43031 x %"struct.ap_uint<256>"]* noalias "unpacked"="4", [43031 x i256]* noalias nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="6", i16* noalias align 512 "unpacked"="7.0" %_V_data_V15, i2* noalias align 512 "unpacked"="7.1" %_V_keep_V26, i2* noalias align 512 "unpacked"="7.2" %_V_strb_V37, i1* noalias align 512 "unpacked"="7.3" %_V_last_V48) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0, i16* align 512 %_V_data_V, i2* align 512 %_V_keep_V, i2* align 512 %_V_strb_V, i1* align 512 %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %1, i16* align 512 %_V_data_V1, i2* align 512 %_V_keep_V2, i2* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4)
  call fastcc void @"onebyonecpy_hls.p0a43031struct.ap_uint<256>.364"([43031 x %"struct.ap_uint<256>"]* %2, [43031 x i256]* %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %4, i16* align 512 %_V_data_V15, i2* align 512 %_V_keep_V26, i2* align 512 %_V_strb_V37, i1* align 512 %_V_last_V48)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a43031struct.ap_uint<256>.364"([43031 x %"struct.ap_uint<256>"]* noalias "unpacked"="0" %dst, [43031 x i256]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [43031 x %"struct.ap_uint<256>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a43031struct.ap_uint<256>.367"([43031 x %"struct.ap_uint<256>"]* nonnull %dst, [43031 x i256]* %src, i64 43031)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a43031struct.ap_uint<256>.367"([43031 x %"struct.ap_uint<256>"]* "unpacked"="0" %dst, [43031 x i256]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [43031 x %"struct.ap_uint<256>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [43031 x i256], [43031 x i256]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [43031 x %"struct.ap_uint<256>"], [43031 x %"struct.ap_uint<256>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i256, i256* %src.addr.0.0.05, align 32
  store i256 %1, i256* %dst.addr.0.0.06, align 32
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.430"(i16* noalias align 512 "unpacked"="0.0" %dst_V_data_V, i2* noalias align 512 "unpacked"="0.1" %dst_V_keep_V, i2* noalias align 512 "unpacked"="0.2" %dst_V_strb_V, i1* noalias align 512 "unpacked"="0.3" %dst_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias %src) unnamed_addr #5 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.433"(i16* align 512 %dst_V_data_V, i2* align 512 %dst_V_keep_V, i2* align 512 %dst_V_strb_V, i1* align 512 %dst_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.433"(i16* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, i2* noalias nocapture align 512 "unpacked"="0.1" %_V_keep_V, i2* noalias nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias nocapture) unnamed_addr #6 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"
  %2 = alloca i16
  %3 = alloca i2
  %4 = alloca i2
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  %7 = call i1 @fpga_fifo_not_empty_8(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %1 to i8*
  %9 = bitcast %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_8(i8* %8, i8* %9)
  %10 = load volatile %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %10, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %10, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %10, 0, 2, 0, 0, 0
  %.fca.0.4.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %10, 0, 4, 0, 0, 0
  store i16 %.fca.0.0.0.0.0.extract, i16* %2
  %11 = bitcast i16* %2 to i8*
  %12 = bitcast i16* %_V_data_V to i8*
  call void @fpga_fifo_push_2(i8* %11, i8* %12)
  store i2 %.fca.0.1.0.0.0.extract, i2* %4
  %13 = bitcast i2* %4 to i8*
  %14 = bitcast i2* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %13, i8* %14)
  store i2 %.fca.0.2.0.0.0.extract, i2* %3
  %15 = bitcast i2* %3 to i8*
  %16 = bitcast i2* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %15, i8* %16)
  store i1 %.fca.0.4.0.0.0.extract, i1* %5
  %17 = bitcast i1* %5 to i8*
  %18 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %17, i8* %18)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias %dst, i16* noalias align 512 "unpacked"="1.0" %src_V_data_V, i2* noalias align 512 "unpacked"="1.1" %src_V_keep_V, i2* noalias align 512 "unpacked"="1.2" %src_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %src_V_last_V) unnamed_addr #5 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.440"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* nonnull %dst, i16* align 512 %src_V_data_V, i2* align 512 %src_V_keep_V, i2* align 512 %src_V_strb_V, i1* align 512 %src_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>.440"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias nocapture, i16* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V, i2* noalias nocapture align 512 "unpacked"="1.1" %_V_keep_V, i2* noalias nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="1.3" %_V_last_V) unnamed_addr #6 {
entry:
  %1 = alloca i16
  %2 = alloca i2
  %3 = alloca i2
  %4 = alloca i1
  %5 = alloca %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast i16* %_V_data_V to i8*
  %7 = call i1 @fpga_fifo_not_empty_2(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast i16* %1 to i8*
  %9 = bitcast i16* %_V_data_V to i8*
  call void @fpga_fifo_pop_2(i8* %8, i8* %9)
  %10 = load volatile i16, i16* %1
  %11 = bitcast i2* %3 to i8*
  %12 = bitcast i2* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %11, i8* %12)
  %13 = bitcast i2* %3 to i8*
  %14 = load i8, i8* %13
  %15 = trunc i8 %14 to i2
  %16 = bitcast i2* %2 to i8*
  %17 = bitcast i2* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %16, i8* %17)
  %18 = bitcast i2* %2 to i8*
  %19 = load i8, i8* %18
  %20 = trunc i8 %19 to i2
  %21 = bitcast i1* %4 to i8*
  %22 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %21, i8* %22)
  %23 = bitcast i1* %4 to i8*
  %24 = load i8, i8* %23
  %25 = trunc i8 %24 to i1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" undef, i16 %10, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %.fca.0.0.0.0.0.insert, i2 %15, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %.fca.0.1.0.0.0.insert, i2 %20, 0, 2, 0, 0, 0
  %.fca.0.4.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %.fca.0.2.0.0.0.insert, i1 %25, 0, 4, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>" %.fca.0.4.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %5
  %26 = bitcast %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %5 to i8*
  %27 = bitcast %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_SubbandRealtimeTopQ610Ip_hw(i16*, i2*, i2*, i1*, i16*, i2*, i2*, i1*, [43031 x i256]*, i32, i1, i16*, i2*, i2*, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="0", i16* noalias align 512 "unpacked"="1.0" %_V_data_V, i2* noalias align 512 "unpacked"="1.1" %_V_keep_V, i2* noalias align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="2", i16* noalias align 512 "unpacked"="3.0" %_V_data_V1, i2* noalias align 512 "unpacked"="3.1" %_V_keep_V2, i2* noalias align 512 "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "unpacked"="3.3" %_V_last_V4, [43031 x %"struct.ap_uint<256>"]* noalias "unpacked"="4", [43031 x i256]* noalias nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* noalias "unpacked"="6", i16* noalias align 512 "unpacked"="7.0" %_V_data_V15, i2* noalias align 512 "unpacked"="7.1" %_V_keep_V26, i2* noalias align 512 "unpacked"="7.2" %_V_strb_V37, i1* noalias align 512 "unpacked"="7.3" %_V_last_V48) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %0, i16* align 512 %_V_data_V, i2* align 512 %_V_keep_V, i2* align 512 %_V_strb_V, i1* align 512 %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %1, i16* align 512 %_V_data_V1, i2* align 512 %_V_keep_V2, i2* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %4, i16* align 512 %_V_data_V15, i2* align 512 %_V_keep_V26, i2* align 512 %_V_strb_V37, i1* align 512 %_V_last_V48)
  ret void
}

define void @SubbandRealtimeTopQ610Ip_hw_stub_wrapper(i16*, i2*, i2*, i1*, i16*, i2*, i2*, i1*, [43031 x i256]*, i32, i1, i16*, i2*, i2*, i1*) #7 {
entry:
  %15 = alloca %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"
  %16 = alloca %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"
  %malloccall = tail call i8* @malloc(i64 1376992)
  %17 = bitcast i8* %malloccall to [43031 x %"struct.ap_uint<256>"]*
  %18 = alloca %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %15, i16* %0, i2* %1, i2* %2, i1* %3, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %16, i16* %4, i2* %5, i2* %6, i1* %7, [43031 x %"struct.ap_uint<256>"]* %17, [43031 x i256]* %8, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %18, i16* %11, i2* %12, i2* %13, i1* %14)
  %19 = bitcast [43031 x %"struct.ap_uint<256>"]* %17 to %"struct.ap_uint<256>"*
  call void @SubbandRealtimeTopQ610Ip_hw_stub(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %15, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %16, %"struct.ap_uint<256>"* %19, i32 %9, i1 %10, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %18)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %15, i16* %0, i2* %1, i2* %2, i1* %3, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %16, i16* %4, i2* %5, i2* %6, i1* %7, [43031 x %"struct.ap_uint<256>"]* %17, [43031 x i256]* %8, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"* %18, i16* %11, i2* %12, i2* %13, i1* %14)
  ret void
}

declare void @SubbandRealtimeTopQ610Ip_hw_stub(%"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"*, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"*, %"struct.ap_uint<256>"*, i32, i1, %"class.hls::stream<hls::axis<ap_uint<16>, 0, 0, 0, '8', false>, 0>"*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
