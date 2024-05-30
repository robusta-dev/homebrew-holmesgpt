class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmestgpt/releases/download/0.1.2/holmes-macos-latest-0.1.2.zip"
        sha256 "6ffca7e9baa535b2af7a2e15ce97cb641db5d68d2129f303d7c0d9e69d4fc0c9"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmestgpt/releases/download/0.1.2/holmes-ubuntu-latest-0.1.2.zip"
        sha256 ""
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
    end
    
    test do
        system "#{bin}/holmes", "version"
    end
end
  
