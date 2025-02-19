class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.2/holmes-macos-latest-0.10.2.zip"
        sha256 "d53f65271fb26f04242efffa8023c4f8ea8a50db2ade94ae26c2c3b1993f11a5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.2/holmes-ubuntu-20.04-0.10.2.zip"
        sha256 "26307422c8045e5cf658b2648f2710452a6884c7ab83c2abcbdcfbced9b7f205"
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
  
