#include "../subband_ref_q610.cpp"

#include <filesystem>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <vector>

namespace fs = std::filesystem;

namespace {

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

void WriteTensor(const fs::path& base_dir, const std::string& stem, const subband_q610::TensorBufferQ610& tensor) {
  WriteInt16Binary(base_dir / (stem + ".bin"), tensor.data);
  WriteShapeText(base_dir / (stem + "_shape.txt"), tensor.shape);
}

subband_q610::GSUWeightsQ610 LoadLayerWeights(const fs::path& weights_dir, int layer_index) {
  subband_q610::GSUWeightsQ610 weights;
  const std::string prefix = "layer" + std::to_string(layer_index) + "_";
  weights.weight_ih = ReadInt16Binary(weights_dir / (prefix + "weight_ih.bin"));
  weights.weight_hh = ReadInt16Binary(weights_dir / (prefix + "weight_hh.bin"));
  weights.bias_ih = ReadInt16Binary(weights_dir / (prefix + "bias_ih.bin"));
  weights.bn_running_mean = ReadInt16Binary(weights_dir / (prefix + "bn_running_mean.bin"));
  weights.bn_running_var = ReadInt16Binary(weights_dir / (prefix + "bn_running_var.bin"));
  weights.bn_weight = ReadInt16Binary(weights_dir / (prefix + "bn_weight.bin"));
  weights.bn_bias = ReadInt16Binary(weights_dir / (prefix + "bn_bias.bin"));
  return weights;
}

subband_q610::BandWeightsQ610 LoadBandWeights(const fs::path& dump_root, const subband_q610::BandSpec& spec) {
  const fs::path weights_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "weights_q610";
  subband_q610::BandWeightsQ610 weights;
  for (int layer_index = 0; layer_index < subband_q610::kSbNumLayers; ++layer_index) {
    weights.layers[layer_index] = LoadLayerWeights(weights_dir, layer_index);
  }
  weights.proj.weight = ReadInt16Binary(weights_dir / "proj_weight.bin");
  weights.proj.bias = ReadInt16Binary(weights_dir / "proj_bias.bin");
  return weights;
}

void WriteBandOutputs(
    const fs::path& dump_root,
    const subband_q610::BandSpec& spec,
    const subband_q610::BandForwardResultQ610& result) {
  const fs::path output_dir = dump_root / ("band" + std::to_string(spec.band_index)) / "cpp_q610";
  fs::create_directories(output_dir);

  WriteTensor(output_dir, "noisy_subbands", result.noisy_subbands);
  WriteTensor(output_dir, "fb_subbands", result.fb_subbands);
  WriteTensor(output_dir, "sb_input", result.sb_input);
  WriteTensor(output_dir, "packed_input", result.packed_input);
  WriteTensor(output_dir, "df_coef", result.df_coef);

  if (!result.layer_outputs.empty()) {
    WriteTensor(output_dir, "sequence_input", result.layer_outputs[0]);
  }
  if (result.layer_outputs.size() > 1U) {
    WriteTensor(output_dir, "layer0_output", result.layer_outputs[1]);
  }
  if (result.layer_outputs.size() > 2U) {
    WriteTensor(output_dir, "layer1_output", result.layer_outputs[2]);
  }
  if (result.layer_outputs.size() > 3U) {
    WriteTensor(output_dir, "projected_output", result.layer_outputs[3]);
  }
}

}  // namespace

int main(int argc, char** argv) {
  try {
    const fs::path dump_root = argc > 1 ? fs::path(argv[1]) : fs::path("subband_q610_dump");
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

    const std::array<subband_q610::BandWeightsQ610, subband_q610::kNumBands> weights = {{
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(0)),
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(1)),
        LoadBandWeights(dump_root, subband_q610::GetBandSpec(2)),
    }};

    const auto results = subband_q610::RunSubbandModelQ610(
        noisy_input_q610.data(),
        fb_output_q610.data(),
        batch_size,
        num_frames,
        weights,
        true);

    for (int band_index = 0; band_index < subband_q610::kNumBands; ++band_index) {
      WriteBandOutputs(dump_root, subband_q610::GetBandSpec(band_index), results[band_index]);
      std::cout << "band" << band_index << " written to "
                << (dump_root / ("band" + std::to_string(band_index)) / "cpp_q610").string() << '\n';
    }

    return 0;
  } catch (const std::exception& error) {
    std::cerr << "subband_q610_dump failed: " << error.what() << '\n';
    return 1;
  }
}
