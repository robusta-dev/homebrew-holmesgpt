class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.0/holmes-macos-latest-0.7.0.zip"
        sha256 "b94f111ad7196632f3ce6db5070109709faa76ab0495f1a16086d16bf4e92d10"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.0/holmes-ubuntu-20.04-0.7.0.zip"
        sha256 "97901ee5fb33a0c942e969f006939750e43b18e52d444977e63b33e74758edca"
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
  
