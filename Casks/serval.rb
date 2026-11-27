cask "serval" do
  version "0.6.8"
  sha256 "abd7a0b54f32acd885560248eccd939cecc9ca0ee67911338d22c6076206b4fe"

  url "https://github.com/jhzhang09/serval/releases/download/v#{version}/serval-#{version}.dmg"
  name "Serval"
  desc "Lightweight native SSH, SFTP and terminal client"
  homepage "https://github.com/jhzhang09/serval"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Serval.app"
  binary "#{appdir}/Serval.app/Contents/MacOS/Serval", target: "serval"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Serval.app"]
  end

  zap trash: [
    "~/Library/Application Support/Serval",
    "~/Library/Preferences/io.github.jhzhang09.serval.plist",
    "~/Library/Saved Application State/io.github.jhzhang09.serval.savedState",
  ]
end
