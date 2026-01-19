class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.5/holmes-macos-latest-0.18.5.zip"
        sha256 "0420adfc04f0d9d3f7cee3a33fda8267f4990fdd18563709596fe0ca06cf72cb"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.18.5/holmes-ubuntu-22.04-0.18.5.zip"
        sha256 "b705bd06e42addd50771fa5d2de55788aebdfed1ab1ae0ffe7cce86c54874e4b"
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
  
