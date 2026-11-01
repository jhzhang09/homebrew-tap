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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.1/gocompare-cli_0.3.1_darwin_arm64.tar.gz"
      sha256 "688328f20098162d1bd79a114908e5827960787a63e957faa9ea1349c827a394"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.1/gocompare-cli_0.3.1_darwin_amd64.tar.gz"
      sha256 "2264f7f68479eb712c53753965b38ebbebfb4e658ab5654c320f26be1f7ec5c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.1/gocompare-cli_0.3.1_linux_arm64.tar.gz"
      sha256 "42a8a2a920fdb5851bded9d86033094742c276ac187f5c153753546b114cf084"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.1/gocompare-cli_0.3.1_linux_amd64.tar.gz"
      sha256 "4ff52a73985bcde82dd9305fa15ab30884ff218d17ad07bab36d4b450d394ec9"
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
