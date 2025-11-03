class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.16.1/holmes-macos-latest-0.16.1.zip"
        sha256 "15a9e0ea00fecf9d9895022f3c16c641ea45ddaa3f795ef9064ac365969d8cdd"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.16.1/holmes-ubuntu-22.04-0.16.1.zip"
        sha256 "be821ceff43c244087939fd8e4d9f6590e79a9db51ad216fcb02701c3575f902"
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
  
