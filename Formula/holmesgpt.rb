class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.35.0/holmes-darwin-arm64-0.35.0.zip"
        sha256 "f59f418cdf854f9fdc94126a824ebdbb84d7fc524253fc670148d1fbf75c06b2"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.35.0/holmes-linux-amd64-0.35.0.zip"
        sha256 "2461afd468b2b16688cc193c35122eff4a9188f88145b7735aff31885f825a45"
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
  
