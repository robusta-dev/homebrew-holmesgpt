class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.6/holmes-macos-latest-0.12.6.zip"
        sha256 "1dc5b17c7c566d0eb53f0b68be92e7fb9704cb6cfe8b7f102d43b2c1acce8192"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.12.6/holmes-ubuntu-22.04-0.12.6.zip"
        sha256 "9b84cac2b3d9ea10ef727da03878bda5186aedd0dcc3050a1877870e95f043c4"
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
  
