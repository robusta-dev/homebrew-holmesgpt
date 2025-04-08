class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha.1+coralogix/holmes-macos-latest-0.10.8-alpha.1+coralogix.zip"
        sha256 "3301e3eb03ab7e2d9af201156d4f27d1418e5ce9bc779443e3c81e2e72e42e51"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha.1+coralogix/holmes-ubuntu-22.04-0.10.8-alpha.1+coralogix.zip"
        sha256 "7d2757695609d6dd4bde9bb68fc45d026fbf5dd2f4cc7aeb1d7d6377628816ae"
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
  
