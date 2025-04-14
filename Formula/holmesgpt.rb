class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.9/holmes-macos-latest-0.10.9.zip"
        sha256 "1fb0b6216d9760793b5dab880a6de8375126f9b1928a107d2803f4f744d95829"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.9/holmes-ubuntu-22.04-0.10.9.zip"
        sha256 "b69d5d2121258f72acadd63e5343f33471937e09376cd5eb5d59f2981f9f2672"
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
  
