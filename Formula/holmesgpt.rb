class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.9.0/holmes-macos-latest-0.9.0.zip"
        sha256 "c969431b1da0c92679ab6f3be696ea6f635321e514cee5089b1c853ff5b5f0af"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.9.0/holmes-ubuntu-20.04-0.9.0.zip"
        sha256 "89ad2abb70748a7fc732997a5c5eced067f640211b8f6113ca0d4fe496e574b2"
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
  
