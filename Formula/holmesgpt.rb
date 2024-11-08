class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.6.1/holmes-macos-latest-0.6.1.zip"
        sha256 "51c0053bca88cbd6d15101eddab5f33a9e6c459c223d808098fd9fef9c44412a"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.6.1/holmes-ubuntu-20.04-0.6.1.zip"
        sha256 "6497e247761db779fd83c6ee78d8959c5089c4cee559bc60eed7b9277bd34441"
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
  
