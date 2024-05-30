class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/experimental-ai-investigation/releases/download/0.3.1-alpha.1/main-macos-latest-0.3.1-alpha.1.zip"
        sha256 "bce506e78c7b0811f27ee1f340ab1e826dd6d3fc421cb0a49ba75f83a0b48b65"
    elsif OS.linux?
        url "https://github.com/robusta-dev/experimental-ai-investigation/releases/download/0.3.1-alpha.1/main-ubuntu-latest-0.3.1-alpha.1.zip"
        sha256 ""
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmesgpt")
    end
    
    test do
        system "#{bin}/holmesgpt", "version"
    end
end
  
