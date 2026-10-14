class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.44.0/holmes-darwin-arm64-0.44.0.zip"
        sha256 "a6957ab978e2b71c2fd731e828c2c1e965902e7ab0f641decefb0cbcd8fbb190"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.44.0/holmes-linux-amd64-0.44.0.zip"
        sha256 "e81d8543e971d62c039f1a5199c354c2cc9facb4805ab6393c5018f5012cbae1"
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
  
