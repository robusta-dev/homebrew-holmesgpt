class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.3/holmes-macos-latest-0.13.3.zip"
        sha256 "dc8394de5063cbb38f1e8a0dbf96993023fd283db08ebade82e642b7e72d8eee"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.3/holmes-ubuntu-22.04-0.13.3.zip"
        sha256 "0276d7732c1a914351e213ffedea89c2b10f32c7b90f777053f7121611ea0124"
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
  
