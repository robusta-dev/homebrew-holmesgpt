class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.31.1/holmes-darwin-arm64-0.31.1.zip"
        sha256 "77e13609735d45e630a4f81e096bfd199ef4dce74e67bc28fc4b7e738d551602"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.31.1/holmes-linux-amd64-0.31.1.zip"
        sha256 "b0fa9960dce7169246f88e4d3bd13f9b33950549a1e3a2675a815ef6a5079efc"
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
  
