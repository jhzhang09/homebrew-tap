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
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.0.0/gocompare-cli_1.0.0_darwin_arm64.tar.gz"
      sha256 "afd55357e825f7f515cf715f8055eb577fd694e86af883eada52b41fdd6dd14a"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.0.0/gocompare-cli_1.0.0_darwin_amd64.tar.gz"
      sha256 "70b107ec3edbe23cb329198db327fd1b1746d5ae4ef9bcba685c60c94aab4c08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.0.0/gocompare-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "fb7f51be5efb06792fd3bb05ed67ab90193bb0f6ce997d213d394bbfad69131d"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.0.0/gocompare-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "9754f5afd024a5b6ab5f7ccac18b6efff74a38399fdd03999d22a79fd0597343"
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
