class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.2/holmes-macos-latest-0.5.2.zip"
        sha256 "8a28720e9d0fe7772e071e675ff73d1edc407a66c04b36e05e63a4b939b41928"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.2/holmes-ubuntu-20.04-0.5.2.zip"
        sha256 "4cc0875206bcfccf50c5c842dcfc0d710ac8fc60b7e31c1924bd4fb404c16abe"
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
  
