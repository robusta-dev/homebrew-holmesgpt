class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.3/holmes-macos-latest-0.1.3.zip"
        sha256 "aed0783525bd8c391a40eee723aa08becd98ab81c3225d0f783cb4660f8631f5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.3/holmes-ubuntu-latest-0.1.3.zip"
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
  
