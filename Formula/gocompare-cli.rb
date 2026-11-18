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
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.1.0/gocompare-cli_1.1.0_darwin_arm64.tar.gz"
      sha256 "9e0a9b9e3cefacb5c2ccc343fbfde83fe7618b50c5a3e5deb8d99473cb98b016"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.1.0/gocompare-cli_1.1.0_darwin_amd64.tar.gz"
      sha256 "e4ded3e980d55c678b93de5f7d983298bc16361ba380019bd4f60a70945578dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.1.0/gocompare-cli_1.1.0_linux_arm64.tar.gz"
      sha256 "7961bf05cf55700e127b06b847f81b0e6f706100ea9ab96396e416047f86c571"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v1.1.0/gocompare-cli_1.1.0_linux_amd64.tar.gz"
      sha256 "5c623ff997b509b41b8323ae1a4daae386074dd9a59b5dfa0657ce8b086180f0"
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
