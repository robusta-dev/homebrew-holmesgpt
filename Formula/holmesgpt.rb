class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.0-alpha/holmes-macos-latest-0.18.0-alpha.zip"
        sha256 "feca364b58cc6d1a0c9a28156bf1de382a45f1a6bc0863554122af2d6fba4494"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.0-alpha/holmes-ubuntu-22.04-0.18.0-alpha.zip"
        sha256 "2d5ca0e3f390b9cd0807f454064592ed4ed2b78f0d3d7b21eeccb63ab1efed77"
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
  
