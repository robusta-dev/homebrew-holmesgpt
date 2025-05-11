class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.1-alpha/holmes-macos-latest-0.11.1-alpha.zip"
        sha256 "b7b0eec29645380fcc8a18e398fc4804fea703b96390eea1384e7cfd973fc68b"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.1-alpha/holmes-ubuntu-22.04-0.11.1-alpha.zip"
        sha256 "86177e948339243b6fbb391687869eb04316ba780d9f9e6114c87e346dbcc1e9"
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
  
