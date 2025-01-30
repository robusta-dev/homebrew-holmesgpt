class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.3/holmes-macos-latest-0.7.3.zip"
        sha256 "0e15e24deebb59f8660280f6715cb0b400f89bb28461fca4c1468426bb606053"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.3/holmes-ubuntu-20.04-0.7.3.zip"
        sha256 "00b9035212fb89390295343352465ce3cf35e278701b4cc76b89a73ee0788200"
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
  
