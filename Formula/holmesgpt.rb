class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.8.0/holmes-macos-latest-0.8.0.zip"
        sha256 "86ff5361adbca9c3ee08673f2ef542cfb39710cce13fd8a1abd063a7fdd138d8"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.8.0/holmes-ubuntu-20.04-0.8.0.zip"
        sha256 "23dff91a00324f0d1bd0468265f1f4791ec364904265672a5b3c42aa20117817"
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
  
