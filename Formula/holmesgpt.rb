class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.19-test/holmes-macos-latest-0.1.19-test.zip"
        sha256 "7073fab93efc764a9c498a8697302fda121063b8f0c3f07b66dd4dfd55953063"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.19-test/holmes-ubuntu-20.04-0.1.19-test.zip"
        sha256 "a0c31f7ba1428786a732b791eed9caedd0fb73a73590891201eab665cf1ce008"
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
  
