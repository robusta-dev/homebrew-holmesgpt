class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.16.3/holmes-macos-latest-0.16.3.zip"
        sha256 "8f2c16071ccec344c0c07a9334b8e9489091ab3d28bcbc0cfcab96628ac5ea46"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.16.3/holmes-ubuntu-22.04-0.16.3.zip"
        sha256 "c396b838a43a2e4feedf16c664f8bdbd601ebc93df04fd77e6ef9b24c7a4d6fc"
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
  
