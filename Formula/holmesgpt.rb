class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.29.0/holmes-darwin-arm64-0.29.0.zip"
        sha256 "90a1a5f9523ae8defbf4eb99c384e9e8ed4a6c98e8d03e11c1b497f4478509be"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.29.0/holmes-linux-amd64-0.29.0.zip"
        sha256 "e4f54c8dfd84cc747fe908dd38718a901381e518d3b5b18e2c0e1b3b3e0479cd"
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
  
