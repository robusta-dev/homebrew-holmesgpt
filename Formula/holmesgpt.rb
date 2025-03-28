class Holmesgpt < Formula
    desc "The Open Source DevOps Assistant"
    homepage "https://github.com/robusta-dev/experimental-ai-investigation"
  
    if OS.mac?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.5/holmes-macos-latest-0.10.5.zip"
        sha256 "d77533966af23819d4fdec2db4af63cea9276eaeb2ccdf95147bf5d89333acf5"
    elsif OS.linux?
        url "https://github.com/robusta-dev/holmesgpt/releases/download/0.10.5/holmes-ubuntu-22.04-0.10.5.zip"
        sha256 "c69e628393550604279bfa860dd495332320c55a8bd1cf208ce7217a08d0390d"
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
  
