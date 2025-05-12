class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.2/holmes-macos-latest-0.11.2.zip"
        sha256 "7b8e16caf1adffe029a72f97c7e6e50a0dd88d9a9168a3c4f04b9d36b03b2957"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.2/holmes-ubuntu-22.04-0.11.2.zip"
        sha256 "0e9e0f017098bdecd06b8f161341e27bc8477179e00f7e96d0e541cb9cb5878a"
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
  
