class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.4-alpha-logging/holmes-macos-latest-0.11.4-alpha-logging.zip"
        sha256 "70d072c5c4f9c79c0cb21308a88f256c10c4371f8a05f17374cf514a8174c446"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.11.4-alpha-logging/holmes-ubuntu-22.04-0.11.4-alpha-logging.zip"
        sha256 "0bf56a0a95d17af3b5cf8b41d7e70588ec02978af7d282706c647d637e6cb013"
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
  
