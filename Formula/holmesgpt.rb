class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.0/main-macos-latest-0.1.0.zip"
        sha256 "279e7c9fc860087fc174480bcb236f46571a1f58a4a6a8e43ea8234b95fffe67"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.0/main-ubuntu-latest-0.1.0.zip"
        sha256 "db158ed0aa253ceced96c630484b85e79d2d65e359054041e3b6980f1a229820"
    end
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"holmes")
    end
    
    test do
        system "#{bin}/holmes", "version"
    end
end
  
