class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.0/holmes-macos-latest-0.13.0.zip"
        sha256 "sha256:a0a69e25a0e4fb91206ea7ef194c01cf2e5b8e45b5b8438d1d4e4488d42ae932"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.0/holmes-ubuntu-22.04-0.13.0.zip"
        sha256 "sha256:9826ad54f21e883fe3de0988d7f29e4a30962916fd0b2133e9a5e4a8cc29130b"
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
  
