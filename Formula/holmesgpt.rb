class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.22.0/holmes-darwin-arm64-0.22.0.zip"
        sha256 "11da3be6f93c248c2c9b4410f334dff595340da9f1ad8df9af076a7ef25757fe"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.22.0/holmes-linux-amd64-0.22.0.zip"
        sha256 "844503f200dd4f3a95170ce7de7bcd0b6235d9e70577863b45179ac2f6b180fc"
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
  
