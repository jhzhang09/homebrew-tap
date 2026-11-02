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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.3/gocompare-cli_0.3.3_darwin_arm64.tar.gz"
      sha256 "4457d1639676bd8581dd200a4ad05e5349326df80f2aecf25a6d931192443379"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.3/gocompare-cli_0.3.3_darwin_amd64.tar.gz"
      sha256 "b37750cb440ba3f542181b12636ff49c8b9c7df350a4702b5c75aa6392d5c672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.3/gocompare-cli_0.3.3_linux_arm64.tar.gz"
      sha256 "e9ec0ae362a3e11e36102c3cc2f0097c61926aab3d251444e27d6e1c0ad018a7"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.3/gocompare-cli_0.3.3_linux_amd64.tar.gz"
      sha256 "836a4c7b90d0ed27236104a6248f655a7b4d8c690d11f334e81a8b6cbf20b32c"
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
