#ifndef SUBBAND_REF_Q610_HPP
#define SUBBAND_REF_Q610_HPP

#include <array>
#include <cstddef>
#include <cstdint>

namespace subband_q610 {

constexpr int kQFrac = 10;
constexpr int kQScale = 1 << kQFrac;
constexpr int16_t kQZero = 0;
constexpr int16_t kQOne = static_cast<int16_t>(1 << kQFrac);

constexpr int kNumBands = 3;
constexpr int kNumChannels = 1;
constexpr int kNumSpks = 1;
constexpr int kNumFreqs = 256;
constexpr int kSbHiddenSize = 224;
constexpr int kSbNumLayers = 2;
constexpr float kBnEpsFloat = 1.0e-5f;

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
  const int16_t* weight_ih;
  const int16_t* weight_hh;
  const int16_t* bias_ih;
  const int16_t* bn_running_mean;
  const int16_t* bn_running_var;
  const int16_t* bn_weight;
  const int16_t* bn_bias;
};

struct LinearWeightsQ610 {
  const int16_t* weight;
  const int16_t* bias;
};

struct BandWeightsQ610 {
  std::array<GSUWeightsQ610, kSbNumLayers> layers;
  LinearWeightsQ610 proj;
};

extern const std::array<BandSpec, kNumBands> kBandSpecs;

int16_t SaturateInt16(int64_t value);
int64_t RoundShiftRight(int64_t value, int shift_bits);
int16_t FloatToQ610(float value);
float Q610ToFloat(int16_t value);
int16_t MulQ610(int16_t lhs, int16_t rhs);
int16_t AddQ610(int16_t lhs, int16_t rhs);
int16_t SubQ610(int16_t lhs, int16_t rhs);
int16_t StepActivationQ610(int16_t input_value);
int16_t SigmoidQ610HostRef(int16_t input_value_q610);
int16_t BatchNormEvalQ610HostRef(int16_t input_value_q610, const GSUWeightsQ610& weights, int hidden_index);

int ReflectFrequencyIndex(int freq_index, int num_freqs);
const BandSpec& GetBandSpec(int band_index);

std::size_t GetNoisySubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetFbSubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetSbInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetPackedInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetSequenceElementCount(int batch_subbands, int feature_size, int num_frames);
std::size_t GetStateElementCount(int batch_subbands);
std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames);

void ClearBufferQ610(int16_t* buffer, std::size_t element_count);

void FreqUnfoldQ610(
    const BandSpec& spec,
    int nbr_freq,
    const int16_t* input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610);

void ConcatQ610(
    const BandSpec& spec,
    const int16_t* noisy_subbands_q610,
    const int16_t* fb_subbands_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610);

void PackQ610(
    const BandSpec& spec,
    const int16_t* sb_input_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610);

void PackedToSequenceQ610(
    const int16_t* packed_input_q610,
    int batch_subbands,
    int feature_size,
    int num_frames,
    int16_t* output_q610);

void RunGSULayerQ610(
    const int16_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int input_size,
    const GSUWeightsQ610& weights,
    int16_t* hx_state_q610,
    int16_t* cx_state_q610,
    int16_t* sequence_output_q610);

void RunProjectionQ610(
    const int16_t* sequence_input_q610,
    int batch_subbands,
    int num_frames,
    int proj_size,
    const LinearWeightsQ610& weights,
    int16_t* sequence_output_q610);

void ProjectToDfCoefQ610(
    const BandSpec& spec,
    const int16_t* projected_sequence_q610,
    int batch_size,
    int num_frames,
    int16_t* output_q610);

void RunBandQ610(
    const BandSpec& spec,
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610);

void RunBand0Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610);

void RunBand1Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610);

void RunBand2Q610(
    const int16_t* noisy_input_q610,
    const int16_t* fb_output_q610,
    int batch_size,
    int num_frames,
    const BandWeightsQ610& weights_q610,
    int16_t* noisy_subbands_q610,
    int16_t* fb_subbands_q610,
    int16_t* sb_input_q610,
    int16_t* packed_input_q610,
    int16_t* sequence_input_q610,
    int16_t* layer0_hx_state_q610,
    int16_t* layer0_cx_state_q610,
    int16_t* layer0_output_q610,
    int16_t* layer1_hx_state_q610,
    int16_t* layer1_cx_state_q610,
    int16_t* layer1_output_q610,
    int16_t* projected_output_q610,
    int16_t* df_coef_q610);

}  // namespace subband_q610

#endif  // SUBBAND_REF_Q610_HPP
