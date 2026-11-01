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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.2.0/gocompare-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "16d3345a716103267382e1885aa8ebbfb1f5c9c0902d8532eb77cbad99446a5b"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.2.0/gocompare-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "59976e254632d5c4b48f536c44a187366e564cff6a1739d6acc73e5ed81d32eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.2.0/gocompare-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "6f99c2b1105710f73ddce78e8394e6115ff37073cfcd3f7ab2468137b7998f19"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.2.0/gocompare-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "af0ea1fa5b06d6239b5c619d69a57d575f6686cb5d1371e2875d0853db732fb1"
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
