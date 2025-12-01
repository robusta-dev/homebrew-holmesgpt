class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.16.4/holmes-macos-latest-0.16.4.zip"
        sha256 "0537c5dd3b27b526f9957dabbe6de4ead3ec5868cfe10ec519051b59f97f3b33"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.16.4/holmes-ubuntu-22.04-0.16.4.zip"
        sha256 "a349bbbe80f132f76aff9141b1a91a2965db43da4a290e833715c40d957d340f"
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
  
