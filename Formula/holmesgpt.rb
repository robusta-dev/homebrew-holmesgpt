class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.2/holmes-macos-latest-0.13.2.zip"
        sha256 "cf848123f876ecfac7b4c5556d08a6fcaeae841e8ce97ad3e5c3fd40bbc37633"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.2/holmes-ubuntu-22.04-0.13.2.zip"
        sha256 "95aaf8f0f431dc4d0c547e7ff9f7856f65232626a9dc95a96f64c4f8f92d9850"
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
  
