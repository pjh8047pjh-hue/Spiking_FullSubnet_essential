set ModuleHierarchy {[{
"Name" : "SubbandRealtimeTopQ610Ip","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_fu_252","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_2450_1","ID" : "2","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2453_2_fu_84","ID" : "3","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2453_2","ID" : "4","Type" : "pipeline"},]},
		{"Name" : "grp_p_anonymous_namespace_ReadRealtimeInputChunkQ610_Pipeline_VITIS_LOOP_2457_3_fu_99","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2457_3","ID" : "6","Type" : "pipeline"},]},]},]},
	{"Name" : "grp_p_anonymous_namespace_ClearRealtimeStatesQ610_fu_277","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_2489_1_VITIS_LOOP_2490_2_VITIS_LOOP_2491_3","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_p_anonymous_namespace_RunRealtimeBandQ610_fu_297","ID" : "9","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_fu_202","ID" : "10","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_2889_1","ID" : "11","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_fu_2614","ID" : "12","Type" : "sequential",
					"SubInsts" : [
					{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2513_1_s_fu_80","ID" : "13","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2513_1_VITIS_LOOP_2514_2","ID" : "14","Type" : "pipeline"},]},
					{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2534_5_s_fu_94","ID" : "15","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2534_5_VITIS_LOOP_2535_6","ID" : "16","Type" : "pipeline"},]},
					{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2555_9_s_fu_106","ID" : "17","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2555_9_VITIS_LOOP_2556_10","ID" : "18","Type" : "pipeline"},]},
					{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2569_12_fu_118","ID" : "19","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2569_12","ID" : "20","Type" : "pipeline"},]},
					{"Name" : "grp_p_anonymous_namespace_LoadRealtimeGSULayerWeightsQ610_Pipeline_VITIS_LOOP_2580_14_fu_130","ID" : "21","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2580_14","ID" : "22","Type" : "pipeline"},]},]},],
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_2894_2","ID" : "23","Type" : "no",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2897_3","ID" : "24","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUCellSharedQ610_fu_2044","ID" : "25","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUCellFixedQ610_224_2_32_32_true_s_fu_1938","ID" : "26","Type" : "sequential",
								"SubInsts" : [
								{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_s_fu_3760","ID" : "27","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_p_anonymous_namespace_SnapshotGSUStateQ610_2_Pipeline_VITIS_LOOP_1927_1_fu_990","ID" : "28","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "VITIS_LOOP_1927_1","ID" : "29","Type" : "pipeline"},]},]},
								{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_224_2_32_32_s_fu_4236","ID" : "30","Type" : "sequential",
									"SubLoops" : [
									{"Name" : "VITIS_LOOP_2740_1","ID" : "31","Type" : "no",
									"SubInsts" : [
									{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_2_fu_4173","ID" : "32","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "VITIS_LOOP_2713_2","ID" : "33","Type" : "pipeline"},]},
									{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_27_fu_4436","ID" : "34","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "VITIS_LOOP_2713_2","ID" : "35","Type" : "pipeline"},]},
									{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_28_fu_4699","ID" : "36","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "VITIS_LOOP_2713_2","ID" : "37","Type" : "pipeline"},]},
									{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSUMacPhaseFixedQ610_Pipeline_VITIS_LOOP_2713_29_fu_4962","ID" : "38","Type" : "sequential",
											"SubLoops" : [
											{"Name" : "VITIS_LOOP_2713_2","ID" : "39","Type" : "pipeline"},]},]},]},
								{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_2_true_s_fu_4921","ID" : "40","Type" : "sequential",
									"SubInsts" : [
									{"Name" : "grp_p_anonymous_namespace_RunGSUGatePhaseBand0Q610_Pipeline_VITIS_LOOP_1887_1_fu_1954","ID" : "41","Type" : "sequential",
										"SubLoops" : [
										{"Name" : "VITIS_LOOP_1887_1","ID" : "42","Type" : "pipeline"},]},]},]},]},
					{"Name" : "grp_p_anonymous_namespace_RunRealtimeGSULayersSharedBandQ610_Pipeline_VITIS_LOOP_2801_fu_2642","ID" : "43","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_2801_1","ID" : "44","Type" : "pipeline"},]},
					{"Name" : "grp_p_anonymous_namespace_BuildRealtimeBandInputQ610_fu_3099","ID" : "45","Type" : "sequential",
							"SubInsts" : [
							{"Name" : "grp_p_anonymous_namespace_BuildRealtimeBandInputQ610_Pipeline_VITIS_LOOP_2651_1_fu_522","ID" : "46","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_2651_1","ID" : "47","Type" : "pipeline"},]},]},]},]},]},]},
		{"Name" : "grp_p_anonymous_namespace_LoadRealtimeProjectionWeightsQ610_fu_277","ID" : "48","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_p_anonymous_namespace_LoadRealtimeProjectionWeightsQ610_Pipeline_VITIS_LOOP_2599_s_fu_88","ID" : "49","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2599_1_VITIS_LOOP_2600_2","ID" : "50","Type" : "pipeline"},]},
			{"Name" : "grp_p_anonymous_namespace_LoadRealtimeProjectionWeightsQ610_Pipeline_VITIS_LOOP_2624_s_fu_102","ID" : "51","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2624_5","ID" : "52","Type" : "pipeline"},]},]},
		{"Name" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_fu_305","ID" : "53","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_3041_1","ID" : "54","Type" : "no",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_3044_2","ID" : "55","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_2801_1_fu_2307","ID" : "56","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_2801_1","ID" : "57","Type" : "pipeline"},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_3050_3","ID" : "58","Type" : "no",
					"SubInsts" : [
					{"Name" : "grp_p_anonymous_namespace_RunRealtimeProjectionBandQ610_Pipeline_VITIS_LOOP_3012_2_fu_2764","ID" : "59","Type" : "sequential",
							"SubLoops" : [
							{"Name" : "VITIS_LOOP_3012_2","ID" : "60","Type" : "pipeline"},]},]},]},]},]},]},
	{"Name" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_fu_409","ID" : "61","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_2470_1","ID" : "62","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_p_anonymous_namespace_EmitRealtimeOutputChunkQ610_Pipeline_VITIS_LOOP_2473_2_fu_78","ID" : "63","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_2473_2","ID" : "64","Type" : "pipeline"},]},]},]},]
}]}