class GocompareCli < Formula
  desc "Command-line file and folder comparison, merge and sync"
  homepage "https://github.com/jhzhang09/gocompare"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.1.0/gocompare-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "00d270d02e3d49648030a56f7c8172c2b464557957329a9cb7b3118a863ff97b"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.1.0/gocompare-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "87b78ddaae6f7a9ffe037ed5295506afe78f238d15b2b022dd1e3c32b7745352"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.1.0/gocompare-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "30de66abdcbec4f03311634db32d1edeaea7e254b70c5337189eb2159c89762a"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.1.0/gocompare-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "150f8c2d101fefa657913773b1d6367888538a2efd22547718463afbfefdf972"
    end
  end

  def install
    bin.install "gocompare-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gocompare-cli --version")
    (testpath/"a.txt").write "same\n"
    (testpath/"b.txt").write "same\n"
    system bin/"gocompare-cli", testpath/"a.txt", testpath/"b.txt"
  end
end
