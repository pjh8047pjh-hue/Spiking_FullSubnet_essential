#include "subband_ref.hpp"

#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

namespace fs = std::filesystem;

namespace {

std::vector<float> ReadFloatBinary(const fs::path& path) {
  std::ifstream input(path, std::ios::binary);
  if (!input) {
    throw std::runtime_error("Failed to open " + path.string());
  }

  const std::uintmax_t byte_count = fs::file_size(path);
  if ((byte_count % sizeof(float)) != 0U) {
    throw std::runtime_error("Invalid float32 file size for " + path.string());
  }

  std::vector<float> data(static_cast<std::size_t>(byte_count / sizeof(float)));
  input.read(reinterpret_cast<char*>(data.data()), static_cast<std::streamsize>(byte_count));
  if (!input) {
    throw std::runtime_error("Failed to read " + path.string());
  }
  return data;
}

float ReadFloatText(const fs::path& path) {
  std::ifstream input(path);
  if (!input) {
    throw std::runtime_error("Failed to open " + path.string());
  }
  float value = 0.0f;
  input >> value;
  if (!input) {
    throw std::runtime_error("Failed to parse float from " + path.string());
  }
  return value;
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

void WriteFloatBinary(const fs::path& path, const std::vector<float>& data) {
  std::ofstream output(path, std::ios::binary);
  if (!output) {
    throw std::runtime_error("Failed to open " + path.string());
  }
  output.write(reinterpret_cast<const char*>(data.data()), static_cast<std::streamsize>(data.size() * sizeof(float)));
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

void WriteTensor(const fs::path& base_dir, const std::string& stem, const subband_ref::TensorBuffer& tensor) {
  WriteFloatBinary(base_dir / (stem + ".bin"), tensor.data);
  WriteShapeText(base_dir / (stem + "_shape.txt"), tensor.shape);
}

subband_ref::GSUWeights LoadLayerWeights(const fs::path& weights_dir, int layer_index) {
  subband_ref::GSUWeights weights;
  const std::string prefix = "layer" + std::to_string(layer_index) + "_";
  weights.weight_ih = ReadFloatBinary(weights_dir / (prefix + "weight_ih.bin"));
  weights.weight_hh = ReadFloatBinary(weights_dir / (prefix + "weight_hh.bin"));
  weights.bias_ih = ReadFloatBinary(weights_dir / (prefix + "bias_ih.bin"));
  weights.bn_running_mean = ReadFloatBinary(weights_dir / (prefix + "bn_running_mean.bin"));
  weights.bn_running_var = ReadFloatBinary(weights_dir / (prefix + "bn_running_var.bin"));
  weights.bn_weight = ReadFloatBinary(weights_dir / (prefix + "bn_weight.bin"));
  weights.bn_bias = ReadFloatBinary(weights_dir / (prefix + "bn_bias.bin"));
  weights.bn_eps = ReadFloatText(weights_dir / (prefix + "bn_eps.txt"));
  return weights;
}

subband_ref::BandWeights LoadBandWeights(const fs::path& dump_root, const subband_ref::BandSpec& spec) {
  const fs::path weights_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "weights";
  subband_ref::BandWeights weights;
  for (int layer_index = 0; layer_index < subband_ref::kSbNumLayers; ++layer_index) {
    weights.layers[layer_index] = LoadLayerWeights(weights_dir, layer_index);
  }
  weights.proj.weight = ReadFloatBinary(weights_dir / "proj_weight.bin");
  weights.proj.bias = ReadFloatBinary(weights_dir / "proj_bias.bin");
  return weights;
}

void WriteBandOutputs(const fs::path& dump_root, const subband_ref::BandSpec& spec, const subband_ref::BandForwardResult& result) {
  const fs::path output_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "cpp";
  fs::create_directories(output_dir);

  WriteTensor(output_dir, "noisy_subbands", result.noisy_subbands);
  WriteTensor(output_dir, "fb_subbands", result.fb_subbands);
  WriteTensor(output_dir, "sb_input", result.sb_input);
  WriteTensor(output_dir, "packed_input", result.packed_input);
  WriteTensor(output_dir, "df_coef", result.df_coef);

  if (!result.layer_outputs.empty()) {
    WriteTensor(output_dir, "layer0_input", result.layer_outputs[0]);
  }
  if (result.layer_outputs.size() > 1U) {
    WriteTensor(output_dir, "layer1_output", result.layer_outputs[1]);
  }
  if (result.layer_outputs.size() > 2U) {
    WriteTensor(output_dir, "layer2_output", result.layer_outputs[2]);
  }
  if (result.layer_outputs.size() > 3U) {
    WriteTensor(output_dir, "proj_output", result.layer_outputs[3]);
  }
}

}  // namespace

int main(int argc, char** argv) {
  try {
    const fs::path dump_root = argc > 1 ? fs::path(argv[1]) : fs::path("subband_cpp_dump");
    const auto metadata = ReadMetadata(dump_root / "metadata.txt");

    const int batch_size = std::stoi(metadata.at("batch_size"));
    const int num_frames = std::stoi(metadata.at("num_frames"));

    const std::vector<float> noisy_input = ReadFloatBinary(dump_root / "noisy_input.bin");
    const std::vector<float> fb_output = ReadFloatBinary(dump_root / "fb_output.bin");
    const std::size_t expected_input_count =
        static_cast<std::size_t>(batch_size) * subband_ref::kNumFreqs * num_frames;

    if (noisy_input.size() != expected_input_count) {
      throw std::runtime_error("Invalid noisy_input.bin element count.");
    }
    if (fb_output.size() != expected_input_count) {
      throw std::runtime_error("Invalid fb_output.bin element count.");
    }

    const std::array<subband_ref::BandWeights, subband_ref::kNumBands> weights = {{
        LoadBandWeights(dump_root, subband_ref::GetBandSpec(0)),
        LoadBandWeights(dump_root, subband_ref::GetBandSpec(1)),
        LoadBandWeights(dump_root, subband_ref::GetBandSpec(2)),
    }};

    const auto results = subband_ref::RunSubbandModel(
        noisy_input.data(),
        fb_output.data(),
        batch_size,
        num_frames,
        weights,
        true);

    for (int band_index = 0; band_index < subband_ref::kNumBands; ++band_index) {
      WriteBandOutputs(dump_root, subband_ref::GetBandSpec(band_index), results[band_index]);
      std::cout << "band" << band_index << " written to "
                << (dump_root / ("band" + std::to_string(band_index)) / "cpp").string() << '\n';
    }

    return 0;
  } catch (const std::exception& error) {
    std::cerr << "subband_sha_dump failed: " << error.what() << '\n';
    return 1;
  }
}
