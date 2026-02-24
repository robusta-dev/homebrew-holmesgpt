class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.20.0/holmes-darwin-arm64-0.20.0.zip"
        sha256 "358133bd915a885581136837522301719997be83d2a784a54f83f43a3cd40f6d"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.20.0/holmes-linux-amd64-0.20.0.zip"
        sha256 "4ee6afc4fe474ff64f90b13288906cc2bf469fc794df8eb0705150a392ebe5c2"
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
  
