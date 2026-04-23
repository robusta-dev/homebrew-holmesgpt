class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.25.0/holmes-darwin-arm64-0.25.0.zip"
        sha256 "8c555e0e8b9740df083bef457e383e97e60bb4bad2cf72ed2a5f7a1c11a7ccf5"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.25.0/holmes-linux-amd64-0.25.0.zip"
        sha256 "e0808d6affcc70d603e87820df5796d39e6da71154518ca8462056a20d4790d6"
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
  
