class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.2/holmes-macos-latest-0.10.2.zip"
        sha256 "4e3f3d6751fe2a0fbad4217dbff9560bd75ae1075221503507f4cb9c258bd861"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.2/holmes-ubuntu-22.04-0.10.2.zip"
        sha256 "03f06f62e1c0dc4489cbbd8c876c56212d909855d9fb6e7e90ebbefc389c1bd6"
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
  
