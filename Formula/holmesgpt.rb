class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.2/holmes-macos-latest-0.2.2.zip"
        sha256 "97e258f4ac3f556f40a73fb9095f15c8eb48e44eda65975348b29df7a264f3f3"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.2/holmes-ubuntu-20.04-0.2.2.zip"
        sha256 "37eb5353ed551c73d2457c1ac9189ddf2ac26e920dfc7e83f101421d1214a2a1"
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
  
