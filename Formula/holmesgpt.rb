class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.28.0/holmes-darwin-arm64-0.28.0.zip"
        sha256 "7915adea6b047c22082dc4046ed4416b71f24cb0d8363eaf54f9d5276628836e"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.28.0/holmes-linux-amd64-0.28.0.zip"
        sha256 "fff5555da2562bb34d1cb800fe2d79f36cafdf7a1ea4d404f0d11927a709714a"
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
  
