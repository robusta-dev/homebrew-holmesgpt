class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.4.0/holmes-macos-latest-0.4.0.zip"
        sha256 "5f8ac0df92a152dc945bffe5b44485d7f57b60f91d17480f95add8bf0858b845"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.4.0/holmes-ubuntu-20.04-0.4.0.zip"
        sha256 "fa322d90e0bc405a6ab3e7a9903562d8675163d66e1499f71c88a22f49ce37b4"
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
  
