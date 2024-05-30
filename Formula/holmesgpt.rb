class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/experimental-ai-investigation/releases/download/0.3/main-macos-latest-0.3.zip"
        sha256 "fb589b39e987340c11df873bdccd163f53913f8bb585e76b1f193f374313fc4d"
    elsif OS.linux?
        url "https://github.com/robusta-dev/experimental-ai-investigation/releases/download/0.3/main-ubuntu-latest-0.3.zip"
        sha256 "dc6bae6bafd8abc9c1ffb147e6feb23e8a5026be14145aac3f3b0fb16c3a6b04"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmesgpt")
    end
    
    test do
        system "#{bin}/holmesgpt", "version"
    end
end
  