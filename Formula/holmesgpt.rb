class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.34.0/holmes-darwin-arm64-0.34.0.zip"
        sha256 "37e317ef213c220d57e8c7f33168185ce4168dcedf17a059bbe4dd28935df4dd"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.34.0/holmes-linux-amd64-0.34.0.zip"
        sha256 "074f5e3f2b49764ed0d1084b487412a7c0b0f8b83e70780f1622fecb39a505af"
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
  
