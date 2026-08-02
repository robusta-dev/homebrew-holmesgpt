class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.1/holmes-darwin-arm64-0.38.1.zip"
        sha256 "19dad45a2e6ce526657ef37c8c1638b4a83f3de60bb71d81aa1035536bc83c14"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.1/holmes-linux-amd64-0.38.1.zip"
        sha256 "29c3c7a41e35b6ac37d67e8d7d6f1179a2190d693c1d8a0823b986a88a48b490"
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
  
