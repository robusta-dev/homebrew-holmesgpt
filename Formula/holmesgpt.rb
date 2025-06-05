class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.5/holmes-macos-latest-0.11.5.zip"
        sha256 "8aac14ca372646ff5c97885144db90d1b06ce93f69f41f488b51d2468215bf51"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.5/holmes-ubuntu-22.04-0.11.5.zip"
        sha256 "2951da4bc2aa66c0483d5fdc44c1a4e895b863aa2af12c60b5805ebd20554c54"
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
  
