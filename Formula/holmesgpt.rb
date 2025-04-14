class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.10.alpha.1/holmes-macos-latest-0.10.10.alpha.1.zip"
        sha256 "97a76daaff3c23a34321127fea990224b96bdadef2ed095ab34a6a9ed79a23aa"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.10.alpha.1/holmes-ubuntu-22.04-0.10.10.alpha.1.zip"
        sha256 "2bbda31ccc78a9147d826f0ca54f88301f00f6aedd5abc9be4ef495a980cba4f"
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
  
