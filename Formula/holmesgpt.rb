class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.2/holmes-macos-latest-0.18.2.zip"
        sha256 "c9af97f9c2cc07db9fb06a0dc6c7edc0738a063fcdf5773af756178e3325cf46"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.2/holmes-ubuntu-22.04-0.18.2.zip"
        sha256 "132b88366c0077dde48512061b13f7bb7f24b313e5dbbcd122acbb9f746e4485"
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
  
