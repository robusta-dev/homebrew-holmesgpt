class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.1/holmes-darwin-arm64-0.24.1.zip"
        sha256 "acd211b77b6e21fa9d3e0f1aa50ce7e726bcd94cae6be088dc006a6c08803948"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.1/holmes-linux-amd64-0.24.1.zip"
        sha256 "ed06a3cf6e2eb28098f8cdc6a0607c63c0e020a54ea5b93543f00ee59286b0f8"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first time
        system libexec/"holmes", "version"
    end
    
    test do
        system "#{bin}/holmes", "version"
    end
end
  
