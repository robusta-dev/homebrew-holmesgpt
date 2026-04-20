class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.4/holmes-darwin-arm64-0.24.4.zip"
        sha256 "c10fe2c82c645ad9f330556dfcacd7cdd670950e915eb809a17612e4a8466c2b"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.4/holmes-linux-amd64-0.24.4.zip"
        sha256 "7c727f277c11bc0f547a7788cf49266bd3573c008c78a3b148fdac8ffb4977ef"
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
  
