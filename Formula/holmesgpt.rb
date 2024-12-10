class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.2/holmes-macos-latest-0.7.2.zip"
        sha256 "32022fdc93c01e3936caf1d4efc2f94685a6185e9d29ad3f63f38e441e0fc692"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.2/holmes-ubuntu-20.04-0.7.2.zip"
        sha256 "bfcd53e5da4d4a67eb2981eadf6193db5a46ba8c8a8bb4547e1448e145667163"
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
  
