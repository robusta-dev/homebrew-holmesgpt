class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.30.1/holmes-darwin-arm64-0.30.1.zip"
        sha256 "22c59ba81fc1f3205fa404c6e43611d72c4ff0d3b28e5f00a51552c233caa71e"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.30.1/holmes-linux-amd64-0.30.1.zip"
        sha256 "225736870a7f329e304274b48c68db6597e185852228a306591c8d35df14effc"
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
  
