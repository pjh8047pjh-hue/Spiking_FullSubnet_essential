#include "../subband_ref_q610.hpp"

#include <array>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

namespace fs = std::filesystem;

namespace {

struct GSUWeightsQ610Owner {
  std::vector<int16_t> weight_ih;
  std::vector<int16_t> weight_hh;
  std::vector<int16_t> bias_ih;
  std::vector<int16_t> bn_mul;
  std::vector<int16_t> bn_add;

  subband_q610::GSUWeightsQ610 View() const {
    return {
        weight_ih.data(),
        weight_hh.data(),
        bias_ih.data(),
        bn_mul.data(),
        bn_add.data(),
    };
  }
};

struct LinearWeightsQ610Owner {
  std::vector<int16_t> weight;
  std::vector<int16_t> bias;

  subband_q610::LinearWeightsQ610 View() const {
    return {weight.data(), bias.data()};
  }
};

struct BandWeightsQ610Owner {
  std::array<GSUWeightsQ610Owner, subband_q610::kSbNumLayers> layers;
  LinearWeightsQ610Owner proj;

  subband_q610::BandWeightsQ610 View() const {
    return {{
        layers[0].View(),
        layers[1].View(),
    }, proj.View()};
  }
};

struct BandBufferOwner {
  std::vector<int16_t> noisy_subbands;
  std::vector<int16_t> fb_subbands;
  std::vector<int16_t> sb_input;
  std::vector<int16_t> packed_input;
  std::vector<int16_t> sequence_input;
  std::vector<int16_t> layer0_hx_state;
  std::vector<int16_t> layer0_cx_state;
  std::vector<int16_t> layer0_output;
  std::vector<int16_t> layer1_hx_state;
  std::vector<int16_t> layer1_cx_state;
  std::vector<int16_t> layer1_output;
  std::vector<int16_t> projected_output;
  std::vector<int16_t> df_coef;
};

std::vector<int16_t> ReadInt16Binary(const fs::path& path) {
  std::ifstream input(path, std::ios::binary);
  if (!input) {
    throw std::runtime_error("Failed to open " + path.string());
  }

  const std::uintmax_t byte_count = fs::file_size(path);
  if ((byte_count % sizeof(int16_t)) != 0U) {
    throw std::runtime_error("Invalid int16 file size for " + path.string());
  }

  std::vector<int16_t> data(static_cast<std::size_t>(byte_count / sizeof(int16_t)));
  input.read(reinterpret_cast<char*>(data.data()), static_cast<std::streamsize>(byte_count));
  if (!input) {
    throw std::runtime_error("Failed to read " + path.string());
  }
  return data;
}

std::unordered_map<std::string, std::string> ReadMetadata(const fs::path& path) {
  std::ifstream input(path);
  if (!input) {
    throw std::runtime_error("Failed to open " + path.string());
  }

  std::unordered_map<std::string, std::string> values;
  std::string line;
  while (std::getline(input, line)) {
    if (line.empty()) {
      continue;
    }
    const std::size_t separator = line.find('=');
    if (separator == std::string::npos) {
      throw std::runtime_error("Invalid metadata line: " + line);
    }
    values[line.substr(0, separator)] = line.substr(separator + 1);
  }
  return values;
}

void WriteInt16Binary(const fs::path& path, const std::vector<int16_t>& data) {
  std::ofstream output(path, std::ios::binary);
  if (!output) {
    throw std::runtime_error("Failed to open " + path.string());
  }
  output.write(reinterpret_cast<const char*>(data.data()), static_cast<std::streamsize>(data.size() * sizeof(int16_t)));
  if (!output) {
    throw std::runtime_error("Failed to write " + path.string());
  }
}

void WriteShapeText(const fs::path& path, const std::vector<int>& shape) {
  std::ofstream output(path);
  if (!output) {
    throw std::runtime_error("Failed to open " + path.string());
  }
  for (std::size_t index = 0; index < shape.size(); ++index) {
    if (index != 0U) {
      output << ' ';
    }
    output << shape[index];
  }
  output << '\n';
}

void WriteTensor(
    const fs::path& base_dir,
    const std::string& stem,
    const std::vector<int16_t>& data,
    const std::vector<int>& shape) {
  WriteInt16Binary(base_dir / (stem + ".bin"), data);
  WriteShapeText(base_dir / (stem + "_shape.txt"), shape);
}

GSUWeightsQ610Owner LoadLayerWeights(const fs::path& weights_dir, int layer_index) {
  GSUWeightsQ610Owner weights;
  const std::string prefix = "layer" + std::to_string(layer_index) + "_";
  weights.weight_ih = ReadInt16Binary(weights_dir / (prefix + "weight_ih.bin"));
  weights.weight_hh = ReadInt16Binary(weights_dir / (prefix + "weight_hh.bin"));
  weights.bias_ih = ReadInt16Binary(weights_dir / (prefix + "bias_ih.bin"));
  weights.bn_mul = ReadInt16Binary(weights_dir / (prefix + "bn_mul.bin"));
  weights.bn_add = ReadInt16Binary(weights_dir / (prefix + "bn_add.bin"));
  return weights;
}

BandWeightsQ610Owner LoadBandWeights(const fs::path& dump_root, const subband_q610::BandSpec& spec) {
  const fs::path weights_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "weights_q610";
  BandWeightsQ610Owner weights;
  for (int layer_index = 0; layer_index < subband_q610::kSbNumLayers; ++layer_index) {
    weights.layers[layer_index] = LoadLayerWeights(weights_dir, layer_index);
  }
  weights.proj.weight = ReadInt16Binary(weights_dir / "proj_weight.bin");
  weights.proj.bias = ReadInt16Binary(weights_dir / "proj_bias.bin");
  return weights;
}

BandBufferOwner AllocateBandBuffers(const subband_q610::BandSpec& spec, int batch_size, int num_frames) {
  const int batch_subbands = batch_size * spec.num_subbands;
  BandBufferOwner buffers;
  buffers.noisy_subbands.resize(subband_q610::GetNoisySubbandsElementCount(spec, batch_size, num_frames));
  buffers.fb_subbands.resize(subband_q610::GetFbSubbandsElementCount(spec, batch_size, num_frames));
  buffers.sb_input.resize(subband_q610::GetSbInputElementCount(spec, batch_size, num_frames));
  buffers.packed_input.resize(subband_q610::GetPackedInputElementCount(spec, batch_size, num_frames));
  buffers.sequence_input.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, spec.packed_input_size, num_frames));
  buffers.layer0_hx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer0_cx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer0_output.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
  buffers.layer1_hx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer1_cx_state.resize(subband_q610::GetStateElementCount(batch_subbands));
  buffers.layer1_output.resize(
      subband_q610::GetSequenceElementCount(batch_subbands, subband_q610::kSbHiddenSize, num_frames));
  buffers.projected_output.resize(subband_q610::GetSequenceElementCount(batch_subbands, spec.proj_size, num_frames));
  buffers.df_coef.resize(subband_q610::GetDfCoefElementCount(spec, batch_size, num_frames));
  return buffers;
}

void WriteBandOutputs(
    const fs::path& dump_root,
    const subband_q610::BandSpec& spec,
    int batch_size,
    int num_frames,
    const BandBufferOwner& buffers) {
  const int batch_subbands = batch_size * spec.num_subbands;
  const fs::path output_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "cpp_q610";
  fs::create_directories(output_dir);

  WriteTensor(
      output_dir,
      "noisy_subbands",
      buffers.noisy_subbands,
      {batch_size, spec.num_subbands, subband_q610::kNumChannels, spec.noisy_freq_size, num_frames});
  WriteTensor(
      output_dir,
      "fb_subbands",
      buffers.fb_subbands,
      {batch_size, spec.num_subbands, subband_q610::kNumChannels, spec.fb_freq_size, num_frames});
  WriteTensor(
      output_dir,
      "sb_input",
      buffers.sb_input,
      {batch_size, spec.num_subbands, subband_q610::kNumChannels, spec.packed_input_size, num_frames});
  WriteTensor(
      output_dir,
      "packed_input",
      buffers.packed_input,
      {batch_subbands, spec.packed_input_size, num_frames});
  WriteTensor(
      output_dir,
      "sequence_input",
      buffers.sequence_input,
      {num_frames, batch_subbands, spec.packed_input_size});
  WriteTensor(
      output_dir,
      "layer0_output",
      buffers.layer0_output,
      {num_frames, batch_subbands, subband_q610::kSbHiddenSize});
  WriteTensor(
      output_dir,
      "layer1_output",
      buffers.layer1_output,
      {num_frames, batch_subbands, subband_q610::kSbHiddenSize});
  WriteTensor(
      output_dir,
      "projected_output",
      buffers.projected_output,
      {num_frames, batch_subbands, spec.proj_size});
  WriteTensor(
      output_dir,
      "df_coef",
      buffers.df_coef,
      {batch_size, spec.df_order, subband_q610::kNumSpks, spec.num_subbands * spec.ctr_freq, num_frames, 2});
}

}  // namespace

int main(int argc, char** argv) {
  try {
    const fs::path dump_root = argc > 1 ? fs::path(argv[1]) : fs::path("subband_q610_hls_dump");
    const auto metadata = ReadMetadata(dump_root / "metadata.txt");

    const int batch_size = std::stoi(metadata.at("batch_size"));
    const int num_frames = std::stoi(metadata.at("num_frames"));

    const std::vector<int16_t> noisy_input_q610 = ReadInt16Binary(dump_root / "noisy_input_q610.bin");
    const std::vector<int16_t> fb_output_q610 = ReadInt16Binary(dump_root / "fb_output_q610.bin");
    const std::size_t expected_input_count =
        static_cast<std::size_t>(batch_size) * subband_q610::kNumFreqs * num_frames;

    if (noisy_input_q610.size() != expected_input_count) {
      throw std::runtime_error("Invalid noisy_input_q610.bin element count.");
    }
    if (fb_output_q610.size() != expected_input_count) {
      throw std::runtime_error("Invalid fb_output_q610.bin element count.");
    }

    if (batch_size != subband_q610::kFixedBatchSize) {
      throw std::runtime_error("Band0 top currently supports batch_size=1 only.");
    }
    if (num_frames != subband_q610::kFixedNumFrames) {
      throw std::runtime_error("Band0 top currently supports the fixed frame count only.");
    }

    const std::array<BandWeightsQ610Owner, subband_q610::kNumBands> weight_owners = {{
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(0)),
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(1)),
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(2)),
    }};

    for (int band_index = 0; band_index < subband_q610::kNumBands; ++band_index) {
      const subband_q610::BandSpec& spec = subband_q610::GetBandSpec(band_index);
      const BandWeightsQ610Owner& weight_owner = weight_owners[band_index];
      const subband_q610::BandWeightsQ610 weights = weight_owner.View();
      BandBufferOwner buffers = AllocateBandBuffers(spec, batch_size, num_frames);

      subband_q610::RunBandQ610(
          spec,
          noisy_input_q610.data(),
          fb_output_q610.data(),
          batch_size,
          num_frames,
          weights,
          buffers.noisy_subbands.data(),
          buffers.fb_subbands.data(),
          buffers.sb_input.data(),
          buffers.packed_input.data(),
          buffers.sequence_input.data(),
          buffers.layer0_hx_state.data(),
          buffers.layer0_cx_state.data(),
          buffers.layer0_output.data(),
          buffers.layer1_hx_state.data(),
          buffers.layer1_cx_state.data(),
          buffers.layer1_output.data(),
          buffers.projected_output.data(),
          buffers.df_coef.data());

      if (band_index == 0) {
        std::vector<int16_t> top_df_coef(static_cast<std::size_t>(subband_q610::kBand0DfCoefElementCount), 0);
        subband_q610::SubbandBand0TopQ610(
            noisy_input_q610.data(),
            fb_output_q610.data(),
            weight_owner.layers[0].weight_ih.data(),
            weight_owner.layers[0].weight_hh.data(),
            weight_owner.layers[0].bias_ih.data(),
            weight_owner.layers[0].bn_mul.data(),
            weight_owner.layers[0].bn_add.data(),
            weight_owner.layers[1].weight_ih.data(),
            weight_owner.layers[1].weight_hh.data(),
            weight_owner.layers[1].bias_ih.data(),
            weight_owner.layers[1].bn_mul.data(),
            weight_owner.layers[1].bn_add.data(),
            weight_owner.proj.weight.data(),
            weight_owner.proj.bias.data(),
            top_df_coef.data());

        if (top_df_coef != buffers.df_coef) {
          throw std::runtime_error("Band0 top output mismatch against RunBand0Q610.");
        }
        buffers.df_coef = top_df_coef;
      }

      WriteBandOutputs(dump_root, spec, batch_size, num_frames, buffers);
      std::cout << "band" << band_index << " written to "
                << (dump_root / ("band" + std::to_string(band_index)) / "cpp_q610").string() << '\n';
    }

    return 0;
  } catch (const std::exception& error) {
    std::cerr << "subband_q610_dump failed: " << error.what() << '\n';
    return 1;
  }
}
