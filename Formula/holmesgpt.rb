class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.0-alpha.3/holmes-macos-latest-0.11.0-alpha.3.zip"
        sha256 "fbb7922e1883bf7cf480632b59735a4e5f36858cb99340386fdc43cf4cee8432"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.0-alpha.3/holmes-ubuntu-22.04-0.11.0-alpha.3.zip"
        sha256 "265752b32a9dbb65770c0790d7e45e923fac42a8d222b1263c9cc13af50e4056"
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
  
