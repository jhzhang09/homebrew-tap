cask "godwit" do
  arch arm: "arm64", intel: "amd64"

  version "1.39.4-smime.1"
  sha256 arm:   "04af581a928845509923892b9439e5e46f043a1e4e6f0d445665e8b8ddb22966",
         intel: "d379c105a18a5fd3e17f950707aba381e7706d27aa9394ae2e185c6be81badeb"

  url "https://github.com/jhzhang09/godwit/releases/download/v#{version}/godwit-#{version}-#{arch}.dmg"
  name "Godwit"
  desc "Open-source, AI-native desktop email client"
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
