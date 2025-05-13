class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.4/holmes-macos-latest-0.11.4.zip"
        sha256 "97022862ba74c799025764741b412edb6a16d214331a8ab014572641774310e0"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.4/holmes-ubuntu-22.04-0.11.4.zip"
        sha256 "c3baa8ab5bbc02e04ae7740b9ef3a5024443b9823dc8816fa92f47be6ee51f3d"
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
  
