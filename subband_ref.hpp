#ifndef SUBBAND_REF_HPP
#define SUBBAND_REF_HPP

#include <array>
#include <cstddef>
#include <vector>

namespace subband_ref {

constexpr int kNumBands = 3;
constexpr int kNumChannels = 1;
constexpr int kNumFreqs = 256;
constexpr int kSbHiddenSize = 224;
constexpr int kSbNumLayers = 2;
constexpr int kNumSpks = 1;
constexpr float kDefaultBatchNormEps = 1.0e-5f;

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

extern const std::array<BandSpec, kNumBands> kBandSpecs;

struct GSUWeights {
  std::vector<float> weight_ih;
  std::vector<float> weight_hh;
  std::vector<float> bias_ih;
  std::vector<float> bn_running_mean;
  std::vector<float> bn_running_var;
  std::vector<float> bn_weight;
  std::vector<float> bn_bias;
  float bn_eps = kDefaultBatchNormEps;
};

struct LinearWeights {
  std::vector<float> weight;
  std::vector<float> bias;
};

struct BandWeights {
  std::array<GSUWeights, kSbNumLayers> layers;
  LinearWeights proj;
};

struct TensorBuffer {
  std::vector<float> data;
  std::vector<int> shape;
};

struct BandForwardResult {
  TensorBuffer noisy_subbands;
  TensorBuffer fb_subbands;
  TensorBuffer sb_input;
  TensorBuffer packed_input;
  TensorBuffer df_coef;
  std::vector<TensorBuffer> layer_outputs;
};

int ReflectFrequencyIndex(int freq_index, int num_freqs);
const BandSpec& GetBandSpec(int band_index);

std::size_t GetNoisySubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetFbSubbandsElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetSbInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetPackedInputElementCount(const BandSpec& spec, int batch_size, int num_frames);
std::size_t GetDfCoefElementCount(const BandSpec& spec, int batch_size, int num_frames);

void FreqUnfoldBand0Noisy(const float* input, int batch_size, int num_frames, float* output);
void FreqUnfoldBand1Noisy(const float* input, int batch_size, int num_frames, float* output);
void FreqUnfoldBand2Noisy(const float* input, int batch_size, int num_frames, float* output);

void FreqUnfoldBand0Fullband(const float* input, int batch_size, int num_frames, float* output);
void FreqUnfoldBand1Fullband(const float* input, int batch_size, int num_frames, float* output);
void FreqUnfoldBand2Fullband(const float* input, int batch_size, int num_frames, float* output);

void ConcatBand0(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output);
void ConcatBand1(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output);
void ConcatBand2(const float* noisy_subbands, const float* fb_subbands, int batch_size, int num_frames, float* output);

void PackBand0Input(const float* sb_input, int batch_size, int num_frames, float* output);
void PackBand1Input(const float* sb_input, int batch_size, int num_frames, float* output);
void PackBand2Input(const float* sb_input, int batch_size, int num_frames, float* output);

BandForwardResult RunBand0(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs = true);

BandForwardResult RunBand1(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs = true);

BandForwardResult RunBand2(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const BandWeights& weights,
    bool capture_layer_outputs = true);

std::array<BandForwardResult, kNumBands> RunSubbandModel(
    const float* noisy_input,
    const float* fb_output,
    int batch_size,
    int num_frames,
    const std::array<BandWeights, kNumBands>& weights,
    bool capture_layer_outputs = true);

}  // namespace subband_ref

#endif  // SUBBAND_REF_HPP
