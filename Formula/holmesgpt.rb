class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.4/holmes-macos-latest-0.1.4.zip"
        sha256 "2efd19e3feac025b807dc6737349580d8355fd51ca844aefdd77147765ae72c9"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.4/holmes-ubuntu-latest-0.1.4.zip"
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
  
