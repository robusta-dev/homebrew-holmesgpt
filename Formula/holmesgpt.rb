class Holmesgpt < Formula
    desc "AI Agent for Cloud Troubleshooting and Alert Investigation"
    homepage "https://github.com/HolmesGPT/holmesgpt"

    # Homebrew requires a URL to load the formula. On macOS we don't actually use this
    # (the install method redirects users to the cask), but without it the formula fails to load.
    if OS.mac?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.23.0/placeholder.zip"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    elsif OS.linux?
        url "https://github.com/HolmesGPT/holmesgpt/releases/download/0.23.0/holmes-linux-amd64-0.23.0.zip"
        sha256 "2978c8f715246d0767acb581c06a6af2f928649347cefd97b6f24ed5863a8cd4"
    end

    def install
        if OS.mac?
            odie <<~EOS
                On macOS, HolmesGPT is now distributed as a Cask. Please run:
                  brew install --cask holmesgpt
                If you previously installed HolmesGPT as a formula, first uninstall it:
                  brew uninstall holmesgpt
            EOS
        end
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
