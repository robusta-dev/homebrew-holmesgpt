class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.0-alpha/holmes-macos-latest-0.11.0-alpha.zip"
        sha256 "8571241e5647b0a235cf0623efae53dfad9b16e71c831af0d390cf30454a1a61"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.0-alpha/holmes-ubuntu-22.04-0.11.0-alpha.zip"
        sha256 "cdcf48f33dda3ac750c5b5154de270c2c7380dd4eda53fb86979880c2eee3ba2"
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
  
