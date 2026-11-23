cask "godwit" do
  arch arm: "arm64", intel: "amd64"

  version "1.39.4-smime.3"
  sha256 arm:   "ff1dd465b21080a968b0ccbd1ed2b1dc7a4407b628491a6e280bba6f575ae71e",
         intel: "be5e60a952cd5d1956284aacf04675933838bd8f440c421e9749ff751bf196e2"

  url "https://github.com/jhzhang09/godwit/releases/download/v#{version}/godwit-#{version}-#{arch}.dmg"
  name "Godwit"
  desc "Unofficial fork of Godwit email client with native S/MIME support"
  homepage "https://github.com/jhzhang09/godwit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Godwit.app"
  binary "#{appdir}/Godwit.app/Contents/MacOS/Godwit", target: "godwit"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Godwit.app"]
  end

  zap trash: [
    "~/Library/Application Support/Godwit",
    "~/Library/Preferences/email.godwit.app.plist",
    "~/Library/Saved Application State/email.godwit.app.savedState",
  ]
end
