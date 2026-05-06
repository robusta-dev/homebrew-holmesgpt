class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.27.0/holmes-darwin-arm64-0.27.0.zip"
        sha256 "7afcc1ceff1ff7d1b8e29ecc5215aa472332de5b256d64038c475fcaba644d72"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.27.0/holmes-linux-amd64-0.27.0.zip"
        sha256 "e395e6bfeb7291790f81916938cefa6608096c78d1002ba813f472016767126e"
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
  
