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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.4/gocompare-cli_0.3.4_darwin_arm64.tar.gz"
      sha256 "f45bc57725867cbdd981b7b1b6f85d6abc2e818d16386490af9ccc61572e4aaf"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.4/gocompare-cli_0.3.4_darwin_amd64.tar.gz"
      sha256 "1337b5f2cb38860565e88bd1908695ab7b6020caf4465c68f51345faec4514ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.4/gocompare-cli_0.3.4_linux_arm64.tar.gz"
      sha256 "1e7ded01da42835bbfffa962b2633e7e322f138fa27d18cc6f1c73365931ac2b"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.4/gocompare-cli_0.3.4_linux_amd64.tar.gz"
      sha256 "3dc2ad17fd81bae241c1fba26652c47a6a1f47d471b0a6662f371952bad8e3a9"
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
