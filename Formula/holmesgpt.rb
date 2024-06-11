class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.18-test/holmes-macos-latest-0.1.18-test.zip"
        sha256 "aacc9ea287629271a5486b4c4105ffa10862fa0c5331c1e2158529d01e15a3b3"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.18-test/holmes-ubuntu-20.04-0.1.18-test.zip"
        sha256 "3f8b760fcf378cfd8ced7702af9bbb334c02a0b0c71c05bc2b00a309c53ddfe1"
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
  
