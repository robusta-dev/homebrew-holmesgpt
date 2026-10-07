class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.43.0/holmes-darwin-arm64-0.43.0.zip"
        sha256 "a5147ead924cd547308252c8eea60aa0a035ee17f2449a3ab7742e369bc18dcf"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.43.0/holmes-linux-amd64-0.43.0.zip"
        sha256 "8d7c8761bfc0fc38303defdadd70a8e536b90c70652601843806992480711f42"
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
  
