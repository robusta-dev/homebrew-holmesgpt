class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.4/holmes-macos-latest-0.12.4.zip"
        sha256 "63df36f6a70a97cda441ceada8699ed8bbfe2d32cc8728f29bc0e7e1bb412e33"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.4/holmes-ubuntu-22.04-0.12.4.zip"
        sha256 "73fb5b6fd33be9acefa9302624233f81fbe98985897ed6ad8f2051fd5911e3f4"
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
  
