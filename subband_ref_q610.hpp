#ifndef SUBBAND_REF_Q610_HPP
#define SUBBAND_REF_Q610_HPP

#include <array>
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <deque>

#if defined(__SYNTHESIS__) || defined(SUBBAND_Q610_USE_HLS_TYPES)
#include "ap_int.h"
#include "hls_stream.h"
#else
namespace hls {
template <typename T>
class stream {
 public:
  stream() = default;

  void write(const T& value) { queue_.push_back(value); }

  T read() {
    assert(!queue_.empty());
    const T value = queue_.front();
    queue_.pop_front();
    return value;
  }

  bool empty() const { return queue_.empty(); }

 private:
  std::deque<T> queue_;
};
}  // namespace hls
#endif

namespace subband_q610 {

#if defined(__SYNTHESIS__) || defined(SUBBAND_Q610_USE_HLS_TYPES)
using q_data_t = ap_int<16>;
using accum_q_t = ap_int<64>;
#else
using q_data_t = int16_t;
using accum_q_t = int64_t;
#endif

constexpr int kQFrac = 10;
constexpr int kQScale = 1 << kQFrac;
constexpr q_data_t kQZero = 0;
constexpr q_data_t kQOne = static_cast<q_data_t>(1 << kQFrac);

constexpr int kNumBands = 3;
constexpr int kNumChannels = 1;
constexpr int kNumSpks = 1;
constexpr int kNumFreqs = 256;
constexpr int kSbHiddenSize = 224;
constexpr int kSbNumLayers = 2;

constexpr int kFixedBatchSize = 1;
constexpr int kFixedNumFrames = 2415;

constexpr int kBand0NumSubbands = 8;
constexpr int kBand0NoisyFreqSize = 34;
constexpr int kBand0FbFreqSize = 4;
constexpr int kBand0PackedInputSize = 38;
constexpr int kBand0ProjSize = 40;
constexpr int kBand0DfOrder = 5;

constexpr int kBand1NumSubbands = 3;
constexpr int kBand1NoisyFreqSize = 62;
constexpr int kBand1FbFreqSize = 32;
constexpr int kBand1PackedInputSize = 94;
constexpr int kBand1ProjSize = 192;
constexpr int kBand1DfOrder = 3;

constexpr int kBand2NumSubbands = 2;
constexpr int kBand2NoisyFreqSize = 94;
constexpr int kBand2FbFreqSize = 64;
constexpr int kBand2PackedInputSize = 158;
constexpr int kBand2ProjSize = 128;
constexpr int kBand2DfOrder = 1;

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
    kFixedBatchSize * kBand0DfOrder * kNumSpks * (kBand0NumSubbands * 4) * kFixedNumFrames * 2;

constexpr int kBand1DfCoefElementCount =
    kFixedBatchSize * kBand1DfOrder * kNumSpks * (kBand1NumSubbands * 32) * kFixedNumFrames * 2;
constexpr int kBand2DfCoefElementCount =
    kFixedBatchSize * kBand2DfOrder * kNumSpks * (kBand2NumSubbands * 64) * kFixedNumFrames * 2;

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
  std::array<GSUWeightsQ610, kSbNumLayers> layers;
  LinearWeightsQ610 proj;
};

extern const std::array<BandSpec, kNumBands> kBandSpecs;

q_data_t SaturateInt16(accum_q_t value);
accum_q_t RoundShiftRight(accum_q_t value, int shift_bits);
q_data_t FloatToQ610(float value);
float Q610ToFloat(q_data_t value);
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

}  // namespace subband_q610

#endif  // SUBBAND_REF_Q610_HPP
