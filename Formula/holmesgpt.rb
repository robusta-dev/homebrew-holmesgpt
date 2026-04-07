class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.2/holmes-darwin-arm64-0.24.2.zip"
        sha256 "07c305ab7189468fc52a69743806b17394a8e76269bf81458e369d10edf7d2e3"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.2/holmes-linux-amd64-0.24.2.zip"
        sha256 "14d497f6ea069eb0985d38adaf9677bfc2478fef1ef2b5a4fda171a32e5a163e"
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
  
