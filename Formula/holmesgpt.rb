class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.1/holmes-macos-latest-0.7.1.zip"
        sha256 "edd9f8cd47b827da8997286a8e8de79a1e66565fcb495ccf7463f8261e1ef018"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.7.1/holmes-ubuntu-20.04-0.7.1.zip"
        sha256 "c9e8f108dafed0d916a32d798f1fe70f7c2bde363a9efacae10d936fc8ee3496"
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
  
