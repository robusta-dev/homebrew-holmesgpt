class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.0/holmes-darwin-arm64-0.38.0.zip"
        sha256 "cc6c6c9c0c18a4f0029955b4f5e43431df7e7be1e27ac725733a989699809535"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.0/holmes-linux-amd64-0.38.0.zip"
        sha256 "77b29f0509bc466210080fbb4363c535d89a674b37827470530e88d89cc4b0c1"
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
  
