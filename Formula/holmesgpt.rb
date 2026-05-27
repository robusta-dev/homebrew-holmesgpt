class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.31.0/holmes-darwin-arm64-0.31.0.zip"
        sha256 "886afd0e5419484f24f16b7245b128990efae9653d820ffed5293ee7c30de613"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.31.0/holmes-linux-amd64-0.31.0.zip"
        sha256 "2cfa05ad9ffa8b4af07d28cf5ab377a4911e2fe8292efb3383ba3aa472bb298a"
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
  
