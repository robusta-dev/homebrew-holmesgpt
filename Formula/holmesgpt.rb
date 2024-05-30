class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.6/holmes-macos-latest-0.1.6.zip"
        sha256 "6ecf9bce61f0be0c638ad3dc107481a252773572113b29ab04e18636321d639b"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.6/holmes-ubuntu-latest-0.1.6.zip"
        sha256 ""
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
    end
    
    test do
        system "#{bin}/holmes", "version"
    end
end
  
