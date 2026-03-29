class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"
  
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.23.0/holmes-darwin-arm64-0.23.0.zip"
        sha256 "49cfdf9fc0ddb366812a83812d9499d5307b868b9cf7c6753a512511741fc66e"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.23.0/holmes-linux-amd64-0.23.0.zip"
        sha256 "2978c8f715246d0767acb581c06a6af2f928649347cefd97b6f24ed5863a8cd4"
    end
  
    # Skip relocation/stripping of PyInstaller-bundled dylibs (e.g. PIL/.dylibs/libpng16.16.dylib)
    # that Homebrew cannot relink due to insufficient header padding
    skip_clean "libexec"

    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
        # our binaries are built with pyinstaller and the first executable run is very slow because it unzips packages
        # to work around that, we "warm up" the binary here during installation so it is fast when the user runs it for the first time
        system libexec/"holmes", "version"
    end
    
    def caveats
        <<~EOS
            HolmesGPT has been installed successfully!
            Run `holmes --help` to get started.
        EOS
    end

    test do
        system "#{bin}/holmes", "version"
    end
end
  
