class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.8.1/holmes-macos-latest-0.8.1.zip"
        sha256 "09df7842f5bc7876a913237b2bf260172d3baf76655f90000c682d39a8ce1a25"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.8.1/holmes-ubuntu-20.04-0.8.1.zip"
        sha256 "0af401cc751e669251d6911933759bc21387e884b34465d31516efdd585e78e4"
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
  
