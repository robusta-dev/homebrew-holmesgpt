class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.1/holmes-macos-latest-0.13.1.zip"
        sha256 "6778a0a3bc006c1c535ad1c9159e5c8b2bfb46c146da812cffee70ea907a6844"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.13.1/holmes-ubuntu-22.04-0.13.1.zip"
        sha256 "1535cd62a2aae51501dcb72425677771de00c0995af372f7a904333c3c0f2353"
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
  
