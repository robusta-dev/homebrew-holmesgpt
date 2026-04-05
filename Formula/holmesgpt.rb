class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.0/holmes-darwin-arm64-0.24.0.zip"
        sha256 "59968367348173273756adcd2a20d4ad5344c59d5c1222ae5a92568dd8fda45b"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.24.0/holmes-linux-amd64-0.24.0.zip"
        sha256 "4389782fede07beab15a2944fe4e4a345c181d630529e295d5a70df70c95f274"
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
  
