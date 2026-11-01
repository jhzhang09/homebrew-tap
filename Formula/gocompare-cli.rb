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
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.0/gocompare-cli_0.3.0_darwin_arm64.tar.gz"
      sha256 "3ea63ca5c70a8e1515f82fb0d00ed2bfef722e42b8ef4b9b32349f4989b4286d"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.0/gocompare-cli_0.3.0_darwin_amd64.tar.gz"
      sha256 "dd31a1c755a0c08db59c8eca6aa59862bcc9575cc695cc2af9d51ef0da509efe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.0/gocompare-cli_0.3.0_linux_arm64.tar.gz"
      sha256 "5958cb741e74c7c817ef9a62dc1e828c1db4d5b2dcef4814609e2b753789415f"
    else
      url "https://github.com/jhzhang09/gocompare/releases/download/v0.3.0/gocompare-cli_0.3.0_linux_amd64.tar.gz"
      sha256 "0629f2e22367ea1baa773398eac8687678eef1cc94e509132a459220edd1ec12"
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
