class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.1/holmes-macos-latest-0.11.1.zip"
        sha256 "59bb814e736cc008f105eb44d392d591b8a6b8c8ab5a02e7ed9bab9150534c36"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.1/holmes-ubuntu-22.04-0.11.1.zip"
        sha256 "84d78fb443c1a6fdb63eb63b8ceb4908b1d1dc8f4342b92ce7b222b569829cc2"
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
  
