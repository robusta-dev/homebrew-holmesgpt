class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.33.0/holmes-darwin-arm64-0.33.0.zip"
        sha256 "28375c68a7969b6de935f8aa26fc06906345e5b49edb5624c7f35d97c9cf0b68"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.33.0/holmes-linux-amd64-0.33.0.zip"
        sha256 "2b11a5e2fc151e064e2f3763b76ff85b7912b208ce39c57295f7a0591d7b8bf0"
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
  
