// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1__HH__
#define __SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1__HH__
#include "SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3 SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U;

    SC_CTOR(SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1):  SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U ("SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U") {
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.clk(clk);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.rst(reset);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.ce(ce);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.in0(din0);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.in1(din1);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.in2(din2);
        SubbandBand0TopQ610_mac_muladd_16s_16s_48s_48_3_1_DSP48_3_U.dout(dout);

    }

};

#endif //
