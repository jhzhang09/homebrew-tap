cask "godwit" do
  arch arm: "arm64", intel: "amd64"

  version "1.40.1-smime.1"
  sha256 arm:   "678abc1c6761fcdfe4bf88efafb9b8aa7f123dec384cf6ae94fcaee53f310643",
         intel: "8b280d78d2baefdeb667935fd8475d3098c48f2b26aade5475bf8dd8c6d0adb4"

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
