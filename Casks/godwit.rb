cask "godwit" do
  arch arm: "arm64", intel: "amd64"

  version "1.39.4-smime.4"
  sha256 arm:   "a668f360da107d1bc2663ce8261c98d14e83114404539d2a2b52b44344d5224f",
         intel: "aa86e9063e551846fdcdee8dc59df9e41bd37118bf0ad9f83a7f1a46e258e5c1"

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
