class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.32.0/holmes-darwin-arm64-0.32.0.zip"
        sha256 "709108e6f21d6c1d849edde5235493697ea25ed8ae0e4856e824b86a6cd6d343"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.32.0/holmes-linux-amd64-0.32.0.zip"
        sha256 "d5fc965cc56382087e18d0afe7c01a7816bdf83ee3a2f2ca8aad195cd43e0399"
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
  
