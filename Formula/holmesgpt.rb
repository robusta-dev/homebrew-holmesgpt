class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.15.0/holmes-macos-latest-0.15.0.zip"
        sha256 "3b4f7755806350f5588dab789dbeb61ded134c3c334550954a1fca496977ee27"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.15.0/holmes-ubuntu-22.04-0.15.0.zip"
        sha256 "b325ef4368caa2522524d15d0b12035a8421103d65bccef53ed54d269a438b67"
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
  
