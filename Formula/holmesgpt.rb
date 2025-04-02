class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.7-alpha/holmes-macos-latest-0.10.7-alpha.zip"
        sha256 "8eab85f2724601109928351090dd94b5f9fb111b027fe9acec85d439c4850d34"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.7-alpha/holmes-ubuntu-22.04-0.10.7-alpha.zip"
        sha256 "f4422e4402c3a604014dc54ad2a912bfeacbad0e7aa8d037129f8a910110208d"
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
  
