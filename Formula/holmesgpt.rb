class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha/holmes-macos-latest-0.10.8-alpha.zip"
        sha256 "71f878d2e4156efaaf34831ebe934aaf24ccf92bac2a260f5c7f29b13c5545b8"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8-alpha/holmes-ubuntu-22.04-0.10.8-alpha.zip"
        sha256 "70d7e66ba17561056df1060aa72cf038449601494986d6ecf8d6ad9b10513aba"
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
  
