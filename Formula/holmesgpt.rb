class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.1/holmes-macos-latest-0.2.1.zip"
        sha256 "8dbc7cb725c7203092ba0c0bdedb7762bc6f39a441905efbdf806cda322ba8be"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.2.1/holmes-ubuntu-latest-0.2.1.zip"
        sha256 ""
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
  
