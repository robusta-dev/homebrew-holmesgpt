class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.21.0/holmes-darwin-arm64-0.21.0.zip"
        sha256 "55a6a2b7358159c3251fbc0af2e1737a0cbfd9373e4a1b414bbe06fa02056f2e"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.21.0/holmes-linux-amd64-0.21.0.zip"
        sha256 "3f001284afb7a212703552ad04340fb78d119eda4dc922f835df2e5074d10f9c"
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
  
