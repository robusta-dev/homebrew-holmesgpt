class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.1/holmes-macos-latest-0.18.1.zip"
        sha256 "bdf15e533325ceb7341b24def3b832478604e29ac46e3c78d7bc962176716799"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.1/holmes-ubuntu-22.04-0.18.1.zip"
        sha256 "06d93a0ad9de9cc93bd3752c402c4904b2716971d41d1f0d75abb27a47594fff"
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
  
