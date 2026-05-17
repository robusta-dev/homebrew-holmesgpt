class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.30.0/holmes-darwin-arm64-0.30.0.zip"
        sha256 "bc3775ad330892843de9418b059270fc058953d569dcaa6b402b7e48150585f7"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.30.0/holmes-linux-amd64-0.30.0.zip"
        sha256 "62d5a3c24e56f682b25ce8dbabcb4b1d955c097c494cd6300a15ed3516a96bda"
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
  
