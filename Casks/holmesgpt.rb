cask "holmesgpt" do
  version "0.23.0"

  if Hardware::CPU.arm?
    url "https://github.com/HolmesGPT/holmesgpt/releases/download/#{version}/holmes-darwin-arm64-#{version}.zip"
    sha256 "49cfdf9fc0ddb366812a83812d9499d5307b868b9cf7c6753a512511741fc66e"
  else
    url "https://github.com/HolmesGPT/holmesgpt/releases/download/#{version}/holmes-darwin-amd64-#{version}.zip"
    sha256 "TBD"
  end

  name "HolmesGPT"
  desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
  homepage "https://github.com/HolmesGPT/holmesgpt"

  binary "holmes/holmes"

  postflight do
    system_command "#{staged_path}/holmes/holmes", args: ["version"], print_stdout: true
  end
end
