class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.0/holmes-macos-latest-0.18.0.zip"
        sha256 "2eafd8ac4d18ce2817925b1f0315556f0bdb87ce5a8d1220f0bce95f9e875308"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.0/holmes-ubuntu-22.04-0.18.0.zip"
        sha256 "213251c53a86ecf5817c5a5b923e6898f0893a92bdbc39af9bc44ee9b7204f1f"
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
  
