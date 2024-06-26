class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.5/holmes-macos-latest-0.2.5.zip"
        sha256 "a3587cdd8ac5f43f233f0eb148748c8df5c9560e83c7986813d77d95e26e7be2"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.5/holmes-ubuntu-20.04-0.2.5.zip"
        sha256 "6cace0405b7d71b959f78b06f547249c324bc5ad6430bdb36a6bb579a5c439ee"
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
  
