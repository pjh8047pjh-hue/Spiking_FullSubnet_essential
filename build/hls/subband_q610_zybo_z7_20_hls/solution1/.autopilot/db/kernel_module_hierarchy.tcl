set ModuleHierarchy {[{
"Name" : "SubbandBand0TopQ610","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_p_anonymous_namespace_LoadBand0Weights2DQ610_fu_278","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_224_38_s_fu_186","ID" : "2","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_Pipeline_VITIS_LOOP_1705_1_VITIS_LOOP_1706_2_1_fu_61","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1705_1_VITIS_LOOP_1706_2","ID" : "4","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_224_224_s_fu_198","ID" : "5","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_Pipeline_VITIS_LOOP_1705_1_VITIS_LOOP_1706_2_2_fu_67","ID" : "6","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1705_1_VITIS_LOOP_1706_2","ID" : "7","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_2_224_s_fu_216","ID" : "8","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_Pipeline_VITIS_LOOP_1705_1_VITIS_LOOP_1706_2_3_fu_57","ID" : "9","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1705_1_VITIS_LOOP_1706_2","ID" : "10","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadVectorQ610_224_s_fu_231","ID" : "11","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadVectorQ610_224_Pipeline_VITIS_LOOP_1716_1_fu_57","ID" : "12","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1716_1","ID" : "13","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_40_224_s_fu_252","ID" : "14","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadMatrixQ610_Pipeline_VITIS_LOOP_1705_1_VITIS_LOOP_1706_2_fu_61","ID" : "15","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1705_1_VITIS_LOOP_1706_2","ID" : "16","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadVectorQ610_40_s_fu_262","ID" : "17","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadVectorQ610_40_Pipeline_VITIS_LOOP_1716_1_fu_51","ID" : "18","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1716_1","ID" : "19","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_p_anonymous_namespace_RunBand0OptimizedCoreQ610_fu_340","ID" : "20","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_p_anonymous_namespace_RunBand0OptimizedDataflowQ610_fu_122","ID" : "21","Type" : "dataflow",
			"SubInsts" : [
			{"Name" : "p_anonymous_namespace_GenerateBand0SequenceStreamOptimizedQ610_U0","ID" : "22","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1798_1_VITIS_LOOP_1800_2","ID" : "23","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_p_anonymous_namespace_GenerateBand0SequenceStreamOptimizedQ610_Pipeline_VITIS_LOO_1_fu_90","ID" : "24","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1802_3","ID" : "25","Type" : "pipeline"},]},
				{"Name" : "grp_p_anonymous_namespace_GenerateBand0SequenceStreamOptimizedQ610_Pipeline_VITIS_LOO_fu_101","ID" : "26","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1810_4","ID" : "27","Type" : "pipeline"},]},]},]},
			{"Name" : "p_anonymous_namespace_RunGSULayer0StreamParallelQ610_U0","ID" : "28","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_1980_1_VITIS_LOOP_1982_2","ID" : "29","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_p_anonymous_namespace_RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1765_1_fu_398","ID" : "30","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1765_1","ID" : "31","Type" : "pipeline"},]},
				{"Name" : "grp_p_anonymous_namespace_RunGSUCellBand0ParallelQ610_38_2_4_32_true_s_fu_480","ID" : "32","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_s_fu_2176","ID" : "33","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_Pipeline_VITIS_LOOP_1927_1_fu_948","ID" : "34","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_1927_1","ID" : "35","Type" : "pipeline"},]},]},
						{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_38_2_4_32_s_fu_2644","ID" : "36","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_1860_1","ID" : "37","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2_fu_2469","ID" : "38","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "39","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_25_fu_2518","ID" : "40","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "41","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_26_fu_2781","ID" : "42","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "43","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_27_fu_2830","ID" : "44","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "45","Type" : "pipeline"},]},]},]},
						{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_2_true_s_fu_2957","ID" : "46","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_Pipeline_VITIS_LOOP_1887_1_fu_1884","ID" : "47","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_1887_1","ID" : "48","Type" : "pipeline"},]},]},]},
				{"Name" : "grp_p_anonymous_namespace_RunGSULayer0StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1_fu_557","ID" : "49","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1774_1","ID" : "50","Type" : "pipeline"},]},]},]},
			{"Name" : "p_anonymous_namespace_RunGSULayer1StreamParallelQ610_U0","ID" : "51","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2015_1_VITIS_LOOP_2017_2","ID" : "52","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_p_anonymous_namespace_RunGSULayer1StreamParallelQ610_Pipeline_VITIS_LOOP_1765_1_fu_1886","ID" : "53","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1765_1","ID" : "54","Type" : "pipeline"},]},
				{"Name" : "grp_p_anonymous_namespace_RunGSUCellBand0ParallelQ610_224_2_32_32_true_s_fu_2340","ID" : "55","Type" : "sequential",
						"SubInsts" : [
						{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_s_fu_3664","ID" : "56","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_Pipeline_VITIS_LOOP_1927_1_fu_948","ID" : "57","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_1927_1","ID" : "58","Type" : "pipeline"},]},]},
						{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_224_2_32_32_s_fu_4132","ID" : "59","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_1860_1","ID" : "60","Type" : "no",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_2_1_fu_4177","ID" : "61","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "62","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_28_fu_4440","ID" : "63","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "64","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_29_fu_4703","ID" : "65","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "66","Type" : "pipeline"},]},
							{"Name" : "grp_p_anonymous_namespace_RunGSUMacPhaseBand0Q610_Pipeline_VITIS_LOOP_1833_210_fu_4966","ID" : "67","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_1833_2","ID" : "68","Type" : "pipeline"},]},]},]},
						{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_2_true_s_fu_4817","ID" : "69","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_Pipeline_VITIS_LOOP_1887_1_fu_1884","ID" : "70","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_1887_1","ID" : "71","Type" : "pipeline"},]},]},]},
				{"Name" : "grp_p_anonymous_namespace_RunGSULayer1StreamParallelQ610_Pipeline_VITIS_LOOP_1774_1_fu_2603","ID" : "72","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1774_1","ID" : "73","Type" : "pipeline"},]},]},]},
			{"Name" : "entry_proc_U0","ID" : "74","Type" : "sequential"},
			{"Name" : "p_anonymous_namespace_RunProjectionStoreBand0StreamParallelQ610_U0","ID" : "75","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2073_1_VITIS_LOOP_2075_2","ID" : "76","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_p_anonymous_namespace_RunProjectionStoreBand0StreamParallelQ610_Pipeline_VITIS_LO_1_fu_1896","ID" : "77","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_1765_1","ID" : "78","Type" : "pipeline"},]},
				{"Name" : "grp_p_anonymous_namespace_RunProjectionStoreBand0StreamParallelQ610_Pipeline_VITIS_LO_fu_2350","ID" : "79","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2077_3_VITIS_LOOP_2047_2","ID" : "80","Type" : "pipeline"},]},]},]},]},]},]
}]}