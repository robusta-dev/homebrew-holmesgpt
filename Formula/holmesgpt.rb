class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.14.1/holmes-macos-latest-0.14.1.zip"
        sha256 "abcb8ca3d099692a1a9f498c99e2fb7d112e9f18b7d963ddbd61500bb4fc3b24"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.14.1/holmes-ubuntu-22.04-0.14.1.zip"
        sha256 "d258befa251ce9ffd0c4d2dc3a76846c5fc2e35b1481c0a392f710506eada83f"
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
  
