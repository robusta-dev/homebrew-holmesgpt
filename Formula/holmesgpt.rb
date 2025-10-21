class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.16.0/holmes-macos-latest-0.16.0.zip"
        sha256 "5ff32e708e9b4953f3f151aefb8b8250d73bfb581879431192be58ec3b60eb83"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.16.0/holmes-ubuntu-22.04-0.16.0.zip"
        sha256 "9f4fa2462e89d4534787fcb11e58b679dcbc1ed7c0ce9c0277d8ab2714502b67"
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
  
