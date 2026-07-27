class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.37.0/holmes-darwin-arm64-0.37.0.zip"
        sha256 "fac0f6797212405099ee3d46484a595923106b7f54e2b4734df626ea517e3266"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.37.0/holmes-linux-amd64-0.37.0.zip"
        sha256 "95d4e2a74ee4d365889db80928c7ce457c2d8bf35e18d01a51580ab2d18b8430"
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
  
