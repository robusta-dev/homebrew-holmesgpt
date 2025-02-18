class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.0/holmes-macos-latest-0.10.0.zip"
        sha256 "3b6da87e4e216e6cffb313d68efb5ac47f5155914909188e3f296dac771a4014"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.0/holmes-ubuntu-20.04-0.10.0.zip"
        sha256 "73109cfeafa8fbbf18977f85ccc8713bf7dffadcbfce7f14cedf617e291409de"
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
  
