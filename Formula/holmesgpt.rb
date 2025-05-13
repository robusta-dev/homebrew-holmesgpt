class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.3/holmes-macos-latest-0.11.3.zip"
        sha256 "b30873dd5c6bf35b38b24d5f0fba95d8a61ca1fe140b2c585e803db03cd0d627"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.3/holmes-ubuntu-22.04-0.11.3.zip"
        sha256 "3fba709fbef74952c24470396f296b6f51be70d0fac2a496afdae01e9c8de021"
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
  
