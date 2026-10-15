class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.45.0/holmes-darwin-arm64-0.45.0.zip"
        sha256 "b64039af4e834e13a4bf1185907c4da54c8aa9088cfb5f32ec1833f9ca43aa43"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.45.0/holmes-linux-amd64-0.45.0.zip"
        sha256 "eda410ec3ee5e8e92f25c3bc9f10f1ecd254972acdbe1d5674c6759bedd968cb"
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
  
