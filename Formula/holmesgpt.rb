class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.1/holmes-macos-latest-0.5.1.zip"
        sha256 "0f8d20a69a38a9428082269bc1a683f840d1b6c1d5cb52333bab7bd832371684"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.5.1/holmes-ubuntu-20.04-0.5.1.zip"
        sha256 "56a054fe0250e54e804e28a15c5386c030916e3b40521a89c3a5154eff815ff2"
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
  
