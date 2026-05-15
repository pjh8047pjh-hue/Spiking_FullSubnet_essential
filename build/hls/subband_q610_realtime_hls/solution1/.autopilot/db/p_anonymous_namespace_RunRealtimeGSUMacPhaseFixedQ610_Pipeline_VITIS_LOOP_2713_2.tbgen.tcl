set moduleName p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_2
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {(anonymous namespace)RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_2}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_ptr_0_val int 16 regular  }
	{ input_ptr_32_val int 16 regular  }
	{ input_ptr_64_val int 16 regular  }
	{ input_ptr_96_val int 16 regular  }
	{ input_ptr_128_val int 16 regular  }
	{ input_ptr_160_val int 16 regular  }
	{ input_ptr_192_val int 16 regular  }
	{ sub_ln2719 int 10 regular  }
	{ weight_ih_0 int 512 regular {array 784 { 1 3 } 1 1 }  }
	{ input_ptr_1_val int 16 regular  }
	{ input_ptr_33_val int 16 regular  }
	{ input_ptr_65_val int 16 regular  }
	{ input_ptr_97_val int 16 regular  }
	{ input_ptr_129_val int 16 regular  }
	{ input_ptr_161_val int 16 regular  }
	{ input_ptr_193_val int 16 regular  }
	{ input_ptr_2_val int 16 regular  }
	{ input_ptr_34_val int 16 regular  }
	{ input_ptr_66_val int 16 regular  }
	{ input_ptr_98_val int 16 regular  }
	{ input_ptr_130_val int 16 regular  }
	{ input_ptr_162_val int 16 regular  }
	{ input_ptr_194_val int 16 regular  }
	{ input_ptr_3_val int 16 regular  }
	{ input_ptr_35_val int 16 regular  }
	{ input_ptr_67_val int 16 regular  }
	{ input_ptr_99_val int 16 regular  }
	{ input_ptr_131_val int 16 regular  }
	{ input_ptr_163_val int 16 regular  }
	{ input_ptr_195_val int 16 regular  }
	{ input_ptr_4_val int 16 regular  }
	{ input_ptr_36_val int 16 regular  }
	{ input_ptr_68_val int 16 regular  }
	{ input_ptr_100_val int 16 regular  }
	{ input_ptr_132_val int 16 regular  }
	{ input_ptr_164_val int 16 regular  }
	{ input_ptr_196_val int 16 regular  }
	{ input_ptr_5_val int 16 regular  }
	{ input_ptr_37_val int 16 regular  }
	{ input_ptr_69_val int 16 regular  }
	{ input_ptr_101_val int 16 regular  }
	{ input_ptr_133_val int 16 regular  }
	{ input_ptr_165_val int 16 regular  }
	{ input_ptr_197_val int 16 regular  }
	{ input_ptr_6_val int 16 regular  }
	{ input_ptr_38_val int 16 regular  }
	{ input_ptr_70_val int 16 regular  }
	{ input_ptr_102_val int 16 regular  }
	{ input_ptr_134_val int 16 regular  }
	{ input_ptr_166_val int 16 regular  }
	{ input_ptr_198_val int 16 regular  }
	{ input_ptr_7_val int 16 regular  }
	{ input_ptr_39_val int 16 regular  }
	{ input_ptr_71_val int 16 regular  }
	{ input_ptr_103_val int 16 regular  }
	{ input_ptr_135_val int 16 regular  }
	{ input_ptr_167_val int 16 regular  }
	{ input_ptr_199_val int 16 regular  }
	{ input_ptr_8_val int 16 regular  }
	{ input_ptr_40_val int 16 regular  }
	{ input_ptr_72_val int 16 regular  }
	{ input_ptr_104_val int 16 regular  }
	{ input_ptr_136_val int 16 regular  }
	{ input_ptr_168_val int 16 regular  }
	{ input_ptr_200_val int 16 regular  }
	{ input_ptr_9_val int 16 regular  }
	{ input_ptr_41_val int 16 regular  }
	{ input_ptr_73_val int 16 regular  }
	{ input_ptr_105_val int 16 regular  }
	{ input_ptr_137_val int 16 regular  }
	{ input_ptr_169_val int 16 regular  }
	{ input_ptr_201_val int 16 regular  }
	{ input_ptr_10_val int 16 regular  }
	{ input_ptr_42_val int 16 regular  }
	{ input_ptr_74_val int 16 regular  }
	{ input_ptr_106_val int 16 regular  }
	{ input_ptr_138_val int 16 regular  }
	{ input_ptr_170_val int 16 regular  }
	{ input_ptr_202_val int 16 regular  }
	{ input_ptr_11_val int 16 regular  }
	{ input_ptr_43_val int 16 regular  }
	{ input_ptr_75_val int 16 regular  }
	{ input_ptr_107_val int 16 regular  }
	{ input_ptr_139_val int 16 regular  }
	{ input_ptr_171_val int 16 regular  }
	{ input_ptr_203_val int 16 regular  }
	{ input_ptr_12_val int 16 regular  }
	{ input_ptr_44_val int 16 regular  }
	{ input_ptr_76_val int 16 regular  }
	{ input_ptr_108_val int 16 regular  }
	{ input_ptr_140_val int 16 regular  }
	{ input_ptr_172_val int 16 regular  }
	{ input_ptr_204_val int 16 regular  }
	{ input_ptr_13_val int 16 regular  }
	{ input_ptr_45_val int 16 regular  }
	{ input_ptr_77_val int 16 regular  }
	{ input_ptr_109_val int 16 regular  }
	{ input_ptr_141_val int 16 regular  }
	{ input_ptr_173_val int 16 regular  }
	{ input_ptr_205_val int 16 regular  }
	{ input_ptr_14_val int 16 regular  }
	{ input_ptr_46_val int 16 regular  }
	{ input_ptr_78_val int 16 regular  }
	{ input_ptr_110_val int 16 regular  }
	{ input_ptr_142_val int 16 regular  }
	{ input_ptr_174_val int 16 regular  }
	{ input_ptr_206_val int 16 regular  }
	{ input_ptr_15_val int 16 regular  }
	{ input_ptr_47_val int 16 regular  }
	{ input_ptr_79_val int 16 regular  }
	{ input_ptr_111_val int 16 regular  }
	{ input_ptr_143_val int 16 regular  }
	{ input_ptr_175_val int 16 regular  }
	{ input_ptr_207_val int 16 regular  }
	{ input_ptr_16_val int 16 regular  }
	{ input_ptr_48_val int 16 regular  }
	{ input_ptr_80_val int 16 regular  }
	{ input_ptr_112_val int 16 regular  }
	{ input_ptr_144_val int 16 regular  }
	{ input_ptr_176_val int 16 regular  }
	{ input_ptr_208_val int 16 regular  }
	{ input_ptr_17_val int 16 regular  }
	{ input_ptr_49_val int 16 regular  }
	{ input_ptr_81_val int 16 regular  }
	{ input_ptr_113_val int 16 regular  }
	{ input_ptr_145_val int 16 regular  }
	{ input_ptr_177_val int 16 regular  }
	{ input_ptr_209_val int 16 regular  }
	{ input_ptr_18_val int 16 regular  }
	{ input_ptr_50_val int 16 regular  }
	{ input_ptr_82_val int 16 regular  }
	{ input_ptr_114_val int 16 regular  }
	{ input_ptr_146_val int 16 regular  }
	{ input_ptr_178_val int 16 regular  }
	{ input_ptr_210_val int 16 regular  }
	{ input_ptr_19_val int 16 regular  }
	{ input_ptr_51_val int 16 regular  }
	{ input_ptr_83_val int 16 regular  }
	{ input_ptr_115_val int 16 regular  }
	{ input_ptr_147_val int 16 regular  }
	{ input_ptr_179_val int 16 regular  }
	{ input_ptr_211_val int 16 regular  }
	{ input_ptr_20_val int 16 regular  }
	{ input_ptr_52_val int 16 regular  }
	{ input_ptr_84_val int 16 regular  }
	{ input_ptr_116_val int 16 regular  }
	{ input_ptr_148_val int 16 regular  }
	{ input_ptr_180_val int 16 regular  }
	{ input_ptr_212_val int 16 regular  }
	{ input_ptr_21_val int 16 regular  }
	{ input_ptr_53_val int 16 regular  }
	{ input_ptr_85_val int 16 regular  }
	{ input_ptr_117_val int 16 regular  }
	{ input_ptr_149_val int 16 regular  }
	{ input_ptr_181_val int 16 regular  }
	{ input_ptr_213_val int 16 regular  }
	{ input_ptr_22_val int 16 regular  }
	{ input_ptr_54_val int 16 regular  }
	{ input_ptr_86_val int 16 regular  }
	{ input_ptr_118_val int 16 regular  }
	{ input_ptr_150_val int 16 regular  }
	{ input_ptr_182_val int 16 regular  }
	{ input_ptr_214_val int 16 regular  }
	{ input_ptr_23_val int 16 regular  }
	{ input_ptr_55_val int 16 regular  }
	{ input_ptr_87_val int 16 regular  }
	{ input_ptr_119_val int 16 regular  }
	{ input_ptr_151_val int 16 regular  }
	{ input_ptr_183_val int 16 regular  }
	{ input_ptr_215_val int 16 regular  }
	{ input_ptr_24_val int 16 regular  }
	{ input_ptr_56_val int 16 regular  }
	{ input_ptr_88_val int 16 regular  }
	{ input_ptr_120_val int 16 regular  }
	{ input_ptr_152_val int 16 regular  }
	{ input_ptr_184_val int 16 regular  }
	{ input_ptr_216_val int 16 regular  }
	{ input_ptr_25_val int 16 regular  }
	{ input_ptr_57_val int 16 regular  }
	{ input_ptr_89_val int 16 regular  }
	{ input_ptr_121_val int 16 regular  }
	{ input_ptr_153_val int 16 regular  }
	{ input_ptr_185_val int 16 regular  }
	{ input_ptr_217_val int 16 regular  }
	{ input_ptr_26_val int 16 regular  }
	{ input_ptr_58_val int 16 regular  }
	{ input_ptr_90_val int 16 regular  }
	{ input_ptr_122_val int 16 regular  }
	{ input_ptr_154_val int 16 regular  }
	{ input_ptr_186_val int 16 regular  }
	{ input_ptr_218_val int 16 regular  }
	{ input_ptr_27_val int 16 regular  }
	{ input_ptr_59_val int 16 regular  }
	{ input_ptr_91_val int 16 regular  }
	{ input_ptr_123_val int 16 regular  }
	{ input_ptr_155_val int 16 regular  }
	{ input_ptr_187_val int 16 regular  }
	{ input_ptr_219_val int 16 regular  }
	{ input_ptr_28_val int 16 regular  }
	{ input_ptr_60_val int 16 regular  }
	{ input_ptr_92_val int 16 regular  }
	{ input_ptr_124_val int 16 regular  }
	{ input_ptr_156_val int 16 regular  }
	{ input_ptr_188_val int 16 regular  }
	{ input_ptr_220_val int 16 regular  }
	{ input_ptr_29_val int 16 regular  }
	{ input_ptr_61_val int 16 regular  }
	{ input_ptr_93_val int 16 regular  }
	{ input_ptr_125_val int 16 regular  }
	{ input_ptr_157_val int 16 regular  }
	{ input_ptr_189_val int 16 regular  }
	{ input_ptr_221_val int 16 regular  }
	{ input_ptr_30_val int 16 regular  }
	{ input_ptr_62_val int 16 regular  }
	{ input_ptr_94_val int 16 regular  }
	{ input_ptr_126_val int 16 regular  }
	{ input_ptr_158_val int 16 regular  }
	{ input_ptr_190_val int 16 regular  }
	{ input_ptr_222_val int 16 regular  }
	{ input_ptr_31_val int 16 regular  }
	{ input_ptr_63_val int 16 regular  }
	{ input_ptr_95_val int 16 regular  }
	{ input_ptr_127_val int 16 regular  }
	{ input_ptr_159_val int 16 regular  }
	{ input_ptr_191_val int 16 regular  }
	{ input_ptr_223_val int 16 regular  }
	{ p_out int 34 regular {pointer 1}  }
	{ p_out1 int 34 regular {pointer 1}  }
	{ p_out2 int 34 regular {pointer 1}  }
	{ p_out3 int 34 regular {pointer 1}  }
	{ p_out4 int 34 regular {pointer 1}  }
	{ p_out5 int 34 regular {pointer 1}  }
	{ p_out6 int 34 regular {pointer 1}  }
	{ p_out7 int 34 regular {pointer 1}  }
	{ p_out8 int 34 regular {pointer 1}  }
	{ p_out9 int 34 regular {pointer 1}  }
	{ p_out10 int 34 regular {pointer 1}  }
	{ p_out11 int 34 regular {pointer 1}  }
	{ p_out12 int 34 regular {pointer 1}  }
	{ p_out13 int 34 regular {pointer 1}  }
	{ p_out14 int 34 regular {pointer 1}  }
	{ p_out15 int 34 regular {pointer 1}  }
	{ p_out16 int 34 regular {pointer 1}  }
	{ p_out17 int 34 regular {pointer 1}  }
	{ p_out18 int 34 regular {pointer 1}  }
	{ p_out19 int 34 regular {pointer 1}  }
	{ p_out20 int 34 regular {pointer 1}  }
	{ p_out21 int 34 regular {pointer 1}  }
	{ p_out22 int 34 regular {pointer 1}  }
	{ p_out23 int 34 regular {pointer 1}  }
	{ p_out24 int 34 regular {pointer 1}  }
	{ p_out25 int 34 regular {pointer 1}  }
	{ p_out26 int 34 regular {pointer 1}  }
	{ p_out27 int 34 regular {pointer 1}  }
	{ p_out28 int 34 regular {pointer 1}  }
	{ p_out29 int 34 regular {pointer 1}  }
	{ p_out30 int 34 regular {pointer 1}  }
	{ p_out31 int 34 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "input_ptr_0_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_32_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_64_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_96_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_128_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_160_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_192_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "sub_ln2719", "interface" : "wire", "bitwidth" : 10, "direction" : "READONLY"} , 
 	{ "Name" : "weight_ih_0", "interface" : "memory", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_1_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_33_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_65_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_97_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_129_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_161_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_193_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_2_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_34_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_66_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_98_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_130_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_162_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_194_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_3_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_35_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_67_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_99_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_131_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_163_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_195_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_4_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_36_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_68_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_100_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_132_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_164_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_196_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_5_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_37_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_69_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_101_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_133_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_165_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_197_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_6_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_38_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_70_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_102_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_134_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_166_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_198_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_7_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_39_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_71_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_103_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_135_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_167_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_199_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_8_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_40_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_72_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_104_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_136_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_168_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_200_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_9_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_41_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_73_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_105_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_137_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_169_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_201_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_10_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_42_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_74_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_106_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_138_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_170_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_202_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_11_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_43_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_75_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_107_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_139_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_171_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_203_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_12_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_44_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_76_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_108_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_140_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_172_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_204_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_13_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_45_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_77_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_109_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_141_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_173_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_205_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_14_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_46_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_78_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_110_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_142_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_174_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_206_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_15_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_47_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_79_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_111_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_143_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_175_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_207_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_16_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_48_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_80_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_112_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_144_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_176_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_208_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_17_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_49_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_81_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_113_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_145_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_177_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_209_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_18_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_50_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_82_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_114_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_146_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_178_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_210_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_19_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_51_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_83_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_115_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_147_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_179_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_211_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_20_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_52_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_84_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_116_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_148_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_180_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_212_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_21_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_53_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_85_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_117_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_149_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_181_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_213_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_22_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_54_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_86_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_118_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_150_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_182_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_214_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_23_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_55_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_87_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_119_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_151_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_183_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_215_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_24_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_56_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_88_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_120_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_152_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_184_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_216_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_25_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_57_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_89_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_121_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_153_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_185_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_217_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_26_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_58_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_90_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_122_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_154_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_186_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_218_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_27_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_59_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_91_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_123_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_155_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_187_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_219_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_28_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_60_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_92_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_124_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_156_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_188_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_220_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_29_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_61_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_93_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_125_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_157_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_189_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_221_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_30_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_62_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_94_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_126_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_158_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_190_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_222_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_31_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_63_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_95_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_127_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_159_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_191_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "input_ptr_223_val", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out1", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out2", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out3", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out4", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out5", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out6", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out7", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out8", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out9", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out10", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out11", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out12", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out13", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out14", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out15", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out16", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out17", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out18", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out19", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out20", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out21", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out22", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out23", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out24", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out25", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out26", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out27", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out28", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out29", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out30", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out31", "interface" : "wire", "bitwidth" : 34, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 298
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_ptr_0_val sc_in sc_lv 16 signal 0 } 
	{ input_ptr_32_val sc_in sc_lv 16 signal 1 } 
	{ input_ptr_64_val sc_in sc_lv 16 signal 2 } 
	{ input_ptr_96_val sc_in sc_lv 16 signal 3 } 
	{ input_ptr_128_val sc_in sc_lv 16 signal 4 } 
	{ input_ptr_160_val sc_in sc_lv 16 signal 5 } 
	{ input_ptr_192_val sc_in sc_lv 16 signal 6 } 
	{ sub_ln2719 sc_in sc_lv 10 signal 7 } 
	{ weight_ih_0_address0 sc_out sc_lv 10 signal 8 } 
	{ weight_ih_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ weight_ih_0_q0 sc_in sc_lv 512 signal 8 } 
	{ input_ptr_1_val sc_in sc_lv 16 signal 9 } 
	{ input_ptr_33_val sc_in sc_lv 16 signal 10 } 
	{ input_ptr_65_val sc_in sc_lv 16 signal 11 } 
	{ input_ptr_97_val sc_in sc_lv 16 signal 12 } 
	{ input_ptr_129_val sc_in sc_lv 16 signal 13 } 
	{ input_ptr_161_val sc_in sc_lv 16 signal 14 } 
	{ input_ptr_193_val sc_in sc_lv 16 signal 15 } 
	{ input_ptr_2_val sc_in sc_lv 16 signal 16 } 
	{ input_ptr_34_val sc_in sc_lv 16 signal 17 } 
	{ input_ptr_66_val sc_in sc_lv 16 signal 18 } 
	{ input_ptr_98_val sc_in sc_lv 16 signal 19 } 
	{ input_ptr_130_val sc_in sc_lv 16 signal 20 } 
	{ input_ptr_162_val sc_in sc_lv 16 signal 21 } 
	{ input_ptr_194_val sc_in sc_lv 16 signal 22 } 
	{ input_ptr_3_val sc_in sc_lv 16 signal 23 } 
	{ input_ptr_35_val sc_in sc_lv 16 signal 24 } 
	{ input_ptr_67_val sc_in sc_lv 16 signal 25 } 
	{ input_ptr_99_val sc_in sc_lv 16 signal 26 } 
	{ input_ptr_131_val sc_in sc_lv 16 signal 27 } 
	{ input_ptr_163_val sc_in sc_lv 16 signal 28 } 
	{ input_ptr_195_val sc_in sc_lv 16 signal 29 } 
	{ input_ptr_4_val sc_in sc_lv 16 signal 30 } 
	{ input_ptr_36_val sc_in sc_lv 16 signal 31 } 
	{ input_ptr_68_val sc_in sc_lv 16 signal 32 } 
	{ input_ptr_100_val sc_in sc_lv 16 signal 33 } 
	{ input_ptr_132_val sc_in sc_lv 16 signal 34 } 
	{ input_ptr_164_val sc_in sc_lv 16 signal 35 } 
	{ input_ptr_196_val sc_in sc_lv 16 signal 36 } 
	{ input_ptr_5_val sc_in sc_lv 16 signal 37 } 
	{ input_ptr_37_val sc_in sc_lv 16 signal 38 } 
	{ input_ptr_69_val sc_in sc_lv 16 signal 39 } 
	{ input_ptr_101_val sc_in sc_lv 16 signal 40 } 
	{ input_ptr_133_val sc_in sc_lv 16 signal 41 } 
	{ input_ptr_165_val sc_in sc_lv 16 signal 42 } 
	{ input_ptr_197_val sc_in sc_lv 16 signal 43 } 
	{ input_ptr_6_val sc_in sc_lv 16 signal 44 } 
	{ input_ptr_38_val sc_in sc_lv 16 signal 45 } 
	{ input_ptr_70_val sc_in sc_lv 16 signal 46 } 
	{ input_ptr_102_val sc_in sc_lv 16 signal 47 } 
	{ input_ptr_134_val sc_in sc_lv 16 signal 48 } 
	{ input_ptr_166_val sc_in sc_lv 16 signal 49 } 
	{ input_ptr_198_val sc_in sc_lv 16 signal 50 } 
	{ input_ptr_7_val sc_in sc_lv 16 signal 51 } 
	{ input_ptr_39_val sc_in sc_lv 16 signal 52 } 
	{ input_ptr_71_val sc_in sc_lv 16 signal 53 } 
	{ input_ptr_103_val sc_in sc_lv 16 signal 54 } 
	{ input_ptr_135_val sc_in sc_lv 16 signal 55 } 
	{ input_ptr_167_val sc_in sc_lv 16 signal 56 } 
	{ input_ptr_199_val sc_in sc_lv 16 signal 57 } 
	{ input_ptr_8_val sc_in sc_lv 16 signal 58 } 
	{ input_ptr_40_val sc_in sc_lv 16 signal 59 } 
	{ input_ptr_72_val sc_in sc_lv 16 signal 60 } 
	{ input_ptr_104_val sc_in sc_lv 16 signal 61 } 
	{ input_ptr_136_val sc_in sc_lv 16 signal 62 } 
	{ input_ptr_168_val sc_in sc_lv 16 signal 63 } 
	{ input_ptr_200_val sc_in sc_lv 16 signal 64 } 
	{ input_ptr_9_val sc_in sc_lv 16 signal 65 } 
	{ input_ptr_41_val sc_in sc_lv 16 signal 66 } 
	{ input_ptr_73_val sc_in sc_lv 16 signal 67 } 
	{ input_ptr_105_val sc_in sc_lv 16 signal 68 } 
	{ input_ptr_137_val sc_in sc_lv 16 signal 69 } 
	{ input_ptr_169_val sc_in sc_lv 16 signal 70 } 
	{ input_ptr_201_val sc_in sc_lv 16 signal 71 } 
	{ input_ptr_10_val sc_in sc_lv 16 signal 72 } 
	{ input_ptr_42_val sc_in sc_lv 16 signal 73 } 
	{ input_ptr_74_val sc_in sc_lv 16 signal 74 } 
	{ input_ptr_106_val sc_in sc_lv 16 signal 75 } 
	{ input_ptr_138_val sc_in sc_lv 16 signal 76 } 
	{ input_ptr_170_val sc_in sc_lv 16 signal 77 } 
	{ input_ptr_202_val sc_in sc_lv 16 signal 78 } 
	{ input_ptr_11_val sc_in sc_lv 16 signal 79 } 
	{ input_ptr_43_val sc_in sc_lv 16 signal 80 } 
	{ input_ptr_75_val sc_in sc_lv 16 signal 81 } 
	{ input_ptr_107_val sc_in sc_lv 16 signal 82 } 
	{ input_ptr_139_val sc_in sc_lv 16 signal 83 } 
	{ input_ptr_171_val sc_in sc_lv 16 signal 84 } 
	{ input_ptr_203_val sc_in sc_lv 16 signal 85 } 
	{ input_ptr_12_val sc_in sc_lv 16 signal 86 } 
	{ input_ptr_44_val sc_in sc_lv 16 signal 87 } 
	{ input_ptr_76_val sc_in sc_lv 16 signal 88 } 
	{ input_ptr_108_val sc_in sc_lv 16 signal 89 } 
	{ input_ptr_140_val sc_in sc_lv 16 signal 90 } 
	{ input_ptr_172_val sc_in sc_lv 16 signal 91 } 
	{ input_ptr_204_val sc_in sc_lv 16 signal 92 } 
	{ input_ptr_13_val sc_in sc_lv 16 signal 93 } 
	{ input_ptr_45_val sc_in sc_lv 16 signal 94 } 
	{ input_ptr_77_val sc_in sc_lv 16 signal 95 } 
	{ input_ptr_109_val sc_in sc_lv 16 signal 96 } 
	{ input_ptr_141_val sc_in sc_lv 16 signal 97 } 
	{ input_ptr_173_val sc_in sc_lv 16 signal 98 } 
	{ input_ptr_205_val sc_in sc_lv 16 signal 99 } 
	{ input_ptr_14_val sc_in sc_lv 16 signal 100 } 
	{ input_ptr_46_val sc_in sc_lv 16 signal 101 } 
	{ input_ptr_78_val sc_in sc_lv 16 signal 102 } 
	{ input_ptr_110_val sc_in sc_lv 16 signal 103 } 
	{ input_ptr_142_val sc_in sc_lv 16 signal 104 } 
	{ input_ptr_174_val sc_in sc_lv 16 signal 105 } 
	{ input_ptr_206_val sc_in sc_lv 16 signal 106 } 
	{ input_ptr_15_val sc_in sc_lv 16 signal 107 } 
	{ input_ptr_47_val sc_in sc_lv 16 signal 108 } 
	{ input_ptr_79_val sc_in sc_lv 16 signal 109 } 
	{ input_ptr_111_val sc_in sc_lv 16 signal 110 } 
	{ input_ptr_143_val sc_in sc_lv 16 signal 111 } 
	{ input_ptr_175_val sc_in sc_lv 16 signal 112 } 
	{ input_ptr_207_val sc_in sc_lv 16 signal 113 } 
	{ input_ptr_16_val sc_in sc_lv 16 signal 114 } 
	{ input_ptr_48_val sc_in sc_lv 16 signal 115 } 
	{ input_ptr_80_val sc_in sc_lv 16 signal 116 } 
	{ input_ptr_112_val sc_in sc_lv 16 signal 117 } 
	{ input_ptr_144_val sc_in sc_lv 16 signal 118 } 
	{ input_ptr_176_val sc_in sc_lv 16 signal 119 } 
	{ input_ptr_208_val sc_in sc_lv 16 signal 120 } 
	{ input_ptr_17_val sc_in sc_lv 16 signal 121 } 
	{ input_ptr_49_val sc_in sc_lv 16 signal 122 } 
	{ input_ptr_81_val sc_in sc_lv 16 signal 123 } 
	{ input_ptr_113_val sc_in sc_lv 16 signal 124 } 
	{ input_ptr_145_val sc_in sc_lv 16 signal 125 } 
	{ input_ptr_177_val sc_in sc_lv 16 signal 126 } 
	{ input_ptr_209_val sc_in sc_lv 16 signal 127 } 
	{ input_ptr_18_val sc_in sc_lv 16 signal 128 } 
	{ input_ptr_50_val sc_in sc_lv 16 signal 129 } 
	{ input_ptr_82_val sc_in sc_lv 16 signal 130 } 
	{ input_ptr_114_val sc_in sc_lv 16 signal 131 } 
	{ input_ptr_146_val sc_in sc_lv 16 signal 132 } 
	{ input_ptr_178_val sc_in sc_lv 16 signal 133 } 
	{ input_ptr_210_val sc_in sc_lv 16 signal 134 } 
	{ input_ptr_19_val sc_in sc_lv 16 signal 135 } 
	{ input_ptr_51_val sc_in sc_lv 16 signal 136 } 
	{ input_ptr_83_val sc_in sc_lv 16 signal 137 } 
	{ input_ptr_115_val sc_in sc_lv 16 signal 138 } 
	{ input_ptr_147_val sc_in sc_lv 16 signal 139 } 
	{ input_ptr_179_val sc_in sc_lv 16 signal 140 } 
	{ input_ptr_211_val sc_in sc_lv 16 signal 141 } 
	{ input_ptr_20_val sc_in sc_lv 16 signal 142 } 
	{ input_ptr_52_val sc_in sc_lv 16 signal 143 } 
	{ input_ptr_84_val sc_in sc_lv 16 signal 144 } 
	{ input_ptr_116_val sc_in sc_lv 16 signal 145 } 
	{ input_ptr_148_val sc_in sc_lv 16 signal 146 } 
	{ input_ptr_180_val sc_in sc_lv 16 signal 147 } 
	{ input_ptr_212_val sc_in sc_lv 16 signal 148 } 
	{ input_ptr_21_val sc_in sc_lv 16 signal 149 } 
	{ input_ptr_53_val sc_in sc_lv 16 signal 150 } 
	{ input_ptr_85_val sc_in sc_lv 16 signal 151 } 
	{ input_ptr_117_val sc_in sc_lv 16 signal 152 } 
	{ input_ptr_149_val sc_in sc_lv 16 signal 153 } 
	{ input_ptr_181_val sc_in sc_lv 16 signal 154 } 
	{ input_ptr_213_val sc_in sc_lv 16 signal 155 } 
	{ input_ptr_22_val sc_in sc_lv 16 signal 156 } 
	{ input_ptr_54_val sc_in sc_lv 16 signal 157 } 
	{ input_ptr_86_val sc_in sc_lv 16 signal 158 } 
	{ input_ptr_118_val sc_in sc_lv 16 signal 159 } 
	{ input_ptr_150_val sc_in sc_lv 16 signal 160 } 
	{ input_ptr_182_val sc_in sc_lv 16 signal 161 } 
	{ input_ptr_214_val sc_in sc_lv 16 signal 162 } 
	{ input_ptr_23_val sc_in sc_lv 16 signal 163 } 
	{ input_ptr_55_val sc_in sc_lv 16 signal 164 } 
	{ input_ptr_87_val sc_in sc_lv 16 signal 165 } 
	{ input_ptr_119_val sc_in sc_lv 16 signal 166 } 
	{ input_ptr_151_val sc_in sc_lv 16 signal 167 } 
	{ input_ptr_183_val sc_in sc_lv 16 signal 168 } 
	{ input_ptr_215_val sc_in sc_lv 16 signal 169 } 
	{ input_ptr_24_val sc_in sc_lv 16 signal 170 } 
	{ input_ptr_56_val sc_in sc_lv 16 signal 171 } 
	{ input_ptr_88_val sc_in sc_lv 16 signal 172 } 
	{ input_ptr_120_val sc_in sc_lv 16 signal 173 } 
	{ input_ptr_152_val sc_in sc_lv 16 signal 174 } 
	{ input_ptr_184_val sc_in sc_lv 16 signal 175 } 
	{ input_ptr_216_val sc_in sc_lv 16 signal 176 } 
	{ input_ptr_25_val sc_in sc_lv 16 signal 177 } 
	{ input_ptr_57_val sc_in sc_lv 16 signal 178 } 
	{ input_ptr_89_val sc_in sc_lv 16 signal 179 } 
	{ input_ptr_121_val sc_in sc_lv 16 signal 180 } 
	{ input_ptr_153_val sc_in sc_lv 16 signal 181 } 
	{ input_ptr_185_val sc_in sc_lv 16 signal 182 } 
	{ input_ptr_217_val sc_in sc_lv 16 signal 183 } 
	{ input_ptr_26_val sc_in sc_lv 16 signal 184 } 
	{ input_ptr_58_val sc_in sc_lv 16 signal 185 } 
	{ input_ptr_90_val sc_in sc_lv 16 signal 186 } 
	{ input_ptr_122_val sc_in sc_lv 16 signal 187 } 
	{ input_ptr_154_val sc_in sc_lv 16 signal 188 } 
	{ input_ptr_186_val sc_in sc_lv 16 signal 189 } 
	{ input_ptr_218_val sc_in sc_lv 16 signal 190 } 
	{ input_ptr_27_val sc_in sc_lv 16 signal 191 } 
	{ input_ptr_59_val sc_in sc_lv 16 signal 192 } 
	{ input_ptr_91_val sc_in sc_lv 16 signal 193 } 
	{ input_ptr_123_val sc_in sc_lv 16 signal 194 } 
	{ input_ptr_155_val sc_in sc_lv 16 signal 195 } 
	{ input_ptr_187_val sc_in sc_lv 16 signal 196 } 
	{ input_ptr_219_val sc_in sc_lv 16 signal 197 } 
	{ input_ptr_28_val sc_in sc_lv 16 signal 198 } 
	{ input_ptr_60_val sc_in sc_lv 16 signal 199 } 
	{ input_ptr_92_val sc_in sc_lv 16 signal 200 } 
	{ input_ptr_124_val sc_in sc_lv 16 signal 201 } 
	{ input_ptr_156_val sc_in sc_lv 16 signal 202 } 
	{ input_ptr_188_val sc_in sc_lv 16 signal 203 } 
	{ input_ptr_220_val sc_in sc_lv 16 signal 204 } 
	{ input_ptr_29_val sc_in sc_lv 16 signal 205 } 
	{ input_ptr_61_val sc_in sc_lv 16 signal 206 } 
	{ input_ptr_93_val sc_in sc_lv 16 signal 207 } 
	{ input_ptr_125_val sc_in sc_lv 16 signal 208 } 
	{ input_ptr_157_val sc_in sc_lv 16 signal 209 } 
	{ input_ptr_189_val sc_in sc_lv 16 signal 210 } 
	{ input_ptr_221_val sc_in sc_lv 16 signal 211 } 
	{ input_ptr_30_val sc_in sc_lv 16 signal 212 } 
	{ input_ptr_62_val sc_in sc_lv 16 signal 213 } 
	{ input_ptr_94_val sc_in sc_lv 16 signal 214 } 
	{ input_ptr_126_val sc_in sc_lv 16 signal 215 } 
	{ input_ptr_158_val sc_in sc_lv 16 signal 216 } 
	{ input_ptr_190_val sc_in sc_lv 16 signal 217 } 
	{ input_ptr_222_val sc_in sc_lv 16 signal 218 } 
	{ input_ptr_31_val sc_in sc_lv 16 signal 219 } 
	{ input_ptr_63_val sc_in sc_lv 16 signal 220 } 
	{ input_ptr_95_val sc_in sc_lv 16 signal 221 } 
	{ input_ptr_127_val sc_in sc_lv 16 signal 222 } 
	{ input_ptr_159_val sc_in sc_lv 16 signal 223 } 
	{ input_ptr_191_val sc_in sc_lv 16 signal 224 } 
	{ input_ptr_223_val sc_in sc_lv 16 signal 225 } 
	{ p_out sc_out sc_lv 34 signal 226 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 226 } 
	{ p_out1 sc_out sc_lv 34 signal 227 } 
	{ p_out1_ap_vld sc_out sc_logic 1 outvld 227 } 
	{ p_out2 sc_out sc_lv 34 signal 228 } 
	{ p_out2_ap_vld sc_out sc_logic 1 outvld 228 } 
	{ p_out3 sc_out sc_lv 34 signal 229 } 
	{ p_out3_ap_vld sc_out sc_logic 1 outvld 229 } 
	{ p_out4 sc_out sc_lv 34 signal 230 } 
	{ p_out4_ap_vld sc_out sc_logic 1 outvld 230 } 
	{ p_out5 sc_out sc_lv 34 signal 231 } 
	{ p_out5_ap_vld sc_out sc_logic 1 outvld 231 } 
	{ p_out6 sc_out sc_lv 34 signal 232 } 
	{ p_out6_ap_vld sc_out sc_logic 1 outvld 232 } 
	{ p_out7 sc_out sc_lv 34 signal 233 } 
	{ p_out7_ap_vld sc_out sc_logic 1 outvld 233 } 
	{ p_out8 sc_out sc_lv 34 signal 234 } 
	{ p_out8_ap_vld sc_out sc_logic 1 outvld 234 } 
	{ p_out9 sc_out sc_lv 34 signal 235 } 
	{ p_out9_ap_vld sc_out sc_logic 1 outvld 235 } 
	{ p_out10 sc_out sc_lv 34 signal 236 } 
	{ p_out10_ap_vld sc_out sc_logic 1 outvld 236 } 
	{ p_out11 sc_out sc_lv 34 signal 237 } 
	{ p_out11_ap_vld sc_out sc_logic 1 outvld 237 } 
	{ p_out12 sc_out sc_lv 34 signal 238 } 
	{ p_out12_ap_vld sc_out sc_logic 1 outvld 238 } 
	{ p_out13 sc_out sc_lv 34 signal 239 } 
	{ p_out13_ap_vld sc_out sc_logic 1 outvld 239 } 
	{ p_out14 sc_out sc_lv 34 signal 240 } 
	{ p_out14_ap_vld sc_out sc_logic 1 outvld 240 } 
	{ p_out15 sc_out sc_lv 34 signal 241 } 
	{ p_out15_ap_vld sc_out sc_logic 1 outvld 241 } 
	{ p_out16 sc_out sc_lv 34 signal 242 } 
	{ p_out16_ap_vld sc_out sc_logic 1 outvld 242 } 
	{ p_out17 sc_out sc_lv 34 signal 243 } 
	{ p_out17_ap_vld sc_out sc_logic 1 outvld 243 } 
	{ p_out18 sc_out sc_lv 34 signal 244 } 
	{ p_out18_ap_vld sc_out sc_logic 1 outvld 244 } 
	{ p_out19 sc_out sc_lv 34 signal 245 } 
	{ p_out19_ap_vld sc_out sc_logic 1 outvld 245 } 
	{ p_out20 sc_out sc_lv 34 signal 246 } 
	{ p_out20_ap_vld sc_out sc_logic 1 outvld 246 } 
	{ p_out21 sc_out sc_lv 34 signal 247 } 
	{ p_out21_ap_vld sc_out sc_logic 1 outvld 247 } 
	{ p_out22 sc_out sc_lv 34 signal 248 } 
	{ p_out22_ap_vld sc_out sc_logic 1 outvld 248 } 
	{ p_out23 sc_out sc_lv 34 signal 249 } 
	{ p_out23_ap_vld sc_out sc_logic 1 outvld 249 } 
	{ p_out24 sc_out sc_lv 34 signal 250 } 
	{ p_out24_ap_vld sc_out sc_logic 1 outvld 250 } 
	{ p_out25 sc_out sc_lv 34 signal 251 } 
	{ p_out25_ap_vld sc_out sc_logic 1 outvld 251 } 
	{ p_out26 sc_out sc_lv 34 signal 252 } 
	{ p_out26_ap_vld sc_out sc_logic 1 outvld 252 } 
	{ p_out27 sc_out sc_lv 34 signal 253 } 
	{ p_out27_ap_vld sc_out sc_logic 1 outvld 253 } 
	{ p_out28 sc_out sc_lv 34 signal 254 } 
	{ p_out28_ap_vld sc_out sc_logic 1 outvld 254 } 
	{ p_out29 sc_out sc_lv 34 signal 255 } 
	{ p_out29_ap_vld sc_out sc_logic 1 outvld 255 } 
	{ p_out30 sc_out sc_lv 34 signal 256 } 
	{ p_out30_ap_vld sc_out sc_logic 1 outvld 256 } 
	{ p_out31 sc_out sc_lv 34 signal 257 } 
	{ p_out31_ap_vld sc_out sc_logic 1 outvld 257 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_ptr_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_0_val", "role": "default" }} , 
 	{ "name": "input_ptr_32_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_32_val", "role": "default" }} , 
 	{ "name": "input_ptr_64_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_64_val", "role": "default" }} , 
 	{ "name": "input_ptr_96_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_96_val", "role": "default" }} , 
 	{ "name": "input_ptr_128_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_128_val", "role": "default" }} , 
 	{ "name": "input_ptr_160_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_160_val", "role": "default" }} , 
 	{ "name": "input_ptr_192_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_192_val", "role": "default" }} , 
 	{ "name": "sub_ln2719", "direction": "in", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "sub_ln2719", "role": "default" }} , 
 	{ "name": "weight_ih_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "weight_ih_0", "role": "address0" }} , 
 	{ "name": "weight_ih_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "weight_ih_0", "role": "ce0" }} , 
 	{ "name": "weight_ih_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "weight_ih_0", "role": "q0" }} , 
 	{ "name": "input_ptr_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_1_val", "role": "default" }} , 
 	{ "name": "input_ptr_33_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_33_val", "role": "default" }} , 
 	{ "name": "input_ptr_65_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_65_val", "role": "default" }} , 
 	{ "name": "input_ptr_97_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_97_val", "role": "default" }} , 
 	{ "name": "input_ptr_129_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_129_val", "role": "default" }} , 
 	{ "name": "input_ptr_161_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_161_val", "role": "default" }} , 
 	{ "name": "input_ptr_193_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_193_val", "role": "default" }} , 
 	{ "name": "input_ptr_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_2_val", "role": "default" }} , 
 	{ "name": "input_ptr_34_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_34_val", "role": "default" }} , 
 	{ "name": "input_ptr_66_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_66_val", "role": "default" }} , 
 	{ "name": "input_ptr_98_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_98_val", "role": "default" }} , 
 	{ "name": "input_ptr_130_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_130_val", "role": "default" }} , 
 	{ "name": "input_ptr_162_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_162_val", "role": "default" }} , 
 	{ "name": "input_ptr_194_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_194_val", "role": "default" }} , 
 	{ "name": "input_ptr_3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_3_val", "role": "default" }} , 
 	{ "name": "input_ptr_35_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_35_val", "role": "default" }} , 
 	{ "name": "input_ptr_67_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_67_val", "role": "default" }} , 
 	{ "name": "input_ptr_99_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_99_val", "role": "default" }} , 
 	{ "name": "input_ptr_131_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_131_val", "role": "default" }} , 
 	{ "name": "input_ptr_163_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_163_val", "role": "default" }} , 
 	{ "name": "input_ptr_195_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_195_val", "role": "default" }} , 
 	{ "name": "input_ptr_4_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_4_val", "role": "default" }} , 
 	{ "name": "input_ptr_36_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_36_val", "role": "default" }} , 
 	{ "name": "input_ptr_68_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_68_val", "role": "default" }} , 
 	{ "name": "input_ptr_100_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_100_val", "role": "default" }} , 
 	{ "name": "input_ptr_132_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_132_val", "role": "default" }} , 
 	{ "name": "input_ptr_164_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_164_val", "role": "default" }} , 
 	{ "name": "input_ptr_196_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_196_val", "role": "default" }} , 
 	{ "name": "input_ptr_5_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_5_val", "role": "default" }} , 
 	{ "name": "input_ptr_37_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_37_val", "role": "default" }} , 
 	{ "name": "input_ptr_69_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_69_val", "role": "default" }} , 
 	{ "name": "input_ptr_101_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_101_val", "role": "default" }} , 
 	{ "name": "input_ptr_133_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_133_val", "role": "default" }} , 
 	{ "name": "input_ptr_165_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_165_val", "role": "default" }} , 
 	{ "name": "input_ptr_197_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_197_val", "role": "default" }} , 
 	{ "name": "input_ptr_6_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_6_val", "role": "default" }} , 
 	{ "name": "input_ptr_38_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_38_val", "role": "default" }} , 
 	{ "name": "input_ptr_70_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_70_val", "role": "default" }} , 
 	{ "name": "input_ptr_102_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_102_val", "role": "default" }} , 
 	{ "name": "input_ptr_134_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_134_val", "role": "default" }} , 
 	{ "name": "input_ptr_166_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_166_val", "role": "default" }} , 
 	{ "name": "input_ptr_198_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_198_val", "role": "default" }} , 
 	{ "name": "input_ptr_7_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_7_val", "role": "default" }} , 
 	{ "name": "input_ptr_39_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_39_val", "role": "default" }} , 
 	{ "name": "input_ptr_71_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_71_val", "role": "default" }} , 
 	{ "name": "input_ptr_103_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_103_val", "role": "default" }} , 
 	{ "name": "input_ptr_135_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_135_val", "role": "default" }} , 
 	{ "name": "input_ptr_167_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_167_val", "role": "default" }} , 
 	{ "name": "input_ptr_199_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_199_val", "role": "default" }} , 
 	{ "name": "input_ptr_8_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_8_val", "role": "default" }} , 
 	{ "name": "input_ptr_40_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_40_val", "role": "default" }} , 
 	{ "name": "input_ptr_72_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_72_val", "role": "default" }} , 
 	{ "name": "input_ptr_104_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_104_val", "role": "default" }} , 
 	{ "name": "input_ptr_136_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_136_val", "role": "default" }} , 
 	{ "name": "input_ptr_168_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_168_val", "role": "default" }} , 
 	{ "name": "input_ptr_200_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_200_val", "role": "default" }} , 
 	{ "name": "input_ptr_9_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_9_val", "role": "default" }} , 
 	{ "name": "input_ptr_41_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_41_val", "role": "default" }} , 
 	{ "name": "input_ptr_73_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_73_val", "role": "default" }} , 
 	{ "name": "input_ptr_105_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_105_val", "role": "default" }} , 
 	{ "name": "input_ptr_137_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_137_val", "role": "default" }} , 
 	{ "name": "input_ptr_169_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_169_val", "role": "default" }} , 
 	{ "name": "input_ptr_201_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_201_val", "role": "default" }} , 
 	{ "name": "input_ptr_10_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_10_val", "role": "default" }} , 
 	{ "name": "input_ptr_42_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_42_val", "role": "default" }} , 
 	{ "name": "input_ptr_74_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_74_val", "role": "default" }} , 
 	{ "name": "input_ptr_106_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_106_val", "role": "default" }} , 
 	{ "name": "input_ptr_138_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_138_val", "role": "default" }} , 
 	{ "name": "input_ptr_170_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_170_val", "role": "default" }} , 
 	{ "name": "input_ptr_202_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_202_val", "role": "default" }} , 
 	{ "name": "input_ptr_11_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_11_val", "role": "default" }} , 
 	{ "name": "input_ptr_43_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_43_val", "role": "default" }} , 
 	{ "name": "input_ptr_75_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_75_val", "role": "default" }} , 
 	{ "name": "input_ptr_107_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_107_val", "role": "default" }} , 
 	{ "name": "input_ptr_139_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_139_val", "role": "default" }} , 
 	{ "name": "input_ptr_171_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_171_val", "role": "default" }} , 
 	{ "name": "input_ptr_203_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_203_val", "role": "default" }} , 
 	{ "name": "input_ptr_12_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_12_val", "role": "default" }} , 
 	{ "name": "input_ptr_44_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_44_val", "role": "default" }} , 
 	{ "name": "input_ptr_76_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_76_val", "role": "default" }} , 
 	{ "name": "input_ptr_108_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_108_val", "role": "default" }} , 
 	{ "name": "input_ptr_140_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_140_val", "role": "default" }} , 
 	{ "name": "input_ptr_172_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_172_val", "role": "default" }} , 
 	{ "name": "input_ptr_204_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_204_val", "role": "default" }} , 
 	{ "name": "input_ptr_13_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_13_val", "role": "default" }} , 
 	{ "name": "input_ptr_45_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_45_val", "role": "default" }} , 
 	{ "name": "input_ptr_77_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_77_val", "role": "default" }} , 
 	{ "name": "input_ptr_109_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_109_val", "role": "default" }} , 
 	{ "name": "input_ptr_141_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_141_val", "role": "default" }} , 
 	{ "name": "input_ptr_173_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_173_val", "role": "default" }} , 
 	{ "name": "input_ptr_205_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_205_val", "role": "default" }} , 
 	{ "name": "input_ptr_14_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_14_val", "role": "default" }} , 
 	{ "name": "input_ptr_46_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_46_val", "role": "default" }} , 
 	{ "name": "input_ptr_78_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_78_val", "role": "default" }} , 
 	{ "name": "input_ptr_110_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_110_val", "role": "default" }} , 
 	{ "name": "input_ptr_142_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_142_val", "role": "default" }} , 
 	{ "name": "input_ptr_174_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_174_val", "role": "default" }} , 
 	{ "name": "input_ptr_206_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_206_val", "role": "default" }} , 
 	{ "name": "input_ptr_15_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_15_val", "role": "default" }} , 
 	{ "name": "input_ptr_47_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_47_val", "role": "default" }} , 
 	{ "name": "input_ptr_79_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_79_val", "role": "default" }} , 
 	{ "name": "input_ptr_111_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_111_val", "role": "default" }} , 
 	{ "name": "input_ptr_143_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_143_val", "role": "default" }} , 
 	{ "name": "input_ptr_175_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_175_val", "role": "default" }} , 
 	{ "name": "input_ptr_207_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_207_val", "role": "default" }} , 
 	{ "name": "input_ptr_16_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_16_val", "role": "default" }} , 
 	{ "name": "input_ptr_48_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_48_val", "role": "default" }} , 
 	{ "name": "input_ptr_80_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_80_val", "role": "default" }} , 
 	{ "name": "input_ptr_112_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_112_val", "role": "default" }} , 
 	{ "name": "input_ptr_144_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_144_val", "role": "default" }} , 
 	{ "name": "input_ptr_176_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_176_val", "role": "default" }} , 
 	{ "name": "input_ptr_208_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_208_val", "role": "default" }} , 
 	{ "name": "input_ptr_17_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_17_val", "role": "default" }} , 
 	{ "name": "input_ptr_49_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_49_val", "role": "default" }} , 
 	{ "name": "input_ptr_81_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_81_val", "role": "default" }} , 
 	{ "name": "input_ptr_113_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_113_val", "role": "default" }} , 
 	{ "name": "input_ptr_145_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_145_val", "role": "default" }} , 
 	{ "name": "input_ptr_177_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_177_val", "role": "default" }} , 
 	{ "name": "input_ptr_209_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_209_val", "role": "default" }} , 
 	{ "name": "input_ptr_18_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_18_val", "role": "default" }} , 
 	{ "name": "input_ptr_50_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_50_val", "role": "default" }} , 
 	{ "name": "input_ptr_82_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_82_val", "role": "default" }} , 
 	{ "name": "input_ptr_114_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_114_val", "role": "default" }} , 
 	{ "name": "input_ptr_146_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_146_val", "role": "default" }} , 
 	{ "name": "input_ptr_178_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_178_val", "role": "default" }} , 
 	{ "name": "input_ptr_210_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_210_val", "role": "default" }} , 
 	{ "name": "input_ptr_19_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_19_val", "role": "default" }} , 
 	{ "name": "input_ptr_51_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_51_val", "role": "default" }} , 
 	{ "name": "input_ptr_83_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_83_val", "role": "default" }} , 
 	{ "name": "input_ptr_115_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_115_val", "role": "default" }} , 
 	{ "name": "input_ptr_147_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_147_val", "role": "default" }} , 
 	{ "name": "input_ptr_179_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_179_val", "role": "default" }} , 
 	{ "name": "input_ptr_211_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_211_val", "role": "default" }} , 
 	{ "name": "input_ptr_20_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_20_val", "role": "default" }} , 
 	{ "name": "input_ptr_52_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_52_val", "role": "default" }} , 
 	{ "name": "input_ptr_84_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_84_val", "role": "default" }} , 
 	{ "name": "input_ptr_116_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_116_val", "role": "default" }} , 
 	{ "name": "input_ptr_148_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_148_val", "role": "default" }} , 
 	{ "name": "input_ptr_180_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_180_val", "role": "default" }} , 
 	{ "name": "input_ptr_212_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_212_val", "role": "default" }} , 
 	{ "name": "input_ptr_21_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_21_val", "role": "default" }} , 
 	{ "name": "input_ptr_53_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_53_val", "role": "default" }} , 
 	{ "name": "input_ptr_85_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_85_val", "role": "default" }} , 
 	{ "name": "input_ptr_117_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_117_val", "role": "default" }} , 
 	{ "name": "input_ptr_149_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_149_val", "role": "default" }} , 
 	{ "name": "input_ptr_181_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_181_val", "role": "default" }} , 
 	{ "name": "input_ptr_213_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_213_val", "role": "default" }} , 
 	{ "name": "input_ptr_22_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_22_val", "role": "default" }} , 
 	{ "name": "input_ptr_54_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_54_val", "role": "default" }} , 
 	{ "name": "input_ptr_86_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_86_val", "role": "default" }} , 
 	{ "name": "input_ptr_118_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_118_val", "role": "default" }} , 
 	{ "name": "input_ptr_150_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_150_val", "role": "default" }} , 
 	{ "name": "input_ptr_182_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_182_val", "role": "default" }} , 
 	{ "name": "input_ptr_214_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_214_val", "role": "default" }} , 
 	{ "name": "input_ptr_23_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_23_val", "role": "default" }} , 
 	{ "name": "input_ptr_55_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_55_val", "role": "default" }} , 
 	{ "name": "input_ptr_87_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_87_val", "role": "default" }} , 
 	{ "name": "input_ptr_119_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_119_val", "role": "default" }} , 
 	{ "name": "input_ptr_151_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_151_val", "role": "default" }} , 
 	{ "name": "input_ptr_183_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_183_val", "role": "default" }} , 
 	{ "name": "input_ptr_215_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_215_val", "role": "default" }} , 
 	{ "name": "input_ptr_24_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_24_val", "role": "default" }} , 
 	{ "name": "input_ptr_56_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_56_val", "role": "default" }} , 
 	{ "name": "input_ptr_88_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_88_val", "role": "default" }} , 
 	{ "name": "input_ptr_120_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_120_val", "role": "default" }} , 
 	{ "name": "input_ptr_152_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_152_val", "role": "default" }} , 
 	{ "name": "input_ptr_184_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_184_val", "role": "default" }} , 
 	{ "name": "input_ptr_216_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_216_val", "role": "default" }} , 
 	{ "name": "input_ptr_25_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_25_val", "role": "default" }} , 
 	{ "name": "input_ptr_57_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_57_val", "role": "default" }} , 
 	{ "name": "input_ptr_89_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_89_val", "role": "default" }} , 
 	{ "name": "input_ptr_121_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_121_val", "role": "default" }} , 
 	{ "name": "input_ptr_153_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_153_val", "role": "default" }} , 
 	{ "name": "input_ptr_185_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_185_val", "role": "default" }} , 
 	{ "name": "input_ptr_217_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_217_val", "role": "default" }} , 
 	{ "name": "input_ptr_26_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_26_val", "role": "default" }} , 
 	{ "name": "input_ptr_58_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_58_val", "role": "default" }} , 
 	{ "name": "input_ptr_90_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_90_val", "role": "default" }} , 
 	{ "name": "input_ptr_122_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_122_val", "role": "default" }} , 
 	{ "name": "input_ptr_154_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_154_val", "role": "default" }} , 
 	{ "name": "input_ptr_186_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_186_val", "role": "default" }} , 
 	{ "name": "input_ptr_218_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_218_val", "role": "default" }} , 
 	{ "name": "input_ptr_27_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_27_val", "role": "default" }} , 
 	{ "name": "input_ptr_59_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_59_val", "role": "default" }} , 
 	{ "name": "input_ptr_91_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_91_val", "role": "default" }} , 
 	{ "name": "input_ptr_123_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_123_val", "role": "default" }} , 
 	{ "name": "input_ptr_155_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_155_val", "role": "default" }} , 
 	{ "name": "input_ptr_187_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_187_val", "role": "default" }} , 
 	{ "name": "input_ptr_219_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_219_val", "role": "default" }} , 
 	{ "name": "input_ptr_28_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_28_val", "role": "default" }} , 
 	{ "name": "input_ptr_60_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_60_val", "role": "default" }} , 
 	{ "name": "input_ptr_92_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_92_val", "role": "default" }} , 
 	{ "name": "input_ptr_124_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_124_val", "role": "default" }} , 
 	{ "name": "input_ptr_156_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_156_val", "role": "default" }} , 
 	{ "name": "input_ptr_188_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_188_val", "role": "default" }} , 
 	{ "name": "input_ptr_220_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_220_val", "role": "default" }} , 
 	{ "name": "input_ptr_29_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_29_val", "role": "default" }} , 
 	{ "name": "input_ptr_61_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_61_val", "role": "default" }} , 
 	{ "name": "input_ptr_93_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_93_val", "role": "default" }} , 
 	{ "name": "input_ptr_125_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_125_val", "role": "default" }} , 
 	{ "name": "input_ptr_157_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_157_val", "role": "default" }} , 
 	{ "name": "input_ptr_189_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_189_val", "role": "default" }} , 
 	{ "name": "input_ptr_221_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_221_val", "role": "default" }} , 
 	{ "name": "input_ptr_30_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_30_val", "role": "default" }} , 
 	{ "name": "input_ptr_62_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_62_val", "role": "default" }} , 
 	{ "name": "input_ptr_94_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_94_val", "role": "default" }} , 
 	{ "name": "input_ptr_126_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_126_val", "role": "default" }} , 
 	{ "name": "input_ptr_158_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_158_val", "role": "default" }} , 
 	{ "name": "input_ptr_190_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_190_val", "role": "default" }} , 
 	{ "name": "input_ptr_222_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_222_val", "role": "default" }} , 
 	{ "name": "input_ptr_31_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_31_val", "role": "default" }} , 
 	{ "name": "input_ptr_63_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_63_val", "role": "default" }} , 
 	{ "name": "input_ptr_95_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_95_val", "role": "default" }} , 
 	{ "name": "input_ptr_127_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_127_val", "role": "default" }} , 
 	{ "name": "input_ptr_159_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_159_val", "role": "default" }} , 
 	{ "name": "input_ptr_191_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_191_val", "role": "default" }} , 
 	{ "name": "input_ptr_223_val", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_ptr_223_val", "role": "default" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }} , 
 	{ "name": "p_out1", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out1", "role": "default" }} , 
 	{ "name": "p_out1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out1", "role": "ap_vld" }} , 
 	{ "name": "p_out2", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out2", "role": "default" }} , 
 	{ "name": "p_out2_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out2", "role": "ap_vld" }} , 
 	{ "name": "p_out3", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out3", "role": "default" }} , 
 	{ "name": "p_out3_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out3", "role": "ap_vld" }} , 
 	{ "name": "p_out4", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out4", "role": "default" }} , 
 	{ "name": "p_out4_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out4", "role": "ap_vld" }} , 
 	{ "name": "p_out5", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out5", "role": "default" }} , 
 	{ "name": "p_out5_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out5", "role": "ap_vld" }} , 
 	{ "name": "p_out6", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out6", "role": "default" }} , 
 	{ "name": "p_out6_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out6", "role": "ap_vld" }} , 
 	{ "name": "p_out7", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out7", "role": "default" }} , 
 	{ "name": "p_out7_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out7", "role": "ap_vld" }} , 
 	{ "name": "p_out8", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out8", "role": "default" }} , 
 	{ "name": "p_out8_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out8", "role": "ap_vld" }} , 
 	{ "name": "p_out9", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out9", "role": "default" }} , 
 	{ "name": "p_out9_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out9", "role": "ap_vld" }} , 
 	{ "name": "p_out10", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out10", "role": "default" }} , 
 	{ "name": "p_out10_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out10", "role": "ap_vld" }} , 
 	{ "name": "p_out11", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out11", "role": "default" }} , 
 	{ "name": "p_out11_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out11", "role": "ap_vld" }} , 
 	{ "name": "p_out12", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out12", "role": "default" }} , 
 	{ "name": "p_out12_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out12", "role": "ap_vld" }} , 
 	{ "name": "p_out13", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out13", "role": "default" }} , 
 	{ "name": "p_out13_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out13", "role": "ap_vld" }} , 
 	{ "name": "p_out14", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out14", "role": "default" }} , 
 	{ "name": "p_out14_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out14", "role": "ap_vld" }} , 
 	{ "name": "p_out15", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out15", "role": "default" }} , 
 	{ "name": "p_out15_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out15", "role": "ap_vld" }} , 
 	{ "name": "p_out16", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out16", "role": "default" }} , 
 	{ "name": "p_out16_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out16", "role": "ap_vld" }} , 
 	{ "name": "p_out17", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out17", "role": "default" }} , 
 	{ "name": "p_out17_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out17", "role": "ap_vld" }} , 
 	{ "name": "p_out18", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out18", "role": "default" }} , 
 	{ "name": "p_out18_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out18", "role": "ap_vld" }} , 
 	{ "name": "p_out19", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out19", "role": "default" }} , 
 	{ "name": "p_out19_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out19", "role": "ap_vld" }} , 
 	{ "name": "p_out20", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out20", "role": "default" }} , 
 	{ "name": "p_out20_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out20", "role": "ap_vld" }} , 
 	{ "name": "p_out21", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out21", "role": "default" }} , 
 	{ "name": "p_out21_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out21", "role": "ap_vld" }} , 
 	{ "name": "p_out22", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out22", "role": "default" }} , 
 	{ "name": "p_out22_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out22", "role": "ap_vld" }} , 
 	{ "name": "p_out23", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out23", "role": "default" }} , 
 	{ "name": "p_out23_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out23", "role": "ap_vld" }} , 
 	{ "name": "p_out24", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out24", "role": "default" }} , 
 	{ "name": "p_out24_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out24", "role": "ap_vld" }} , 
 	{ "name": "p_out25", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out25", "role": "default" }} , 
 	{ "name": "p_out25_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out25", "role": "ap_vld" }} , 
 	{ "name": "p_out26", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out26", "role": "default" }} , 
 	{ "name": "p_out26_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out26", "role": "ap_vld" }} , 
 	{ "name": "p_out27", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out27", "role": "default" }} , 
 	{ "name": "p_out27_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out27", "role": "ap_vld" }} , 
 	{ "name": "p_out28", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out28", "role": "default" }} , 
 	{ "name": "p_out28_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out28", "role": "ap_vld" }} , 
 	{ "name": "p_out29", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out29", "role": "default" }} , 
 	{ "name": "p_out29_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out29", "role": "ap_vld" }} , 
 	{ "name": "p_out30", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out30", "role": "default" }} , 
 	{ "name": "p_out30_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out30", "role": "ap_vld" }} , 
 	{ "name": "p_out31", "direction": "out", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "p_out31", "role": "default" }} , 
 	{ "name": "p_out31_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out31", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65"],
		"CDFG" : "p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_ptr_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_32_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_64_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_96_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_128_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_160_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_192_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub_ln2719", "Type" : "None", "Direction" : "I"},
			{"Name" : "weight_ih_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "input_ptr_1_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_33_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_65_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_97_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_129_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_161_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_193_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_2_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_34_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_66_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_98_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_130_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_162_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_194_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_3_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_35_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_67_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_99_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_131_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_163_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_195_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_4_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_36_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_68_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_100_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_132_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_164_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_196_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_5_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_37_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_69_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_101_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_133_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_165_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_197_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_6_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_38_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_70_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_102_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_134_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_166_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_198_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_7_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_39_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_71_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_103_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_135_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_167_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_199_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_8_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_40_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_72_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_104_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_136_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_168_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_200_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_9_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_41_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_73_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_105_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_137_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_169_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_201_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_10_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_42_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_74_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_106_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_138_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_170_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_202_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_11_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_43_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_75_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_107_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_139_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_171_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_203_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_12_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_44_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_76_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_108_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_140_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_172_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_204_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_13_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_45_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_77_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_109_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_141_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_173_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_205_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_14_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_46_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_78_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_110_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_142_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_174_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_206_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_15_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_47_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_79_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_111_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_143_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_175_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_207_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_16_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_48_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_80_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_112_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_144_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_176_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_208_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_17_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_49_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_81_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_113_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_145_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_177_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_209_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_18_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_50_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_82_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_114_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_146_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_178_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_210_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_19_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_51_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_83_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_115_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_147_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_179_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_211_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_20_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_52_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_84_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_116_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_148_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_180_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_212_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_21_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_53_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_85_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_117_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_149_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_181_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_213_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_22_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_54_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_86_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_118_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_150_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_182_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_214_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_23_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_55_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_87_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_119_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_151_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_183_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_215_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_24_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_56_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_88_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_120_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_152_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_184_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_216_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_25_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_57_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_89_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_121_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_153_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_185_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_217_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_26_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_58_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_90_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_122_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_154_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_186_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_218_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_27_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_59_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_91_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_123_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_155_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_187_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_219_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_28_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_60_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_92_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_124_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_156_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_188_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_220_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_29_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_61_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_93_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_125_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_157_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_189_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_221_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_30_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_62_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_94_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_126_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_158_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_190_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_222_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_31_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_63_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_95_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_127_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_159_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_191_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_ptr_223_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out8", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out9", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out10", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out11", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out12", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out13", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out14", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out15", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out16", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out17", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out18", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out19", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out20", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out21", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out22", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out23", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out24", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out25", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out26", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out27", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out28", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out29", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out30", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out31", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_2713_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1437", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1438", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1439", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1440", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1441", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1442", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1443", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1444", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1445", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1446", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1447", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1448", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1449", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1450", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1451", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1452", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1453", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1454", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1455", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1456", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1457", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1458", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1459", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1460", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1461", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1462", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1463", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1464", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1465", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1466", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1467", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_15_8_16_1_1_U1468", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1469", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1470", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1471", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1472", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1473", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1474", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1475", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1476", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1477", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1478", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1479", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1480", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1481", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1482", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1483", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1484", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1485", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1486", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1487", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1488", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1489", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1490", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1491", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1492", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1493", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1494", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1495", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1496", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1497", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1498", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1499", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_34s_34_3_1_U1500", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_2 {
		input_ptr_0_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_32_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_64_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_96_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_128_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_160_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_192_val {Type I LastRead 0 FirstWrite -1}
		sub_ln2719 {Type I LastRead 0 FirstWrite -1}
		weight_ih_0 {Type I LastRead 0 FirstWrite -1}
		input_ptr_1_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_33_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_65_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_97_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_129_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_161_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_193_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_2_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_34_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_66_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_98_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_130_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_162_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_194_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_3_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_35_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_67_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_99_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_131_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_163_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_195_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_4_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_36_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_68_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_100_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_132_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_164_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_196_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_5_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_37_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_69_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_101_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_133_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_165_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_197_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_6_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_38_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_70_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_102_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_134_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_166_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_198_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_7_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_39_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_71_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_103_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_135_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_167_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_199_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_8_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_40_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_72_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_104_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_136_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_168_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_200_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_9_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_41_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_73_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_105_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_137_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_169_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_201_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_10_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_42_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_74_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_106_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_138_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_170_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_202_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_11_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_43_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_75_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_107_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_139_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_171_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_203_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_12_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_44_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_76_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_108_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_140_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_172_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_204_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_13_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_45_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_77_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_109_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_141_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_173_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_205_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_14_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_46_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_78_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_110_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_142_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_174_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_206_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_15_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_47_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_79_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_111_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_143_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_175_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_207_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_16_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_48_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_80_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_112_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_144_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_176_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_208_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_17_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_49_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_81_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_113_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_145_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_177_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_209_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_18_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_50_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_82_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_114_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_146_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_178_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_210_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_19_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_51_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_83_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_115_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_147_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_179_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_211_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_20_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_52_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_84_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_116_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_148_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_180_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_212_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_21_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_53_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_85_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_117_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_149_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_181_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_213_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_22_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_54_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_86_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_118_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_150_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_182_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_214_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_23_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_55_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_87_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_119_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_151_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_183_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_215_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_24_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_56_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_88_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_120_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_152_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_184_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_216_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_25_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_57_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_89_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_121_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_153_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_185_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_217_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_26_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_58_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_90_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_122_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_154_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_186_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_218_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_27_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_59_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_91_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_123_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_155_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_187_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_219_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_28_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_60_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_92_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_124_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_156_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_188_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_220_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_29_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_61_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_93_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_125_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_157_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_189_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_221_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_30_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_62_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_94_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_126_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_158_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_190_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_222_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_31_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_63_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_95_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_127_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_159_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_191_val {Type I LastRead 0 FirstWrite -1}
		input_ptr_223_val {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 2}
		p_out1 {Type O LastRead -1 FirstWrite 2}
		p_out2 {Type O LastRead -1 FirstWrite 2}
		p_out3 {Type O LastRead -1 FirstWrite 2}
		p_out4 {Type O LastRead -1 FirstWrite 2}
		p_out5 {Type O LastRead -1 FirstWrite 2}
		p_out6 {Type O LastRead -1 FirstWrite 2}
		p_out7 {Type O LastRead -1 FirstWrite 2}
		p_out8 {Type O LastRead -1 FirstWrite 2}
		p_out9 {Type O LastRead -1 FirstWrite 2}
		p_out10 {Type O LastRead -1 FirstWrite 2}
		p_out11 {Type O LastRead -1 FirstWrite 2}
		p_out12 {Type O LastRead -1 FirstWrite 2}
		p_out13 {Type O LastRead -1 FirstWrite 2}
		p_out14 {Type O LastRead -1 FirstWrite 2}
		p_out15 {Type O LastRead -1 FirstWrite 2}
		p_out16 {Type O LastRead -1 FirstWrite 2}
		p_out17 {Type O LastRead -1 FirstWrite 2}
		p_out18 {Type O LastRead -1 FirstWrite 2}
		p_out19 {Type O LastRead -1 FirstWrite 2}
		p_out20 {Type O LastRead -1 FirstWrite 2}
		p_out21 {Type O LastRead -1 FirstWrite 2}
		p_out22 {Type O LastRead -1 FirstWrite 2}
		p_out23 {Type O LastRead -1 FirstWrite 2}
		p_out24 {Type O LastRead -1 FirstWrite 2}
		p_out25 {Type O LastRead -1 FirstWrite 2}
		p_out26 {Type O LastRead -1 FirstWrite 2}
		p_out27 {Type O LastRead -1 FirstWrite 2}
		p_out28 {Type O LastRead -1 FirstWrite 2}
		p_out29 {Type O LastRead -1 FirstWrite 2}
		p_out30 {Type O LastRead -1 FirstWrite 2}
		p_out31 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_ptr_0_val { ap_none {  { input_ptr_0_val in_data 0 16 } } }
	input_ptr_32_val { ap_none {  { input_ptr_32_val in_data 0 16 } } }
	input_ptr_64_val { ap_none {  { input_ptr_64_val in_data 0 16 } } }
	input_ptr_96_val { ap_none {  { input_ptr_96_val in_data 0 16 } } }
	input_ptr_128_val { ap_none {  { input_ptr_128_val in_data 0 16 } } }
	input_ptr_160_val { ap_none {  { input_ptr_160_val in_data 0 16 } } }
	input_ptr_192_val { ap_none {  { input_ptr_192_val in_data 0 16 } } }
	sub_ln2719 { ap_none {  { sub_ln2719 in_data 0 10 } } }
	weight_ih_0 { ap_memory {  { weight_ih_0_address0 mem_address 1 10 }  { weight_ih_0_ce0 mem_ce 1 1 }  { weight_ih_0_q0 in_data 0 512 } } }
	input_ptr_1_val { ap_none {  { input_ptr_1_val in_data 0 16 } } }
	input_ptr_33_val { ap_none {  { input_ptr_33_val in_data 0 16 } } }
	input_ptr_65_val { ap_none {  { input_ptr_65_val in_data 0 16 } } }
	input_ptr_97_val { ap_none {  { input_ptr_97_val in_data 0 16 } } }
	input_ptr_129_val { ap_none {  { input_ptr_129_val in_data 0 16 } } }
	input_ptr_161_val { ap_none {  { input_ptr_161_val in_data 0 16 } } }
	input_ptr_193_val { ap_none {  { input_ptr_193_val in_data 0 16 } } }
	input_ptr_2_val { ap_none {  { input_ptr_2_val in_data 0 16 } } }
	input_ptr_34_val { ap_none {  { input_ptr_34_val in_data 0 16 } } }
	input_ptr_66_val { ap_none {  { input_ptr_66_val in_data 0 16 } } }
	input_ptr_98_val { ap_none {  { input_ptr_98_val in_data 0 16 } } }
	input_ptr_130_val { ap_none {  { input_ptr_130_val in_data 0 16 } } }
	input_ptr_162_val { ap_none {  { input_ptr_162_val in_data 0 16 } } }
	input_ptr_194_val { ap_none {  { input_ptr_194_val in_data 0 16 } } }
	input_ptr_3_val { ap_none {  { input_ptr_3_val in_data 0 16 } } }
	input_ptr_35_val { ap_none {  { input_ptr_35_val in_data 0 16 } } }
	input_ptr_67_val { ap_none {  { input_ptr_67_val in_data 0 16 } } }
	input_ptr_99_val { ap_none {  { input_ptr_99_val in_data 0 16 } } }
	input_ptr_131_val { ap_none {  { input_ptr_131_val in_data 0 16 } } }
	input_ptr_163_val { ap_none {  { input_ptr_163_val in_data 0 16 } } }
	input_ptr_195_val { ap_none {  { input_ptr_195_val in_data 0 16 } } }
	input_ptr_4_val { ap_none {  { input_ptr_4_val in_data 0 16 } } }
	input_ptr_36_val { ap_none {  { input_ptr_36_val in_data 0 16 } } }
	input_ptr_68_val { ap_none {  { input_ptr_68_val in_data 0 16 } } }
	input_ptr_100_val { ap_none {  { input_ptr_100_val in_data 0 16 } } }
	input_ptr_132_val { ap_none {  { input_ptr_132_val in_data 0 16 } } }
	input_ptr_164_val { ap_none {  { input_ptr_164_val in_data 0 16 } } }
	input_ptr_196_val { ap_none {  { input_ptr_196_val in_data 0 16 } } }
	input_ptr_5_val { ap_none {  { input_ptr_5_val in_data 0 16 } } }
	input_ptr_37_val { ap_none {  { input_ptr_37_val in_data 0 16 } } }
	input_ptr_69_val { ap_none {  { input_ptr_69_val in_data 0 16 } } }
	input_ptr_101_val { ap_none {  { input_ptr_101_val in_data 0 16 } } }
	input_ptr_133_val { ap_none {  { input_ptr_133_val in_data 0 16 } } }
	input_ptr_165_val { ap_none {  { input_ptr_165_val in_data 0 16 } } }
	input_ptr_197_val { ap_none {  { input_ptr_197_val in_data 0 16 } } }
	input_ptr_6_val { ap_none {  { input_ptr_6_val in_data 0 16 } } }
	input_ptr_38_val { ap_none {  { input_ptr_38_val in_data 0 16 } } }
	input_ptr_70_val { ap_none {  { input_ptr_70_val in_data 0 16 } } }
	input_ptr_102_val { ap_none {  { input_ptr_102_val in_data 0 16 } } }
	input_ptr_134_val { ap_none {  { input_ptr_134_val in_data 0 16 } } }
	input_ptr_166_val { ap_none {  { input_ptr_166_val in_data 0 16 } } }
	input_ptr_198_val { ap_none {  { input_ptr_198_val in_data 0 16 } } }
	input_ptr_7_val { ap_none {  { input_ptr_7_val in_data 0 16 } } }
	input_ptr_39_val { ap_none {  { input_ptr_39_val in_data 0 16 } } }
	input_ptr_71_val { ap_none {  { input_ptr_71_val in_data 0 16 } } }
	input_ptr_103_val { ap_none {  { input_ptr_103_val in_data 0 16 } } }
	input_ptr_135_val { ap_none {  { input_ptr_135_val in_data 0 16 } } }
	input_ptr_167_val { ap_none {  { input_ptr_167_val in_data 0 16 } } }
	input_ptr_199_val { ap_none {  { input_ptr_199_val in_data 0 16 } } }
	input_ptr_8_val { ap_none {  { input_ptr_8_val in_data 0 16 } } }
	input_ptr_40_val { ap_none {  { input_ptr_40_val in_data 0 16 } } }
	input_ptr_72_val { ap_none {  { input_ptr_72_val in_data 0 16 } } }
	input_ptr_104_val { ap_none {  { input_ptr_104_val in_data 0 16 } } }
	input_ptr_136_val { ap_none {  { input_ptr_136_val in_data 0 16 } } }
	input_ptr_168_val { ap_none {  { input_ptr_168_val in_data 0 16 } } }
	input_ptr_200_val { ap_none {  { input_ptr_200_val in_data 0 16 } } }
	input_ptr_9_val { ap_none {  { input_ptr_9_val in_data 0 16 } } }
	input_ptr_41_val { ap_none {  { input_ptr_41_val in_data 0 16 } } }
	input_ptr_73_val { ap_none {  { input_ptr_73_val in_data 0 16 } } }
	input_ptr_105_val { ap_none {  { input_ptr_105_val in_data 0 16 } } }
	input_ptr_137_val { ap_none {  { input_ptr_137_val in_data 0 16 } } }
	input_ptr_169_val { ap_none {  { input_ptr_169_val in_data 0 16 } } }
	input_ptr_201_val { ap_none {  { input_ptr_201_val in_data 0 16 } } }
	input_ptr_10_val { ap_none {  { input_ptr_10_val in_data 0 16 } } }
	input_ptr_42_val { ap_none {  { input_ptr_42_val in_data 0 16 } } }
	input_ptr_74_val { ap_none {  { input_ptr_74_val in_data 0 16 } } }
	input_ptr_106_val { ap_none {  { input_ptr_106_val in_data 0 16 } } }
	input_ptr_138_val { ap_none {  { input_ptr_138_val in_data 0 16 } } }
	input_ptr_170_val { ap_none {  { input_ptr_170_val in_data 0 16 } } }
	input_ptr_202_val { ap_none {  { input_ptr_202_val in_data 0 16 } } }
	input_ptr_11_val { ap_none {  { input_ptr_11_val in_data 0 16 } } }
	input_ptr_43_val { ap_none {  { input_ptr_43_val in_data 0 16 } } }
	input_ptr_75_val { ap_none {  { input_ptr_75_val in_data 0 16 } } }
	input_ptr_107_val { ap_none {  { input_ptr_107_val in_data 0 16 } } }
	input_ptr_139_val { ap_none {  { input_ptr_139_val in_data 0 16 } } }
	input_ptr_171_val { ap_none {  { input_ptr_171_val in_data 0 16 } } }
	input_ptr_203_val { ap_none {  { input_ptr_203_val in_data 0 16 } } }
	input_ptr_12_val { ap_none {  { input_ptr_12_val in_data 0 16 } } }
	input_ptr_44_val { ap_none {  { input_ptr_44_val in_data 0 16 } } }
	input_ptr_76_val { ap_none {  { input_ptr_76_val in_data 0 16 } } }
	input_ptr_108_val { ap_none {  { input_ptr_108_val in_data 0 16 } } }
	input_ptr_140_val { ap_none {  { input_ptr_140_val in_data 0 16 } } }
	input_ptr_172_val { ap_none {  { input_ptr_172_val in_data 0 16 } } }
	input_ptr_204_val { ap_none {  { input_ptr_204_val in_data 0 16 } } }
	input_ptr_13_val { ap_none {  { input_ptr_13_val in_data 0 16 } } }
	input_ptr_45_val { ap_none {  { input_ptr_45_val in_data 0 16 } } }
	input_ptr_77_val { ap_none {  { input_ptr_77_val in_data 0 16 } } }
	input_ptr_109_val { ap_none {  { input_ptr_109_val in_data 0 16 } } }
	input_ptr_141_val { ap_none {  { input_ptr_141_val in_data 0 16 } } }
	input_ptr_173_val { ap_none {  { input_ptr_173_val in_data 0 16 } } }
	input_ptr_205_val { ap_none {  { input_ptr_205_val in_data 0 16 } } }
	input_ptr_14_val { ap_none {  { input_ptr_14_val in_data 0 16 } } }
	input_ptr_46_val { ap_none {  { input_ptr_46_val in_data 0 16 } } }
	input_ptr_78_val { ap_none {  { input_ptr_78_val in_data 0 16 } } }
	input_ptr_110_val { ap_none {  { input_ptr_110_val in_data 0 16 } } }
	input_ptr_142_val { ap_none {  { input_ptr_142_val in_data 0 16 } } }
	input_ptr_174_val { ap_none {  { input_ptr_174_val in_data 0 16 } } }
	input_ptr_206_val { ap_none {  { input_ptr_206_val in_data 0 16 } } }
	input_ptr_15_val { ap_none {  { input_ptr_15_val in_data 0 16 } } }
	input_ptr_47_val { ap_none {  { input_ptr_47_val in_data 0 16 } } }
	input_ptr_79_val { ap_none {  { input_ptr_79_val in_data 0 16 } } }
	input_ptr_111_val { ap_none {  { input_ptr_111_val in_data 0 16 } } }
	input_ptr_143_val { ap_none {  { input_ptr_143_val in_data 0 16 } } }
	input_ptr_175_val { ap_none {  { input_ptr_175_val in_data 0 16 } } }
	input_ptr_207_val { ap_none {  { input_ptr_207_val in_data 0 16 } } }
	input_ptr_16_val { ap_none {  { input_ptr_16_val in_data 0 16 } } }
	input_ptr_48_val { ap_none {  { input_ptr_48_val in_data 0 16 } } }
	input_ptr_80_val { ap_none {  { input_ptr_80_val in_data 0 16 } } }
	input_ptr_112_val { ap_none {  { input_ptr_112_val in_data 0 16 } } }
	input_ptr_144_val { ap_none {  { input_ptr_144_val in_data 0 16 } } }
	input_ptr_176_val { ap_none {  { input_ptr_176_val in_data 0 16 } } }
	input_ptr_208_val { ap_none {  { input_ptr_208_val in_data 0 16 } } }
	input_ptr_17_val { ap_none {  { input_ptr_17_val in_data 0 16 } } }
	input_ptr_49_val { ap_none {  { input_ptr_49_val in_data 0 16 } } }
	input_ptr_81_val { ap_none {  { input_ptr_81_val in_data 0 16 } } }
	input_ptr_113_val { ap_none {  { input_ptr_113_val in_data 0 16 } } }
	input_ptr_145_val { ap_none {  { input_ptr_145_val in_data 0 16 } } }
	input_ptr_177_val { ap_none {  { input_ptr_177_val in_data 0 16 } } }
	input_ptr_209_val { ap_none {  { input_ptr_209_val in_data 0 16 } } }
	input_ptr_18_val { ap_none {  { input_ptr_18_val in_data 0 16 } } }
	input_ptr_50_val { ap_none {  { input_ptr_50_val in_data 0 16 } } }
	input_ptr_82_val { ap_none {  { input_ptr_82_val in_data 0 16 } } }
	input_ptr_114_val { ap_none {  { input_ptr_114_val in_data 0 16 } } }
	input_ptr_146_val { ap_none {  { input_ptr_146_val in_data 0 16 } } }
	input_ptr_178_val { ap_none {  { input_ptr_178_val in_data 0 16 } } }
	input_ptr_210_val { ap_none {  { input_ptr_210_val in_data 0 16 } } }
	input_ptr_19_val { ap_none {  { input_ptr_19_val in_data 0 16 } } }
	input_ptr_51_val { ap_none {  { input_ptr_51_val in_data 0 16 } } }
	input_ptr_83_val { ap_none {  { input_ptr_83_val in_data 0 16 } } }
	input_ptr_115_val { ap_none {  { input_ptr_115_val in_data 0 16 } } }
	input_ptr_147_val { ap_none {  { input_ptr_147_val in_data 0 16 } } }
	input_ptr_179_val { ap_none {  { input_ptr_179_val in_data 0 16 } } }
	input_ptr_211_val { ap_none {  { input_ptr_211_val in_data 0 16 } } }
	input_ptr_20_val { ap_none {  { input_ptr_20_val in_data 0 16 } } }
	input_ptr_52_val { ap_none {  { input_ptr_52_val in_data 0 16 } } }
	input_ptr_84_val { ap_none {  { input_ptr_84_val in_data 0 16 } } }
	input_ptr_116_val { ap_none {  { input_ptr_116_val in_data 0 16 } } }
	input_ptr_148_val { ap_none {  { input_ptr_148_val in_data 0 16 } } }
	input_ptr_180_val { ap_none {  { input_ptr_180_val in_data 0 16 } } }
	input_ptr_212_val { ap_none {  { input_ptr_212_val in_data 0 16 } } }
	input_ptr_21_val { ap_none {  { input_ptr_21_val in_data 0 16 } } }
	input_ptr_53_val { ap_none {  { input_ptr_53_val in_data 0 16 } } }
	input_ptr_85_val { ap_none {  { input_ptr_85_val in_data 0 16 } } }
	input_ptr_117_val { ap_none {  { input_ptr_117_val in_data 0 16 } } }
	input_ptr_149_val { ap_none {  { input_ptr_149_val in_data 0 16 } } }
	input_ptr_181_val { ap_none {  { input_ptr_181_val in_data 0 16 } } }
	input_ptr_213_val { ap_none {  { input_ptr_213_val in_data 0 16 } } }
	input_ptr_22_val { ap_none {  { input_ptr_22_val in_data 0 16 } } }
	input_ptr_54_val { ap_none {  { input_ptr_54_val in_data 0 16 } } }
	input_ptr_86_val { ap_none {  { input_ptr_86_val in_data 0 16 } } }
	input_ptr_118_val { ap_none {  { input_ptr_118_val in_data 0 16 } } }
	input_ptr_150_val { ap_none {  { input_ptr_150_val in_data 0 16 } } }
	input_ptr_182_val { ap_none {  { input_ptr_182_val in_data 0 16 } } }
	input_ptr_214_val { ap_none {  { input_ptr_214_val in_data 0 16 } } }
	input_ptr_23_val { ap_none {  { input_ptr_23_val in_data 0 16 } } }
	input_ptr_55_val { ap_none {  { input_ptr_55_val in_data 0 16 } } }
	input_ptr_87_val { ap_none {  { input_ptr_87_val in_data 0 16 } } }
	input_ptr_119_val { ap_none {  { input_ptr_119_val in_data 0 16 } } }
	input_ptr_151_val { ap_none {  { input_ptr_151_val in_data 0 16 } } }
	input_ptr_183_val { ap_none {  { input_ptr_183_val in_data 0 16 } } }
	input_ptr_215_val { ap_none {  { input_ptr_215_val in_data 0 16 } } }
	input_ptr_24_val { ap_none {  { input_ptr_24_val in_data 0 16 } } }
	input_ptr_56_val { ap_none {  { input_ptr_56_val in_data 0 16 } } }
	input_ptr_88_val { ap_none {  { input_ptr_88_val in_data 0 16 } } }
	input_ptr_120_val { ap_none {  { input_ptr_120_val in_data 0 16 } } }
	input_ptr_152_val { ap_none {  { input_ptr_152_val in_data 0 16 } } }
	input_ptr_184_val { ap_none {  { input_ptr_184_val in_data 0 16 } } }
	input_ptr_216_val { ap_none {  { input_ptr_216_val in_data 0 16 } } }
	input_ptr_25_val { ap_none {  { input_ptr_25_val in_data 0 16 } } }
	input_ptr_57_val { ap_none {  { input_ptr_57_val in_data 0 16 } } }
	input_ptr_89_val { ap_none {  { input_ptr_89_val in_data 0 16 } } }
	input_ptr_121_val { ap_none {  { input_ptr_121_val in_data 0 16 } } }
	input_ptr_153_val { ap_none {  { input_ptr_153_val in_data 0 16 } } }
	input_ptr_185_val { ap_none {  { input_ptr_185_val in_data 0 16 } } }
	input_ptr_217_val { ap_none {  { input_ptr_217_val in_data 0 16 } } }
	input_ptr_26_val { ap_none {  { input_ptr_26_val in_data 0 16 } } }
	input_ptr_58_val { ap_none {  { input_ptr_58_val in_data 0 16 } } }
	input_ptr_90_val { ap_none {  { input_ptr_90_val in_data 0 16 } } }
	input_ptr_122_val { ap_none {  { input_ptr_122_val in_data 0 16 } } }
	input_ptr_154_val { ap_none {  { input_ptr_154_val in_data 0 16 } } }
	input_ptr_186_val { ap_none {  { input_ptr_186_val in_data 0 16 } } }
	input_ptr_218_val { ap_none {  { input_ptr_218_val in_data 0 16 } } }
	input_ptr_27_val { ap_none {  { input_ptr_27_val in_data 0 16 } } }
	input_ptr_59_val { ap_none {  { input_ptr_59_val in_data 0 16 } } }
	input_ptr_91_val { ap_none {  { input_ptr_91_val in_data 0 16 } } }
	input_ptr_123_val { ap_none {  { input_ptr_123_val in_data 0 16 } } }
	input_ptr_155_val { ap_none {  { input_ptr_155_val in_data 0 16 } } }
	input_ptr_187_val { ap_none {  { input_ptr_187_val in_data 0 16 } } }
	input_ptr_219_val { ap_none {  { input_ptr_219_val in_data 0 16 } } }
	input_ptr_28_val { ap_none {  { input_ptr_28_val in_data 0 16 } } }
	input_ptr_60_val { ap_none {  { input_ptr_60_val in_data 0 16 } } }
	input_ptr_92_val { ap_none {  { input_ptr_92_val in_data 0 16 } } }
	input_ptr_124_val { ap_none {  { input_ptr_124_val in_data 0 16 } } }
	input_ptr_156_val { ap_none {  { input_ptr_156_val in_data 0 16 } } }
	input_ptr_188_val { ap_none {  { input_ptr_188_val in_data 0 16 } } }
	input_ptr_220_val { ap_none {  { input_ptr_220_val in_data 0 16 } } }
	input_ptr_29_val { ap_none {  { input_ptr_29_val in_data 0 16 } } }
	input_ptr_61_val { ap_none {  { input_ptr_61_val in_data 0 16 } } }
	input_ptr_93_val { ap_none {  { input_ptr_93_val in_data 0 16 } } }
	input_ptr_125_val { ap_none {  { input_ptr_125_val in_data 0 16 } } }
	input_ptr_157_val { ap_none {  { input_ptr_157_val in_data 0 16 } } }
	input_ptr_189_val { ap_none {  { input_ptr_189_val in_data 0 16 } } }
	input_ptr_221_val { ap_none {  { input_ptr_221_val in_data 0 16 } } }
	input_ptr_30_val { ap_none {  { input_ptr_30_val in_data 0 16 } } }
	input_ptr_62_val { ap_none {  { input_ptr_62_val in_data 0 16 } } }
	input_ptr_94_val { ap_none {  { input_ptr_94_val in_data 0 16 } } }
	input_ptr_126_val { ap_none {  { input_ptr_126_val in_data 0 16 } } }
	input_ptr_158_val { ap_none {  { input_ptr_158_val in_data 0 16 } } }
	input_ptr_190_val { ap_none {  { input_ptr_190_val in_data 0 16 } } }
	input_ptr_222_val { ap_none {  { input_ptr_222_val in_data 0 16 } } }
	input_ptr_31_val { ap_none {  { input_ptr_31_val in_data 0 16 } } }
	input_ptr_63_val { ap_none {  { input_ptr_63_val in_data 0 16 } } }
	input_ptr_95_val { ap_none {  { input_ptr_95_val in_data 0 16 } } }
	input_ptr_127_val { ap_none {  { input_ptr_127_val in_data 0 16 } } }
	input_ptr_159_val { ap_none {  { input_ptr_159_val in_data 0 16 } } }
	input_ptr_191_val { ap_none {  { input_ptr_191_val in_data 0 16 } } }
	input_ptr_223_val { ap_none {  { input_ptr_223_val in_data 0 16 } } }
	p_out { ap_vld {  { p_out out_data 1 34 }  { p_out_ap_vld out_vld 1 1 } } }
	p_out1 { ap_vld {  { p_out1 out_data 1 34 }  { p_out1_ap_vld out_vld 1 1 } } }
	p_out2 { ap_vld {  { p_out2 out_data 1 34 }  { p_out2_ap_vld out_vld 1 1 } } }
	p_out3 { ap_vld {  { p_out3 out_data 1 34 }  { p_out3_ap_vld out_vld 1 1 } } }
	p_out4 { ap_vld {  { p_out4 out_data 1 34 }  { p_out4_ap_vld out_vld 1 1 } } }
	p_out5 { ap_vld {  { p_out5 out_data 1 34 }  { p_out5_ap_vld out_vld 1 1 } } }
	p_out6 { ap_vld {  { p_out6 out_data 1 34 }  { p_out6_ap_vld out_vld 1 1 } } }
	p_out7 { ap_vld {  { p_out7 out_data 1 34 }  { p_out7_ap_vld out_vld 1 1 } } }
	p_out8 { ap_vld {  { p_out8 out_data 1 34 }  { p_out8_ap_vld out_vld 1 1 } } }
	p_out9 { ap_vld {  { p_out9 out_data 1 34 }  { p_out9_ap_vld out_vld 1 1 } } }
	p_out10 { ap_vld {  { p_out10 out_data 1 34 }  { p_out10_ap_vld out_vld 1 1 } } }
	p_out11 { ap_vld {  { p_out11 out_data 1 34 }  { p_out11_ap_vld out_vld 1 1 } } }
	p_out12 { ap_vld {  { p_out12 out_data 1 34 }  { p_out12_ap_vld out_vld 1 1 } } }
	p_out13 { ap_vld {  { p_out13 out_data 1 34 }  { p_out13_ap_vld out_vld 1 1 } } }
	p_out14 { ap_vld {  { p_out14 out_data 1 34 }  { p_out14_ap_vld out_vld 1 1 } } }
	p_out15 { ap_vld {  { p_out15 out_data 1 34 }  { p_out15_ap_vld out_vld 1 1 } } }
	p_out16 { ap_vld {  { p_out16 out_data 1 34 }  { p_out16_ap_vld out_vld 1 1 } } }
	p_out17 { ap_vld {  { p_out17 out_data 1 34 }  { p_out17_ap_vld out_vld 1 1 } } }
	p_out18 { ap_vld {  { p_out18 out_data 1 34 }  { p_out18_ap_vld out_vld 1 1 } } }
	p_out19 { ap_vld {  { p_out19 out_data 1 34 }  { p_out19_ap_vld out_vld 1 1 } } }
	p_out20 { ap_vld {  { p_out20 out_data 1 34 }  { p_out20_ap_vld out_vld 1 1 } } }
	p_out21 { ap_vld {  { p_out21 out_data 1 34 }  { p_out21_ap_vld out_vld 1 1 } } }
	p_out22 { ap_vld {  { p_out22 out_data 1 34 }  { p_out22_ap_vld out_vld 1 1 } } }
	p_out23 { ap_vld {  { p_out23 out_data 1 34 }  { p_out23_ap_vld out_vld 1 1 } } }
	p_out24 { ap_vld {  { p_out24 out_data 1 34 }  { p_out24_ap_vld out_vld 1 1 } } }
	p_out25 { ap_vld {  { p_out25 out_data 1 34 }  { p_out25_ap_vld out_vld 1 1 } } }
	p_out26 { ap_vld {  { p_out26 out_data 1 34 }  { p_out26_ap_vld out_vld 1 1 } } }
	p_out27 { ap_vld {  { p_out27 out_data 1 34 }  { p_out27_ap_vld out_vld 1 1 } } }
	p_out28 { ap_vld {  { p_out28 out_data 1 34 }  { p_out28_ap_vld out_vld 1 1 } } }
	p_out29 { ap_vld {  { p_out29 out_data 1 34 }  { p_out29_ap_vld out_vld 1 1 } } }
	p_out30 { ap_vld {  { p_out30 out_data 1 34 }  { p_out30_ap_vld out_vld 1 1 } } }
	p_out31 { ap_vld {  { p_out31 out_data 1 34 }  { p_out31_ap_vld out_vld 1 1 } } }
}
