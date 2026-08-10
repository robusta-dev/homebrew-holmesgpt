class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.39.0/holmes-darwin-arm64-0.39.0.zip"
        sha256 "8dab9766523aca8a0444419496ac1a11b863829461e473b9945feaddc1147bfc"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.39.0/holmes-linux-amd64-0.39.0.zip"
        sha256 "3fa5ad03551ad94dd89a33ec9cec79d028d6a14374db16c7afc9426f4cd7312f"
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
  
