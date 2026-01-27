class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.19.0/holmes-macos-latest-0.19.0.zip"
        sha256 "b3d317502d92ceea52e5fa0406cb28b49b77fec37aef488ea68edce0f9fca31e"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.19.0/holmes-ubuntu-22.04-0.19.0.zip"
        sha256 "e099edcf99e57dddb79c4b37363d543fb5ade23d106c1d110f82c05631cedea3"
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
  
