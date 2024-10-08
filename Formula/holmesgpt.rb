class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.0/holmes-macos-latest-0.5.0.zip"
        sha256 "98b49942aefa3445c2a98d36c44d5279aee33533e42b8a479d7514af45cb0a50"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.0/holmes-ubuntu-20.04-0.5.0.zip"
        sha256 "243cc1a159af7118372c2ee447e673eefc2e538d723f73b0333b214de7324121"
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
  
