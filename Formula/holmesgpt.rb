class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.5/holmes-macos-latest-0.12.5.zip"
        sha256 "f27a8d9cf7ec6a65a6f938c671501eefe5d9cbf3d945d0358266ab4919ecfb0b"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.5/holmes-ubuntu-22.04-0.12.5.zip"
        sha256 "facf9d4b0c05382a50959cfd76ce816c89e46ecfcebe8abad961982038958655"
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
  
