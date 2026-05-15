#ifndef SUBBAND_REF_Q610_HPP
#define SUBBAND_REF_Q610_HPP

#include <cassert>
#ifndef __SYNTHESIS__
#include <condition_variable>
#include <mutex>
#include <thread>
#endif
#include <cstddef>
#include <cstdint>
#include "ap_int.h"
#ifndef __SYNTHESIS__
#ifndef _GLIBCXX_HAS_GTHREADS
namespace std {
namespace this_thread {
template <typename Rep, typename Period>
inline void sleep_for(const chrono::duration<Rep, Period>&) {}
}  // namespace this_thread
}  // namespace std
#endif
#ifndef HLS_STREAM_THREAD_UNSAFE
#define HLS_STREAM_THREAD_UNSAFE
#endif
#endif
#include "ap_axi_sdata.h"
#include "hls_stream.h"

namespace subband_q610 {

using q_data_t = ap_int<16>;
using accum_q_t = ap_int<48>;
using axis_q610_t = ap_axiu<16, 0, 0, 0>;
using packed_weight_word_t = ap_uint<256>;

constexpr int kQFrac = 10;
constexpr int kQScale = 1 << kQFrac;
const q_data_t kQZero = 0;
const q_data_t kQOne = static_cast<q_data_t>(1 << kQFrac);

constexpr int kNumBands = 3;
constexpr int kNumChannels = 1;
constexpr int kNumSpks = 1;
constexpr int kNumFreqs = 256;
constexpr int kSbHiddenSize = 224;
constexpr int kSbNumLayers = 2;

constexpr int kFixedBatchSize = 1;
constexpr int kFixedNumFrames = 2415;
constexpr int kRealtimeChunkFrames = 4;
constexpr int kRealtimeWeightWordLanes = 16;

constexpr int kBand0NumSubbands = 8;
constexpr int kBand0CtrFreq = 4;
constexpr int kBand0NoisyFreqSize = 34;
constexpr int kBand0FbFreqSize = 4;
constexpr int kBand0PackedInputSize = 38;
constexpr int kBand0ProjSize = 40;
constexpr int kBand0DfOrder = 5;
constexpr int kBand0TotalFreqs = kBand0NumSubbands * kBand0CtrFreq;

constexpr int kBand1NumSubbands = 3;
constexpr int kBand1CtrFreq = 32;
constexpr int kBand1NoisyFreqSize = 62;
constexpr int kBand1FbFreqSize = 32;
constexpr int kBand1PackedInputSize = 94;
constexpr int kBand1ProjSize = 192;
constexpr int kBand1DfOrder = 3;
constexpr int kBand1TotalFreqs = kBand1NumSubbands * kBand1CtrFreq;

constexpr int kBand2NumSubbands = 2;
constexpr int kBand2CtrFreq = 64;
constexpr int kBand2NoisyFreqSize = 94;
constexpr int kBand2FbFreqSize = 64;
constexpr int kBand2PackedInputSize = 158;
constexpr int kBand2ProjSize = 128;
constexpr int kBand2DfOrder = 1;
constexpr int kBand2TotalFreqs = kBand2NumSubbands * kBand2CtrFreq;

constexpr int kBand0InputElementCount = kFixedBatchSize * kNumFreqs * kFixedNumFrames;
constexpr int kBand0NoisySubbandsElementCount =
    kFixedBatchSize * kBand0NumSubbands * kBand0NoisyFreqSize * kFixedNumFrames;
constexpr int kBand0FbSubbandsElementCount =
    kFixedBatchSize * kBand0NumSubbands * kBand0FbFreqSize * kFixedNumFrames;
constexpr int kBand0SbInputElementCount =
    kFixedBatchSize * kBand0NumSubbands * kBand0PackedInputSize * kFixedNumFrames;
constexpr int kBand0PackedInputElementCount =
    kFixedBatchSize * kBand0NumSubbands * kBand0PackedInputSize * kFixedNumFrames;
constexpr int kBand0SequenceElementCount =
    kFixedNumFrames * kBand0NumSubbands * kBand0PackedInputSize;
constexpr int kBand0StateElementCount = kBand0NumSubbands * kSbHiddenSize;
constexpr int kBand0LayerOutputElementCount = kFixedNumFrames * kBand0NumSubbands * kSbHiddenSize;
constexpr int kBand0DfCoefElementCount =
    kFixedBatchSize * kBand0DfOrder * kNumSpks * kBand0TotalFreqs * kFixedNumFrames * 2;

constexpr int kBand1DfCoefElementCount =
    kFixedBatchSize * kBand1DfOrder * kNumSpks * kBand1TotalFreqs * kFixedNumFrames * 2;
constexpr int kBand2DfCoefElementCount =
    kFixedBatchSize * kBand2DfOrder * kNumSpks * kBand2TotalFreqs * kFixedNumFrames * 2;

constexpr int kBand0RealtimeDfCoefPerFrame = kBand0DfOrder * kBand0TotalFreqs * 2;
constexpr int kBand1RealtimeDfCoefPerFrame = kBand1DfOrder * kBand1TotalFreqs * 2;
constexpr int kBand2RealtimeDfCoefPerFrame = kBand2DfOrder * kBand2TotalFreqs * 2;
constexpr int kRealtimeDfCoefPerFrame =
    kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame + kBand2RealtimeDfCoefPerFrame;
constexpr int kBand0RealtimeDfCoefOffset = 0;
constexpr int kBand1RealtimeDfCoefOffset = kBand0RealtimeDfCoefPerFrame;
constexpr int kBand2RealtimeDfCoefOffset = kBand0RealtimeDfCoefPerFrame + kBand1RealtimeDfCoefPerFrame;
constexpr int kRealtimeDfCoefChunkCount = kRealtimeChunkFrames * kRealtimeDfCoefPerFrame;

constexpr int RoundUpRealtimeWeightElements(int count) {
  return ((count + kRealtimeWeightWordLanes - 1) / kRealtimeWeightWordLanes) * kRealtimeWeightWordLanes;
}

constexpr int GetRealtimeBandWeightCount(int, int proj_size) {
  return (kSbHiddenSize * kSbHiddenSize) + (kSbHiddenSize * kSbHiddenSize) + (2 * kSbHiddenSize) +
         kSbHiddenSize + kSbHiddenSize + (kSbHiddenSize * kSbHiddenSize) +
         (kSbHiddenSize * kSbHiddenSize) + (2 * kSbHiddenSize) + kSbHiddenSize + kSbHiddenSize +
         (proj_size * kSbHiddenSize) + RoundUpRealtimeWeightElements(proj_size);
}

constexpr int kBand0RealtimeWeightCount = GetRealtimeBandWeightCount(kBand0PackedInputSize, kBand0ProjSize);
constexpr int kBand1RealtimeWeightCount = GetRealtimeBandWeightCount(kBand1PackedInputSize, kBand1ProjSize);
constexpr int kBand2RealtimeWeightCount = GetRealtimeBandWeightCount(kBand2PackedInputSize, kBand2ProjSize);
constexpr int kBand0RealtimeWeightOffset = 0;
constexpr int kBand1RealtimeWeightOffset = kBand0RealtimeWeightOffset + kBand0RealtimeWeightCount;
constexpr int kBand2RealtimeWeightOffset = kBand1RealtimeWeightOffset + kBand1RealtimeWeightCount;
constexpr int kRealtimeWeightsElementCount =
    kBand0RealtimeWeightCount + kBand1RealtimeWeightCount + kBand2RealtimeWeightCount;
static_assert((kRealtimeWeightsElementCount % kRealtimeWeightWordLanes) == 0,
              "Realtime packed weight layout must be word aligned.");
constexpr int kRealtimeWeightsWordCount = kRealtimeWeightsElementCount / kRealtimeWeightWordLanes;

constexpr int kMaxBatchSize = kFixedBatchSize;
constexpr int kMaxNumFrames = kFixedNumFrames;
constexpr int kMaxNumSubbands = kBand0NumSubbands;
constexpr int kMaxCtrFreq = 64;
constexpr int kMaxNoisyFreqSize = kBand2NoisyFreqSize;
constexpr int kMaxFbFreqSize = kBand2FbFreqSize;
constexpr int kMaxPackedInputSize = kBand2PackedInputSize;
constexpr int kMaxProjSize = kBand1ProjSize;
constexpr int kMaxDfOrder = kBand0DfOrder;
constexpr int kMaxCellInputSize = (kSbHiddenSize > kMaxPackedInputSize) ? kSbHiddenSize : kMaxPackedInputSize;
constexpr int kMaxSequenceFeatureSize = (kSbHiddenSize > kMaxProjSize) ? kSbHiddenSize : kMaxProjSize;
constexpr int kMaxBatchSubbands = kMaxBatchSize * kMaxNumSubbands;
constexpr int kMaxInputElementCount = kBand0InputElementCount;
constexpr int kMaxStateElementCount = kMaxBatchSubbands * kSbHiddenSize;
constexpr int kMaxSequenceElementCount = kMaxNumFrames * kMaxBatchSubbands * kMaxSequenceFeatureSize;
constexpr int kMaxLayerOutputElementCount = kMaxNumFrames * kMaxBatchSubbands * kSbHiddenSize;
constexpr int kMaxProjectedElementCount = kMaxNumFrames * kMaxBatchSubbands * kMaxProjSize;
constexpr int kMaxDfCoefElementCount =
    (kBand0DfCoefElementCount > kBand1DfCoefElementCount)
        ? ((kBand0DfCoefElementCount > kBand2DfCoefElementCount) ? kBand0DfCoefElementCount
                                                                 : kBand2DfCoefElementCount)
        : ((kBand1DfCoefElementCount > kBand2DfCoefElementCount) ? kBand1DfCoefElementCount
                                                                 : kBand2DfCoefElementCount);

struct BandSpec {
  int band_index;
  int lower_cutoff_freq;
  int upper_cutoff_freq;
  int ctr_freq;
  int nbr_freq;
  int df_order;
  int num_subbands;
  int noisy_freq_size;
  int fb_freq_size;
  int packed_input_size;
  int proj_size;
};

struct GSUWeightsQ610 {
  const q_data_t* weight_ih;
  const q_data_t* weight_hh;
  const q_data_t* bias_ih;
  const q_data_t* bn_mul;
  const q_data_t* bn_add;
};

struct LinearWeightsQ610 {
  const q_data_t* weight;
  const q_data_t* bias;
};

struct BandWeightsQ610 {
  GSUWeightsQ610 layers[kSbNumLayers];
  LinearWeightsQ610 proj;
};

extern const BandSpec kBandSpecs[kNumBands];

q_data_t SaturateInt16(accum_q_t value);
accum_q_t RoundShiftRight(accum_q_t value, int shift_bits);
q_data_t MulQ610(q_data_t lhs, q_data_t rhs);
q_data_t AddQ610(q_data_t lhs, q_data_t rhs);
q_data_t SubQ610(q_data_t lhs, q_data_t rhs);
q_data_t StepActivationQ610(q_data_t input_value);
q_data_t SigmoidPwlQ610(q_data_t input_value_q610);
q_data_t ApplyBatchNormFoldedQ610(q_data_t input_value_q610, const GSUWeightsQ610& weights, int hidden_index);

int ReflectFrequencyIndex(int freq_index, int num_freqs);
const BandSpec& GetBandSpec(int band_index);

std::size_t GetNoisySubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetFbSubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetSbInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetPackedInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetSequenceElementCount(int batch_subbands, int feature_size, int num_frames);
std::size_t GetStateElementCount(int batch_subbands);
std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames);

void ClearBufferQ610(q_data_t* buffer, std::size_t element_count);

void FreqUnfoldQ610(
    const BandSpec& spec,
    int nbr_freq,
    const q_data_t* input_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610);

void ConcatQ610(
    const BandSpec& spec,
    const q_data_t* noisy_subbands_q610,
    const q_data_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610);

void PackQ610(
    const BandSpec& spec,
    const q_data_t* sb_input_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610);

void PackedToSequenceQ610(
    const q_data_t* packed_input_q610,
    int batch_subbands,
    int feature_size,
    int num_frames,
    q_data_t* output_q610);

void RunGSULayerQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights,
    q_data_t* hx_state_q610,
    q_data_t* cx_state_q610,
    q_data_t* sequence_output_q610);

void RunProjectionQ610(
    const q_data_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights,
    q_data_t* sequence_output_q610);

void ProjectToDfCoefQ610(
    const BandSpec& spec,
    const q_data_t* projected_sequence_q610,
    int batch_size,
    int num_frames,
    q_data_t* output_q610);

void RunBandQ610(
    const BandSpec& spec,
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610);

void RunBand0Q610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610);

void RunBand1Q610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610);

void RunBand2Q610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    q_data_t* noisy_subbands_q610,
    q_data_t* fb_subbands_q610,
    q_data_t* sb_input_q610,
    q_data_t* packed_input_q610,
    q_data_t* sequence_input_q610,
    q_data_t* layer0_hx_state_q610,
    q_data_t* layer0_cx_state_q610,
    q_data_t* layer0_output_q610,
    q_data_t* layer1_hx_state_q610,
    q_data_t* layer1_cx_state_q610,
    q_data_t* layer1_output_q610,
    q_data_t* projected_output_q610,
    q_data_t* df_coef_q610);

void SubbandBand0TopQ610(
    const q_data_t noisy_input_q610[kBand0InputElementCount],
    const q_data_t fb_output_q610[kBand0InputElementCount],
    const q_data_t layer0_weight_ih_q610[kSbHiddenSize * kBand0PackedInputSize],
    const q_data_t layer0_weight_hh_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer0_bias_ih_q610[2 * kSbHiddenSize],
    const q_data_t layer0_bn_mul_q610[kSbHiddenSize],
    const q_data_t layer0_bn_add_q610[kSbHiddenSize],
    const q_data_t layer1_weight_ih_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer1_weight_hh_q610[kSbHiddenSize * kSbHiddenSize],
    const q_data_t layer1_bias_ih_q610[2 * kSbHiddenSize],
    const q_data_t layer1_bn_mul_q610[kSbHiddenSize],
    const q_data_t layer1_bn_add_q610[kSbHiddenSize],
    const q_data_t proj_weight_q610[kBand0ProjSize * kSbHiddenSize],
    const q_data_t proj_bias_q610[kBand0ProjSize],
    q_data_t df_coef_q610[kBand0DfCoefElementCount]);

void SubbandRealtimeTopQ610(
    hls::stream<axis_q610_t>& noisy_fft_stream,
    hls::stream<axis_q610_t>& fb_fft_stream,
    const packed_weight_word_t weights_q610[kRealtimeWeightsWordCount],
    int num_frames,
    bool reset_state,
    hls::stream<axis_q610_t>& df_coef_stream);

#ifndef __SYNTHESIS__
void RunBand0OptimizedSmokeQ610(
    const q_data_t* noisy_input_q610,
    const q_data_t* fb_output_q610,
    int num_frames,
    const q_data_t* layer0_weight_ih_q610,
    const q_data_t* layer0_weight_hh_q610,
    const q_data_t* layer0_bias_ih_q610,
    const q_data_t* layer0_bn_mul_q610,
    const q_data_t* layer0_bn_add_q610,
    const q_data_t* layer1_weight_ih_q610,
    const q_data_t* layer1_weight_hh_q610,
    const q_data_t* layer1_bias_ih_q610,
    const q_data_t* layer1_bn_mul_q610,
    const q_data_t* layer1_bn_add_q610,
    const q_data_t* proj_weight_q610,
    const q_data_t* proj_bias_q610,
    q_data_t* df_coef_q610);
#endif

}  // namespace subband_q610

void SubbandRealtimeTopQ610Ip(
    hls::stream<subband_q610::axis_q610_t>& noisy_fft_stream,
    hls::stream<subband_q610::axis_q610_t>& fb_fft_stream,
    const subband_q610::packed_weight_word_t weights_q610[subband_q610::kRealtimeWeightsWordCount],
    int num_frames,
    bool reset_state,
    hls::stream<subband_q610::axis_q610_t>& df_coef_stream);

#endif  // SUBBAND_REF_Q610_HPP
