class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.3/holmes-darwin-arm64-0.24.3.zip"
        sha256 "0df0b185ca5a03a3cbf92b27a5fa4125cc1b6c3b90a2388ab6a6f2deb86db154"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.3/holmes-linux-amd64-0.24.3.zip"
        sha256 "91a28178857dbb581b009212cbaef30818327e53e0bad4bb2c8b3d9b96f56164"
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
  
