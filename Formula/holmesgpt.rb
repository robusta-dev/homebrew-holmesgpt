class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.8/holmes-macos-latest-0.1.8.zip"
        sha256 "0aad4f4a3407ed70cc11b494837831cb4f170c9db604de8ba54dc7c2201aacb0"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.1.8/holmes-ubuntu-latest-0.1.8.zip"
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
  
