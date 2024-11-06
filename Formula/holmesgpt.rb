class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.6.0/holmes-macos-latest-0.6.0.zip"
        sha256 "ae95d785152a7ba48b8ed7c2c41283d09db812892b33e4ac953c45e28f6c4f9d"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.6.0/holmes-ubuntu-20.04-0.6.0.zip"
        sha256 "66047d893dab342647454609d69f6e0fc3c6de7a32b71f325b3265a30522e57a"
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
  
