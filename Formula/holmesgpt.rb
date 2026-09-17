class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.42.0/holmes-darwin-arm64-0.42.0.zip"
        sha256 "e963e324caca5f6fd7959504508708a8f6164b80feabe194cc83c815e3db5764"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.42.0/holmes-linux-amd64-0.42.0.zip"
        sha256 "f4ba7b34ffae9a08f86b212e292c1639172baecb755cbcce0d8b66651ecf331e"
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
  
