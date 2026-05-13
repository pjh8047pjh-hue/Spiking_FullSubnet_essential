# ANN vs SNN vs Q6.10 SNN Speech Metrics

| Model | WB-PESQ | STOI | SI-SDR (dB) | Delta WB-PESQ vs Noisy | Delta STOI vs Noisy | Delta SI-SDR vs Noisy |
|:---|---:|---:|---:|---:|---:|---:|
| Noisy | 1.412 | 0.866 | 1.07 | +0.000 | +0.000 | +0.00 |
| ANN FullSubNet | 2.392 | 0.943 | 11.72 | +0.980 | +0.077 | +10.65 |
| SNN | 1.507 | 0.818 | 5.92 | +0.095 | -0.048 | +4.86 |
| SNN Q6.10 | 1.488 | 0.798 | 5.52 | +0.076 | -0.068 | +4.45 |

## Sanity Checks

- ANN vs SNN RMSE: `0.00840323`
- ANN vs SNN SNR: `6.537 dB`
- Q6.10 vs SNN RMSE: `0.00448594`
- Q6.10 vs SNN SNR: `11.989 dB`
- Noisy SNR vs clean: `1.052 dB`
- ANN inference time: `11.120786 s`
- SNN inference time: `3.154204 s`
- Clean vs car-noise power SNR: `1.052 dB`
- Q6.10 inference time: `1.064775 s`

## Outputs

- ANN enhanced wav: `C:\Users\User\Documents\새 폴더\Spiking_FullSubnet_Q6.10\energy_measure\speech_metrics_result\ann_fullsubnet_enhanced.wav`
- SNN enhanced wav: `C:\Users\User\Documents\새 폴더\Spiking_FullSubnet_Q6.10\energy_measure\speech_metrics_result\snn_enhanced.wav`
- Q6.10 enhanced wav: `C:\Users\User\Documents\새 폴더\Spiking_FullSubnet_Q6.10\energy_measure\speech_metrics_result\q610_full_infer_enhanced.wav`
