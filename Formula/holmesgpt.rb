class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.17.0/holmes-macos-latest-0.17.0.zip"
        sha256 "4c036f44b21662ab8a4f86122696b653763362a53e5ae56567b9da89bd740f94"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.17.0/holmes-ubuntu-22.04-0.17.0.zip"
        sha256 "f57008ec4946343a78b4dbb15694f706d88470974c6d33a3f46479e99dd4b338"
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
  
