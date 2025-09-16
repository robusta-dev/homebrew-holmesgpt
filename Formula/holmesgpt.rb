class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.14.2/holmes-macos-latest-0.14.2.zip"
        sha256 "2227d2e6e1c9a1c290ac633ad61512d51855a182b816b0529d1e0b38b49aa9a6"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.14.2/holmes-ubuntu-22.04-0.14.2.zip"
        sha256 "38148a43a4db202724f802bb01d2e15022d5a4329240453324a9c99d93eade57"
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
  
