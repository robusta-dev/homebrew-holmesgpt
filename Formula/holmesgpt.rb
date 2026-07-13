class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.36.0/holmes-darwin-arm64-0.36.0.zip"
        sha256 "50f65c18dd5951cc5faf30e37232b3d037e1efe74c9826b9104a579d06cf306a"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.36.0/holmes-linux-amd64-0.36.0.zip"
        sha256 "8f57ade266810b183b73053230afc3d4d59362bc5fa9e83fe892cd814a83a45e"
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
  
