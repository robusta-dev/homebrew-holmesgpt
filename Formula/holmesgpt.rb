class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha.2/holmes-macos-latest-0.10.8-alpha.2.zip"
        sha256 "73fe72ff82b44b467faa76095e1739d62d48602f89a05369121bfd144dbd13b1"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha.2/holmes-ubuntu-22.04-0.10.8-alpha.2.zip"
        sha256 "6ef8558d6cf8d494f136a858c157a9663e4ffb22cd74ea1acee668633bad266b"
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
  
