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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.2/gocompare-cli_0.3.2_darwin_arm64.tar.gz"
      sha256 "23e82951bc921c30fbc1e439353215e545bf873408d1484fec9a2055040888bc"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.2/gocompare-cli_0.3.2_darwin_amd64.tar.gz"
      sha256 "05feb25a16cc760237ab764bb98111b80c508109a09122e3d25b4e3a7bcee312"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.2/gocompare-cli_0.3.2_linux_arm64.tar.gz"
      sha256 "6b88d31fbc1986969774f558f942b6f3c142973668293892eb7dddad81fd3bc9"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.2/gocompare-cli_0.3.2_linux_amd64.tar.gz"
      sha256 "6fa6665ce2ee6e144de13a2a890f46350983dd91c91705f77097019076e67f2f"
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
