class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.17-test/holmes-macos-latest-0.1.17-test.zip"
        sha256 "f3196e487fb44501525c04ff495ca0517477084d3ed14973e54178574666d85a"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.17-test/holmes-ubuntu-20.04-0.1.17-test.zip"
        sha256 ""
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
  
