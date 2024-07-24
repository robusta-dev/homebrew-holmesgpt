class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.6/holmes-macos-latest-0.2.6.zip"
        sha256 "85411ab81e28c8ebf392749abba68274f1b41cac38cd7facdfe689401235bf3f"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.6/holmes-ubuntu-20.04-0.2.6.zip"
        sha256 "a9cda95fd5035bb2f3180ccc42a9c77b626b1ea2a2d9deb837275b62ed30a081"
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
  
