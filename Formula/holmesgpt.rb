class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.23.0/holmes-linux-amd64-0.23.0.zip"
    sha256 "2978c8f715246d0767acb581c06a6af2f928649347cefd97b6f24ed5863a8cd4"

    def install
        if OS.mac?
            odie "On macOS, please install the cask instead: brew install --cask holmesgpt"
        end
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
  
