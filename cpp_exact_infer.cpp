#include <filesystem>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

#include <windows.h>

namespace fs = std::filesystem;

namespace {

struct Options {
  fs::path input_path;
  fs::path output_path;
  fs::path python_path = fs::path("C:\\Users\\JH\\anaconda3\\envs\\spiking-fullsubnet\\python.exe");
  fs::path infer_script = fs::path("infer.py");
  fs::path config_path = fs::path("recipes\\intel_ndns\\spiking_fullsubnet\\baseline_m_qat.toml");
  fs::path checkpoint_path = fs::path("best_model_qat.pt");
};

std::wstring ToWide(const std::string& text) {
  if (text.empty()) {
    return std::wstring();
  }

  const int size_needed = MultiByteToWideChar(CP_UTF8, 0, text.c_str(), -1, nullptr, 0);
  if (size_needed <= 0) {
    throw std::runtime_error("Failed to convert UTF-8 text to UTF-16.");
  }

  std::wstring wide_text(static_cast<std::size_t>(size_needed - 1), L'\0');
  const int converted =
      MultiByteToWideChar(CP_UTF8, 0, text.c_str(), -1, wide_text.data(), size_needed);
  if (converted != size_needed) {
    throw std::runtime_error("Unexpected UTF-16 conversion result.");
  }
  return wide_text;
}

std::wstring ToWidePath(const fs::path& path) {
  return path.wstring();
}

std::wstring Quote(const std::wstring& text) {
  std::wstring quoted = L"\"";
  quoted += text;
  quoted += L"\"";
  return quoted;
}

void PrintUsage() {
  std::cout << "Usage: cpp_exact_infer.exe -i <input.wav> [-o <output.wav>] "
               "[--python <python.exe>] [--config <config.toml>] [--checkpoint <checkpoint.bin>]\n";
}

Options ParseArgs(int argc, char** argv) {
  Options options;

  for (int index = 1; index < argc; ++index) {
    const std::string arg = argv[index];
    auto require_value = [&](const char* flag_name) -> std::string {
      if (index + 1 >= argc) {
        throw std::runtime_error(std::string("Missing value for ") + flag_name);
      }
      ++index;
      return argv[index];
    };

    if (arg == "-i" || arg == "--input") {
      options.input_path = fs::path(require_value(arg.c_str()));
    } else if (arg == "-o" || arg == "--output") {
      options.output_path = fs::path(require_value(arg.c_str()));
    } else if (arg == "--python") {
      options.python_path = fs::path(require_value(arg.c_str()));
    } else if (arg == "--config") {
      options.config_path = fs::path(require_value(arg.c_str()));
    } else if (arg == "--checkpoint") {
      options.checkpoint_path = fs::path(require_value(arg.c_str()));
    } else if (arg == "--help" || arg == "-h") {
      PrintUsage();
      std::exit(0);
    } else {
      throw std::runtime_error("Unknown argument: " + arg);
    }
  }

  if (options.input_path.empty()) {
    throw std::runtime_error("Input WAV path is required.");
  }

  if (options.output_path.empty()) {
    const fs::path stem = options.input_path.stem();
    options.output_path = options.input_path.parent_path() / (stem.string() + "_cpp_exact.wav");
  }

  options.input_path = fs::absolute(options.input_path);
  options.output_path = fs::absolute(options.output_path);
  options.python_path = fs::absolute(options.python_path);
  options.infer_script = fs::absolute(options.infer_script);
  options.config_path = fs::absolute(options.config_path);
  options.checkpoint_path = fs::absolute(options.checkpoint_path);
  return options;
}

void ValidateFile(const fs::path& path, const char* label) {
  if (!fs::exists(path) || !fs::is_regular_file(path)) {
    throw std::runtime_error(std::string(label) + " does not exist: " + path.string());
  }
}

int LaunchPythonInfer(const Options& options) {
  std::wstring command_line =
      Quote(ToWidePath(options.python_path)) + L" " + Quote(ToWidePath(options.infer_script)) + L" -i " +
      Quote(ToWidePath(options.input_path)) + L" -o " + Quote(ToWidePath(options.output_path)) + L" -c " +
      Quote(ToWidePath(options.config_path)) + L" -k " + Quote(ToWidePath(options.checkpoint_path));

  std::vector<wchar_t> mutable_command(command_line.begin(), command_line.end());
  mutable_command.push_back(L'\0');

  STARTUPINFOW startup_info{};
  startup_info.cb = sizeof(startup_info);
  PROCESS_INFORMATION process_info{};

  const BOOL created = CreateProcessW(
      nullptr,
      mutable_command.data(),
      nullptr,
      nullptr,
      FALSE,
      0,
      nullptr,
      nullptr,
      &startup_info,
      &process_info);
  if (!created) {
    throw std::runtime_error("CreateProcessW failed with error code " + std::to_string(GetLastError()));
  }

  WaitForSingleObject(process_info.hProcess, INFINITE);

  DWORD exit_code = 0;
  if (!GetExitCodeProcess(process_info.hProcess, &exit_code)) {
    CloseHandle(process_info.hThread);
    CloseHandle(process_info.hProcess);
    throw std::runtime_error("GetExitCodeProcess failed with error code " + std::to_string(GetLastError()));
  }

  CloseHandle(process_info.hThread);
  CloseHandle(process_info.hProcess);
  return static_cast<int>(exit_code);
}

}  // namespace

int main(int argc, char** argv) {
  try {
    const Options options = ParseArgs(argc, argv);
    ValidateFile(options.python_path, "python.exe");
    ValidateFile(options.infer_script, "infer.py");
    ValidateFile(options.input_path, "input WAV");
    ValidateFile(options.config_path, "config");
    ValidateFile(options.checkpoint_path, "checkpoint");

    if (!options.output_path.parent_path().empty()) {
      fs::create_directories(options.output_path.parent_path());
    }

    const int exit_code = LaunchPythonInfer(options);
    if (exit_code != 0) {
      std::cerr << "Python inference failed with exit code " << exit_code << '\n';
      return exit_code;
    }

    std::cout << "Input: " << options.input_path.string() << '\n';
    std::cout << "Output: " << options.output_path.string() << '\n';
    return 0;
  } catch (const std::exception& error) {
    std::cerr << "cpp_exact_infer failed: " << error.what() << '\n';
    return 1;
  }
}
