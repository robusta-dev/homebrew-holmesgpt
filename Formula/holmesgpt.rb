class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.26.0/holmes-darwin-arm64-0.26.0.zip"
        sha256 "92b99140632d1408f8a95056cb4069733c4de1fe8ed356e4628877105a60f08c"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.26.0/holmes-linux-amd64-0.26.0.zip"
        sha256 "243bb8cd2a1399f4fa5885323625b477646db8842444bb9852fefba587a20460"
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
  
