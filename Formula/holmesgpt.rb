class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.3.0/holmes-macos-latest-0.3.0.zip"
        sha256 "f65b837a42121b7adced7706f8b9f99a2e2f39096e503ef5a99440261938790c"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.3.0/holmes-ubuntu-20.04-0.3.0.zip"
        sha256 "1ca5b4860f17beee71fe948b2d252a60f7ae91504c01df4e81c92ddea6218865"
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
  
