class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmestgpt/releases/download/0.1.0/main-macos-latest-0.1.0.zip"
        sha256 "279e7c9fc860087fc174480bcb236f46571a1f58a4a6a8e43ea8234b95fffe67"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmestgpt/releases/download/0.1.0/main-ubuntu-latest-0.1.0.zip"
        sha256 ""
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmesgpt")
    end
    
    test do
        system "#{bin}/holmesgpt", "version"
    end
end
  
