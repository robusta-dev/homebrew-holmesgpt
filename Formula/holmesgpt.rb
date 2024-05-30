class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.7/holmes-macos-latest-0.1.7.zip"
        sha256 "61e73079789f6131452090cb06ac5abbaecf407db84ef1ef1742de40982b3790"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.7/holmes-ubuntu-latest-0.1.7.zip"
        sha256 ""
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
        system "#{bin}/holmes", "version"
    end
    
    test do
        system "#{bin}/holmes", "version"
    end
end
  
