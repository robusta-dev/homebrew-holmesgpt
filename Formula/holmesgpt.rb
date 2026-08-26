class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.40.0/holmes-darwin-arm64-0.40.0.zip"
        sha256 "b28ac122d9869e68d6dbe7879a5f9db710735ad1f2d7f1a3020f13226f3599ef"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.40.0/holmes-linux-amd64-0.40.0.zip"
        sha256 "bc7f686f53f5402cb7951c543927263620901d373ef459b3ea4313dfa485715a"
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
  
