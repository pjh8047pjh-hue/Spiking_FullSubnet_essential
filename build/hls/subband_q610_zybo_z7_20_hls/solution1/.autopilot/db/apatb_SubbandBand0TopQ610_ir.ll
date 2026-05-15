; ModuleID = 'H:/subband_q610_zybo_z7_20_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline
define void @apatb_SubbandBand0TopQ610_ir(%"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="618240" "maxi" %noisy_input_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="618240" "maxi" %fb_output_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8512" "maxi" %layer0_weight_ih_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="50176" "maxi" %layer0_weight_hh_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="448" "maxi" %layer0_bias_ih_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %layer0_bn_mul_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %layer0_bn_add_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="50176" "maxi" %layer1_weight_ih_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="50176" "maxi" %layer1_weight_hh_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="448" "maxi" %layer1_bias_ih_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %layer1_bn_mul_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %layer1_bn_add_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8960" "maxi" %proj_weight_q610, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="40" "maxi" %proj_bias_q610, %"struct.ap_int<16>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="772800" "maxi" %df_coef_q610) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 1236480)
  %noisy_input_q610_copy = bitcast i8* %malloccall to [618240 x i16]*
  %malloccall1 = call i8* @malloc(i64 1236480)
  %fb_output_q610_copy = bitcast i8* %malloccall1 to [618240 x i16]*
  %malloccall2 = call i8* @malloc(i64 17024)
  %layer0_weight_ih_q610_copy = bitcast i8* %malloccall2 to [8512 x i16]*
  %malloccall3 = call i8* @malloc(i64 100352)
  %layer0_weight_hh_q610_copy = bitcast i8* %malloccall3 to [50176 x i16]*
  %layer0_bias_ih_q610_copy = alloca [448 x i16], align 512
  %layer0_bn_mul_q610_copy = alloca [224 x i16], align 512
  %layer0_bn_add_q610_copy = alloca [224 x i16], align 512
  %malloccall4 = call i8* @malloc(i64 100352)
  %layer1_weight_ih_q610_copy = bitcast i8* %malloccall4 to [50176 x i16]*
  %malloccall5 = call i8* @malloc(i64 100352)
  %layer1_weight_hh_q610_copy = bitcast i8* %malloccall5 to [50176 x i16]*
  %layer1_bias_ih_q610_copy = alloca [448 x i16], align 512
  %layer1_bn_mul_q610_copy = alloca [224 x i16], align 512
  %layer1_bn_add_q610_copy = alloca [224 x i16], align 512
  %malloccall6 = call i8* @malloc(i64 17920)
  %proj_weight_q610_copy = bitcast i8* %malloccall6 to [8960 x i16]*
  %proj_bias_q610_copy = alloca [40 x i16], align 512
  %malloccall7 = call i8* @malloc(i64 1545600)
  %df_coef_q610_copy = bitcast i8* %malloccall7 to [772800 x i16]*
  %0 = bitcast %"struct.ap_int<16>"* %noisy_input_q610 to [618240 x %"struct.ap_int<16>"]*
  %1 = bitcast %"struct.ap_int<16>"* %fb_output_q610 to [618240 x %"struct.ap_int<16>"]*
  %2 = bitcast %"struct.ap_int<16>"* %layer0_weight_ih_q610 to [8512 x %"struct.ap_int<16>"]*
  %3 = bitcast %"struct.ap_int<16>"* %layer0_weight_hh_q610 to [50176 x %"struct.ap_int<16>"]*
  %4 = bitcast %"struct.ap_int<16>"* %layer0_bias_ih_q610 to [448 x %"struct.ap_int<16>"]*
  %5 = bitcast %"struct.ap_int<16>"* %layer0_bn_mul_q610 to [224 x %"struct.ap_int<16>"]*
  %6 = bitcast %"struct.ap_int<16>"* %layer0_bn_add_q610 to [224 x %"struct.ap_int<16>"]*
  %7 = bitcast %"struct.ap_int<16>"* %layer1_weight_ih_q610 to [50176 x %"struct.ap_int<16>"]*
  %8 = bitcast %"struct.ap_int<16>"* %layer1_weight_hh_q610 to [50176 x %"struct.ap_int<16>"]*
  %9 = bitcast %"struct.ap_int<16>"* %layer1_bias_ih_q610 to [448 x %"struct.ap_int<16>"]*
  %10 = bitcast %"struct.ap_int<16>"* %layer1_bn_mul_q610 to [224 x %"struct.ap_int<16>"]*
  %11 = bitcast %"struct.ap_int<16>"* %layer1_bn_add_q610 to [224 x %"struct.ap_int<16>"]*
  %12 = bitcast %"struct.ap_int<16>"* %proj_weight_q610 to [8960 x %"struct.ap_int<16>"]*
  %13 = bitcast %"struct.ap_int<16>"* %proj_bias_q610 to [40 x %"struct.ap_int<16>"]*
  %14 = bitcast %"struct.ap_int<16>"* %df_coef_q610 to [772800 x %"struct.ap_int<16>"]*
  call fastcc void @copy_in([618240 x %"struct.ap_int<16>"]* nonnull %0, [618240 x i16]* %noisy_input_q610_copy, [618240 x %"struct.ap_int<16>"]* nonnull %1, [618240 x i16]* %fb_output_q610_copy, [8512 x %"struct.ap_int<16>"]* nonnull %2, [8512 x i16]* %layer0_weight_ih_q610_copy, [50176 x %"struct.ap_int<16>"]* nonnull %3, [50176 x i16]* %layer0_weight_hh_q610_copy, [448 x %"struct.ap_int<16>"]* nonnull %4, [448 x i16]* nonnull align 512 %layer0_bias_ih_q610_copy, [224 x %"struct.ap_int<16>"]* nonnull %5, [224 x i16]* nonnull align 512 %layer0_bn_mul_q610_copy, [224 x %"struct.ap_int<16>"]* nonnull %6, [224 x i16]* nonnull align 512 %layer0_bn_add_q610_copy, [50176 x %"struct.ap_int<16>"]* nonnull %7, [50176 x i16]* %layer1_weight_ih_q610_copy, [50176 x %"struct.ap_int<16>"]* nonnull %8, [50176 x i16]* %layer1_weight_hh_q610_copy, [448 x %"struct.ap_int<16>"]* nonnull %9, [448 x i16]* nonnull align 512 %layer1_bias_ih_q610_copy, [224 x %"struct.ap_int<16>"]* nonnull %10, [224 x i16]* nonnull align 512 %layer1_bn_mul_q610_copy, [224 x %"struct.ap_int<16>"]* nonnull %11, [224 x i16]* nonnull align 512 %layer1_bn_add_q610_copy, [8960 x %"struct.ap_int<16>"]* nonnull %12, [8960 x i16]* %proj_weight_q610_copy, [40 x %"struct.ap_int<16>"]* nonnull %13, [40 x i16]* nonnull align 512 %proj_bias_q610_copy, [772800 x %"struct.ap_int<16>"]* nonnull %14, [772800 x i16]* %df_coef_q610_copy)
  call void @apatb_SubbandBand0TopQ610_hw([618240 x i16]* %noisy_input_q610_copy, [618240 x i16]* %fb_output_q610_copy, [8512 x i16]* %layer0_weight_ih_q610_copy, [50176 x i16]* %layer0_weight_hh_q610_copy, [448 x i16]* %layer0_bias_ih_q610_copy, [224 x i16]* %layer0_bn_mul_q610_copy, [224 x i16]* %layer0_bn_add_q610_copy, [50176 x i16]* %layer1_weight_ih_q610_copy, [50176 x i16]* %layer1_weight_hh_q610_copy, [448 x i16]* %layer1_bias_ih_q610_copy, [224 x i16]* %layer1_bn_mul_q610_copy, [224 x i16]* %layer1_bn_add_q610_copy, [8960 x i16]* %proj_weight_q610_copy, [40 x i16]* %proj_bias_q610_copy, [772800 x i16]* %df_coef_q610_copy)
  call void @copy_back([618240 x %"struct.ap_int<16>"]* %0, [618240 x i16]* %noisy_input_q610_copy, [618240 x %"struct.ap_int<16>"]* %1, [618240 x i16]* %fb_output_q610_copy, [8512 x %"struct.ap_int<16>"]* %2, [8512 x i16]* %layer0_weight_ih_q610_copy, [50176 x %"struct.ap_int<16>"]* %3, [50176 x i16]* %layer0_weight_hh_q610_copy, [448 x %"struct.ap_int<16>"]* %4, [448 x i16]* %layer0_bias_ih_q610_copy, [224 x %"struct.ap_int<16>"]* %5, [224 x i16]* %layer0_bn_mul_q610_copy, [224 x %"struct.ap_int<16>"]* %6, [224 x i16]* %layer0_bn_add_q610_copy, [50176 x %"struct.ap_int<16>"]* %7, [50176 x i16]* %layer1_weight_ih_q610_copy, [50176 x %"struct.ap_int<16>"]* %8, [50176 x i16]* %layer1_weight_hh_q610_copy, [448 x %"struct.ap_int<16>"]* %9, [448 x i16]* %layer1_bias_ih_q610_copy, [224 x %"struct.ap_int<16>"]* %10, [224 x i16]* %layer1_bn_mul_q610_copy, [224 x %"struct.ap_int<16>"]* %11, [224 x i16]* %layer1_bn_add_q610_copy, [8960 x %"struct.ap_int<16>"]* %12, [8960 x i16]* %proj_weight_q610_copy, [40 x %"struct.ap_int<16>"]* %13, [40 x i16]* %proj_bias_q610_copy, [772800 x %"struct.ap_int<16>"]* %14, [772800 x i16]* %df_coef_q610_copy)
  call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  call void @free(i8* %malloccall2)
  call void @free(i8* %malloccall3)
  call void @free(i8* %malloccall4)
  call void @free(i8* %malloccall5)
  call void @free(i8* %malloccall6)
  call void @free(i8* %malloccall7)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([618240 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="0", [618240 x i16]* noalias nocapture "unpacked"="1.0", [618240 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="2", [618240 x i16]* noalias nocapture "unpacked"="3.0", [8512 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="4", [8512 x i16]* noalias nocapture "unpacked"="5.0", [50176 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="6", [50176 x i16]* noalias nocapture "unpacked"="7.0", [448 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="8", [448 x i16]* noalias nocapture align 512 "unpacked"="9.0", [224 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="10", [224 x i16]* noalias nocapture align 512 "unpacked"="11.0", [224 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="12", [224 x i16]* noalias nocapture align 512 "unpacked"="13.0", [50176 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="14", [50176 x i16]* noalias nocapture "unpacked"="15.0", [50176 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="16", [50176 x i16]* noalias nocapture "unpacked"="17.0", [448 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="18", [448 x i16]* noalias nocapture align 512 "unpacked"="19.0", [224 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="20", [224 x i16]* noalias nocapture align 512 "unpacked"="21.0", [224 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="22", [224 x i16]* noalias nocapture align 512 "unpacked"="23.0", [8960 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="24", [8960 x i16]* noalias nocapture "unpacked"="25.0", [40 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="26", [40 x i16]* noalias nocapture align 512 "unpacked"="27.0", [772800 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="28", [772800 x i16]* noalias nocapture "unpacked"="29.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>"([618240 x i16]* %1, [618240 x %"struct.ap_int<16>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>"([618240 x i16]* %3, [618240 x %"struct.ap_int<16>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a8512struct.ap_int<16>"([8512 x i16]* %5, [8512 x %"struct.ap_int<16>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>.321"([50176 x i16]* %7, [50176 x %"struct.ap_int<16>"]* %6)
  call fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>"([448 x i16]* align 512 %9, [448 x %"struct.ap_int<16>"]* %8)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>.272"([224 x i16]* align 512 %11, [224 x %"struct.ap_int<16>"]* %10)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>.272"([224 x i16]* align 512 %13, [224 x %"struct.ap_int<16>"]* %12)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>.321"([50176 x i16]* %15, [50176 x %"struct.ap_int<16>"]* %14)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>.321"([50176 x i16]* %17, [50176 x %"struct.ap_int<16>"]* %16)
  call fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>"([448 x i16]* align 512 %19, [448 x %"struct.ap_int<16>"]* %18)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>.272"([224 x i16]* align 512 %21, [224 x %"struct.ap_int<16>"]* %20)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>.272"([224 x i16]* align 512 %23, [224 x %"struct.ap_int<16>"]* %22)
  call fastcc void @"onebyonecpy_hls.p0a8960struct.ap_int<16>"([8960 x i16]* %25, [8960 x %"struct.ap_int<16>"]* %24)
  call fastcc void @"onebyonecpy_hls.p0a40struct.ap_int<16>.246"([40 x i16]* align 512 %27, [40 x %"struct.ap_int<16>"]* %26)
  call fastcc void @"onebyonecpy_hls.p0a772800struct.ap_int<16>"([772800 x i16]* %29, [772800 x %"struct.ap_int<16>"]* %28)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a8512struct.ap_int<16>"([8512 x i16]* noalias nocapture "unpacked"="0.0" %dst, [8512 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8512 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a8512struct.ap_int<16>"([8512 x i16]* %dst, [8512 x %"struct.ap_int<16>"]* nonnull %src, i64 8512)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a8512struct.ap_int<16>"([8512 x i16]* nocapture "unpacked"="0.0" %dst, [8512 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8512 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [8512 x %"struct.ap_int<16>"], [8512 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [8512 x i16], [8512 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a50176struct.ap_int<16>"([50176 x %"struct.ap_int<16>"]* %dst, [50176 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [50176 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [50176 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [50176 x %"struct.ap_int<16>"], [50176 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [50176 x %"struct.ap_int<16>"], [50176 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %3, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a448struct.ap_int<16>"([448 x %"struct.ap_int<16>"]* %dst, [448 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [448 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [448 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [448 x %"struct.ap_int<16>"], [448 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [448 x %"struct.ap_int<16>"], [448 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %3, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* %dst, [224 x %"struct.ap_int<16>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x %"struct.ap_int<16>"]* %src, null
  %1 = icmp eq [224 x %"struct.ap_int<16>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [224 x %"struct.ap_int<16>"], [224 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [224 x %"struct.ap_int<16>"], [224 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %3, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a8960struct.ap_int<16>"([8960 x i16]* noalias nocapture "unpacked"="0.0" %dst, [8960 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8960 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a8960struct.ap_int<16>"([8960 x i16]* %dst, [8960 x %"struct.ap_int<16>"]* nonnull %src, i64 8960)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a8960struct.ap_int<16>"([8960 x i16]* nocapture "unpacked"="0.0" %dst, [8960 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8960 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [8960 x %"struct.ap_int<16>"], [8960 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [8960 x i16], [8960 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a40struct.ap_int<16>"([40 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [40 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [40 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a40struct.ap_int<16>"([40 x %"struct.ap_int<16>"]* nonnull %dst, [40 x i16]* %src, i64 40)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a40struct.ap_int<16>"([40 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [40 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [40 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [40 x i16], [40 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [40 x %"struct.ap_int<16>"], [40 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a772800struct.ap_int<16>"([772800 x i16]* noalias nocapture "unpacked"="0.0" %dst, [772800 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [772800 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a772800struct.ap_int<16>"([772800 x i16]* %dst, [772800 x %"struct.ap_int<16>"]* nonnull %src, i64 772800)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a772800struct.ap_int<16>"([772800 x i16]* nocapture "unpacked"="0.0" %dst, [772800 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [772800 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [772800 x %"struct.ap_int<16>"], [772800 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [772800 x i16], [772800 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([618240 x %"struct.ap_int<16>"]* noalias "unpacked"="0", [618240 x i16]* noalias nocapture readonly "unpacked"="1.0", [618240 x %"struct.ap_int<16>"]* noalias "unpacked"="2", [618240 x i16]* noalias nocapture readonly "unpacked"="3.0", [8512 x %"struct.ap_int<16>"]* noalias "unpacked"="4", [8512 x i16]* noalias nocapture readonly "unpacked"="5.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="6", [50176 x i16]* noalias nocapture readonly "unpacked"="7.0", [448 x %"struct.ap_int<16>"]* noalias "unpacked"="8", [448 x i16]* noalias nocapture readonly align 512 "unpacked"="9.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="10", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="11.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="12", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="13.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="14", [50176 x i16]* noalias nocapture readonly "unpacked"="15.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="16", [50176 x i16]* noalias nocapture readonly "unpacked"="17.0", [448 x %"struct.ap_int<16>"]* noalias "unpacked"="18", [448 x i16]* noalias nocapture readonly align 512 "unpacked"="19.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="20", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="21.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="22", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="23.0", [8960 x %"struct.ap_int<16>"]* noalias "unpacked"="24", [8960 x i16]* noalias nocapture readonly "unpacked"="25.0", [40 x %"struct.ap_int<16>"]* noalias "unpacked"="26", [40 x i16]* noalias nocapture readonly align 512 "unpacked"="27.0", [772800 x %"struct.ap_int<16>"]* noalias "unpacked"="28", [772800 x i16]* noalias nocapture readonly "unpacked"="29.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>.379"([618240 x %"struct.ap_int<16>"]* %0, [618240 x i16]* %1)
  call fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>.379"([618240 x %"struct.ap_int<16>"]* %2, [618240 x i16]* %3)
  call fastcc void @"onebyonecpy_hls.p0a8512struct.ap_int<16>.359"([8512 x %"struct.ap_int<16>"]* %4, [8512 x i16]* %5)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>"([50176 x %"struct.ap_int<16>"]* %6, [50176 x i16]* %7)
  call fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>.302"([448 x %"struct.ap_int<16>"]* %8, [448 x i16]* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* %10, [224 x i16]* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* %12, [224 x i16]* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>"([50176 x %"struct.ap_int<16>"]* %14, [50176 x i16]* %15)
  call fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>"([50176 x %"struct.ap_int<16>"]* %16, [50176 x i16]* %17)
  call fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>.302"([448 x %"struct.ap_int<16>"]* %18, [448 x i16]* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* %20, [224 x i16]* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* %22, [224 x i16]* align 512 %23)
  call fastcc void @"onebyonecpy_hls.p0a8960struct.ap_int<16>.259"([8960 x %"struct.ap_int<16>"]* %24, [8960 x i16]* %25)
  call fastcc void @"onebyonecpy_hls.p0a40struct.ap_int<16>"([40 x %"struct.ap_int<16>"]* %26, [40 x i16]* align 512 %27)
  call fastcc void @"onebyonecpy_hls.p0a772800struct.ap_int<16>.236"([772800 x %"struct.ap_int<16>"]* %28, [772800 x i16]* %29)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a772800struct.ap_int<16>.236"([772800 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [772800 x i16]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [772800 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a772800struct.ap_int<16>.239"([772800 x %"struct.ap_int<16>"]* nonnull %dst, [772800 x i16]* %src, i64 772800)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a772800struct.ap_int<16>.239"([772800 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [772800 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [772800 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [772800 x i16], [772800 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [772800 x %"struct.ap_int<16>"], [772800 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a40struct.ap_int<16>.246"([40 x i16]* noalias nocapture align 512 "unpacked"="0.0" %dst, [40 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [40 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a40struct.ap_int<16>.249"([40 x i16]* %dst, [40 x %"struct.ap_int<16>"]* nonnull %src, i64 40)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a40struct.ap_int<16>.249"([40 x i16]* nocapture "unpacked"="0.0" %dst, [40 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [40 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [40 x %"struct.ap_int<16>"], [40 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [40 x i16], [40 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a8960struct.ap_int<16>.259"([8960 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [8960 x i16]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8960 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a8960struct.ap_int<16>.262"([8960 x %"struct.ap_int<16>"]* nonnull %dst, [8960 x i16]* %src, i64 8960)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a8960struct.ap_int<16>.262"([8960 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [8960 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8960 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [8960 x i16], [8960 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [8960 x %"struct.ap_int<16>"], [8960 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>.272"([224 x i16]* noalias nocapture align 512 "unpacked"="0.0" %dst, [224 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [224 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a224struct.ap_int<16>.275"([224 x i16]* %dst, [224 x %"struct.ap_int<16>"]* nonnull %src, i64 224)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a224struct.ap_int<16>.275"([224 x i16]* nocapture "unpacked"="0.0" %dst, [224 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [224 x %"struct.ap_int<16>"], [224 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [224 x i16], [224 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a224struct.ap_int<16>"([224 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [224 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [224 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a224struct.ap_int<16>.282"([224 x %"struct.ap_int<16>"]* nonnull %dst, [224 x i16]* %src, i64 224)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a224struct.ap_int<16>.282"([224 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [224 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [224 x i16], [224 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [224 x %"struct.ap_int<16>"], [224 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>"([448 x i16]* noalias nocapture align 512 "unpacked"="0.0" %dst, [448 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [448 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a448struct.ap_int<16>.298"([448 x i16]* %dst, [448 x %"struct.ap_int<16>"]* nonnull %src, i64 448)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a448struct.ap_int<16>.298"([448 x i16]* nocapture "unpacked"="0.0" %dst, [448 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [448 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [448 x %"struct.ap_int<16>"], [448 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [448 x i16], [448 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a448struct.ap_int<16>.302"([448 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [448 x i16]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [448 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a448struct.ap_int<16>.305"([448 x %"struct.ap_int<16>"]* nonnull %dst, [448 x i16]* %src, i64 448)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a448struct.ap_int<16>.305"([448 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [448 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [448 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [448 x i16], [448 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [448 x %"struct.ap_int<16>"], [448 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>"([50176 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [50176 x i16]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [50176 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a50176struct.ap_int<16>.317"([50176 x %"struct.ap_int<16>"]* nonnull %dst, [50176 x i16]* %src, i64 50176)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a50176struct.ap_int<16>.317"([50176 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [50176 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [50176 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [50176 x i16], [50176 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [50176 x %"struct.ap_int<16>"], [50176 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a50176struct.ap_int<16>.321"([50176 x i16]* noalias nocapture "unpacked"="0.0" %dst, [50176 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [50176 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a50176struct.ap_int<16>.324"([50176 x i16]* %dst, [50176 x %"struct.ap_int<16>"]* nonnull %src, i64 50176)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a50176struct.ap_int<16>.324"([50176 x i16]* nocapture "unpacked"="0.0" %dst, [50176 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [50176 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [50176 x %"struct.ap_int<16>"], [50176 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [50176 x i16], [50176 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a8512struct.ap_int<16>.359"([8512 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [8512 x i16]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8512 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a8512struct.ap_int<16>.362"([8512 x %"struct.ap_int<16>"]* nonnull %dst, [8512 x i16]* %src, i64 8512)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a8512struct.ap_int<16>.362"([8512 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [8512 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8512 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [8512 x i16], [8512 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [8512 x %"struct.ap_int<16>"], [8512 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>"([618240 x i16]* noalias nocapture "unpacked"="0.0" %dst, [618240 x %"struct.ap_int<16>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [618240 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a618240struct.ap_int<16>.375"([618240 x i16]* %dst, [618240 x %"struct.ap_int<16>"]* nonnull %src, i64 618240)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a618240struct.ap_int<16>.375"([618240 x i16]* nocapture "unpacked"="0.0" %dst, [618240 x %"struct.ap_int<16>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [618240 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [618240 x %"struct.ap_int<16>"], [618240 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [618240 x i16], [618240 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a618240struct.ap_int<16>.379"([618240 x %"struct.ap_int<16>"]* noalias "unpacked"="0" %dst, [618240 x i16]* noalias nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [618240 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a618240struct.ap_int<16>.382"([618240 x %"struct.ap_int<16>"]* nonnull %dst, [618240 x i16]* %src, i64 618240)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a618240struct.ap_int<16>.382"([618240 x %"struct.ap_int<16>"]* "unpacked"="0" %dst, [618240 x i16]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [618240 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [618240 x i16], [618240 x i16]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [618240 x %"struct.ap_int<16>"], [618240 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %1, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_SubbandBand0TopQ610_hw([618240 x i16]*, [618240 x i16]*, [8512 x i16]*, [50176 x i16]*, [448 x i16]*, [224 x i16]*, [224 x i16]*, [50176 x i16]*, [50176 x i16]*, [448 x i16]*, [224 x i16]*, [224 x i16]*, [8960 x i16]*, [40 x i16]*, [772800 x i16]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([618240 x %"struct.ap_int<16>"]* noalias "unpacked"="0", [618240 x i16]* noalias nocapture readonly "unpacked"="1.0", [618240 x %"struct.ap_int<16>"]* noalias "unpacked"="2", [618240 x i16]* noalias nocapture readonly "unpacked"="3.0", [8512 x %"struct.ap_int<16>"]* noalias "unpacked"="4", [8512 x i16]* noalias nocapture readonly "unpacked"="5.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="6", [50176 x i16]* noalias nocapture readonly "unpacked"="7.0", [448 x %"struct.ap_int<16>"]* noalias "unpacked"="8", [448 x i16]* noalias nocapture readonly align 512 "unpacked"="9.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="10", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="11.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="12", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="13.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="14", [50176 x i16]* noalias nocapture readonly "unpacked"="15.0", [50176 x %"struct.ap_int<16>"]* noalias "unpacked"="16", [50176 x i16]* noalias nocapture readonly "unpacked"="17.0", [448 x %"struct.ap_int<16>"]* noalias "unpacked"="18", [448 x i16]* noalias nocapture readonly align 512 "unpacked"="19.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="20", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="21.0", [224 x %"struct.ap_int<16>"]* noalias "unpacked"="22", [224 x i16]* noalias nocapture readonly align 512 "unpacked"="23.0", [8960 x %"struct.ap_int<16>"]* noalias "unpacked"="24", [8960 x i16]* noalias nocapture readonly "unpacked"="25.0", [40 x %"struct.ap_int<16>"]* noalias "unpacked"="26", [40 x i16]* noalias nocapture readonly align 512 "unpacked"="27.0", [772800 x %"struct.ap_int<16>"]* noalias "unpacked"="28", [772800 x i16]* noalias nocapture readonly "unpacked"="29.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a772800struct.ap_int<16>.236"([772800 x %"struct.ap_int<16>"]* %28, [772800 x i16]* %29)
  ret void
}

define void @SubbandBand0TopQ610_hw_stub_wrapper([618240 x i16]*, [618240 x i16]*, [8512 x i16]*, [50176 x i16]*, [448 x i16]*, [224 x i16]*, [224 x i16]*, [50176 x i16]*, [50176 x i16]*, [448 x i16]*, [224 x i16]*, [224 x i16]*, [8960 x i16]*, [40 x i16]*, [772800 x i16]*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 1236480)
  %15 = bitcast i8* %malloccall to [618240 x %"struct.ap_int<16>"]*
  %malloccall1 = tail call i8* @malloc(i64 1236480)
  %16 = bitcast i8* %malloccall1 to [618240 x %"struct.ap_int<16>"]*
  %malloccall2 = tail call i8* @malloc(i64 17024)
  %17 = bitcast i8* %malloccall2 to [8512 x %"struct.ap_int<16>"]*
  %malloccall3 = tail call i8* @malloc(i64 100352)
  %18 = bitcast i8* %malloccall3 to [50176 x %"struct.ap_int<16>"]*
  %19 = alloca [448 x %"struct.ap_int<16>"]
  %20 = alloca [224 x %"struct.ap_int<16>"]
  %21 = alloca [224 x %"struct.ap_int<16>"]
  %malloccall4 = tail call i8* @malloc(i64 100352)
  %22 = bitcast i8* %malloccall4 to [50176 x %"struct.ap_int<16>"]*
  %malloccall5 = tail call i8* @malloc(i64 100352)
  %23 = bitcast i8* %malloccall5 to [50176 x %"struct.ap_int<16>"]*
  %24 = alloca [448 x %"struct.ap_int<16>"]
  %25 = alloca [224 x %"struct.ap_int<16>"]
  %26 = alloca [224 x %"struct.ap_int<16>"]
  %malloccall6 = tail call i8* @malloc(i64 17920)
  %27 = bitcast i8* %malloccall6 to [8960 x %"struct.ap_int<16>"]*
  %28 = alloca [40 x %"struct.ap_int<16>"]
  %malloccall7 = tail call i8* @malloc(i64 1545600)
  %29 = bitcast i8* %malloccall7 to [772800 x %"struct.ap_int<16>"]*
  call void @copy_out([618240 x %"struct.ap_int<16>"]* %15, [618240 x i16]* %0, [618240 x %"struct.ap_int<16>"]* %16, [618240 x i16]* %1, [8512 x %"struct.ap_int<16>"]* %17, [8512 x i16]* %2, [50176 x %"struct.ap_int<16>"]* %18, [50176 x i16]* %3, [448 x %"struct.ap_int<16>"]* %19, [448 x i16]* %4, [224 x %"struct.ap_int<16>"]* %20, [224 x i16]* %5, [224 x %"struct.ap_int<16>"]* %21, [224 x i16]* %6, [50176 x %"struct.ap_int<16>"]* %22, [50176 x i16]* %7, [50176 x %"struct.ap_int<16>"]* %23, [50176 x i16]* %8, [448 x %"struct.ap_int<16>"]* %24, [448 x i16]* %9, [224 x %"struct.ap_int<16>"]* %25, [224 x i16]* %10, [224 x %"struct.ap_int<16>"]* %26, [224 x i16]* %11, [8960 x %"struct.ap_int<16>"]* %27, [8960 x i16]* %12, [40 x %"struct.ap_int<16>"]* %28, [40 x i16]* %13, [772800 x %"struct.ap_int<16>"]* %29, [772800 x i16]* %14)
  %30 = bitcast [618240 x %"struct.ap_int<16>"]* %15 to %"struct.ap_int<16>"*
  %31 = bitcast [618240 x %"struct.ap_int<16>"]* %16 to %"struct.ap_int<16>"*
  %32 = bitcast [8512 x %"struct.ap_int<16>"]* %17 to %"struct.ap_int<16>"*
  %33 = bitcast [50176 x %"struct.ap_int<16>"]* %18 to %"struct.ap_int<16>"*
  %34 = bitcast [448 x %"struct.ap_int<16>"]* %19 to %"struct.ap_int<16>"*
  %35 = bitcast [224 x %"struct.ap_int<16>"]* %20 to %"struct.ap_int<16>"*
  %36 = bitcast [224 x %"struct.ap_int<16>"]* %21 to %"struct.ap_int<16>"*
  %37 = bitcast [50176 x %"struct.ap_int<16>"]* %22 to %"struct.ap_int<16>"*
  %38 = bitcast [50176 x %"struct.ap_int<16>"]* %23 to %"struct.ap_int<16>"*
  %39 = bitcast [448 x %"struct.ap_int<16>"]* %24 to %"struct.ap_int<16>"*
  %40 = bitcast [224 x %"struct.ap_int<16>"]* %25 to %"struct.ap_int<16>"*
  %41 = bitcast [224 x %"struct.ap_int<16>"]* %26 to %"struct.ap_int<16>"*
  %42 = bitcast [8960 x %"struct.ap_int<16>"]* %27 to %"struct.ap_int<16>"*
  %43 = bitcast [40 x %"struct.ap_int<16>"]* %28 to %"struct.ap_int<16>"*
  %44 = bitcast [772800 x %"struct.ap_int<16>"]* %29 to %"struct.ap_int<16>"*
  call void @SubbandBand0TopQ610_hw_stub(%"struct.ap_int<16>"* %30, %"struct.ap_int<16>"* %31, %"struct.ap_int<16>"* %32, %"struct.ap_int<16>"* %33, %"struct.ap_int<16>"* %34, %"struct.ap_int<16>"* %35, %"struct.ap_int<16>"* %36, %"struct.ap_int<16>"* %37, %"struct.ap_int<16>"* %38, %"struct.ap_int<16>"* %39, %"struct.ap_int<16>"* %40, %"struct.ap_int<16>"* %41, %"struct.ap_int<16>"* %42, %"struct.ap_int<16>"* %43, %"struct.ap_int<16>"* %44)
  call void @copy_in([618240 x %"struct.ap_int<16>"]* %15, [618240 x i16]* %0, [618240 x %"struct.ap_int<16>"]* %16, [618240 x i16]* %1, [8512 x %"struct.ap_int<16>"]* %17, [8512 x i16]* %2, [50176 x %"struct.ap_int<16>"]* %18, [50176 x i16]* %3, [448 x %"struct.ap_int<16>"]* %19, [448 x i16]* %4, [224 x %"struct.ap_int<16>"]* %20, [224 x i16]* %5, [224 x %"struct.ap_int<16>"]* %21, [224 x i16]* %6, [50176 x %"struct.ap_int<16>"]* %22, [50176 x i16]* %7, [50176 x %"struct.ap_int<16>"]* %23, [50176 x i16]* %8, [448 x %"struct.ap_int<16>"]* %24, [448 x i16]* %9, [224 x %"struct.ap_int<16>"]* %25, [224 x i16]* %10, [224 x %"struct.ap_int<16>"]* %26, [224 x i16]* %11, [8960 x %"struct.ap_int<16>"]* %27, [8960 x i16]* %12, [40 x %"struct.ap_int<16>"]* %28, [40 x i16]* %13, [772800 x %"struct.ap_int<16>"]* %29, [772800 x i16]* %14)
  ret void
}

declare void @SubbandBand0TopQ610_hw_stub(%"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*, %"struct.ap_int<16>"*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
