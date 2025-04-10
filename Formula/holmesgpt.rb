class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8/holmes-macos-latest-0.10.8.zip"
        sha256 "bfd13f6ed71c042c5718132124d02658e75869ff3d0a8b8dd77eeafef3e0e7fc"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.8/holmes-ubuntu-22.04-0.10.8.zip"
        sha256 "47ac269a2143f49e0893ac5b98fa0806c03cb05f147dafc2dff7dd94524e1832"
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
  
