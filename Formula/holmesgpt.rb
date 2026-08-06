class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.2/holmes-darwin-arm64-0.38.2.zip"
        sha256 "354ddcc3d156fb794462526d719e6a6650d41f37a52d5dd989777dfe316a730b"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.38.2/holmes-linux-amd64-0.38.2.zip"
        sha256 "d7c6a4929922f8255fed441d04733b8988d18657d976faf12179ef90d3e1bd13"
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
  
