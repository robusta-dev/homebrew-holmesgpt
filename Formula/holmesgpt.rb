class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.4/holmes-macos-latest-0.2.4.zip"
        sha256 "cd517059746c84a43698b14baa6ce3c708b3bf401d753016ec687f2d922b1e4c"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.4/holmes-ubuntu-20.04-0.2.4.zip"
        sha256 "bc1cd882d91c3d16adf00b78ee8cc11f98150e2ae183667625b3230d80bbcb0e"
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
  
