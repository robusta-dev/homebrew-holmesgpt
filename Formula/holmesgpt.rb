class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.4-alpha/holmes-macos-latest-0.10.4-alpha.zip"
        sha256 "712a241f3a489a95545d8072f94835081818d825c3b4f8074378b2dea35f50c5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.4-alpha/holmes-ubuntu-22.04-0.10.4-alpha.zip"
        sha256 "0ea57fa64974704ca4162d9cd6f7a9c9787bccea43a8a4797dd38145d94be582"
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
  
