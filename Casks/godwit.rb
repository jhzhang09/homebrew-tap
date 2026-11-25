cask "godwit" do
  arch arm: "arm64", intel: "amd64"

  version "1.40.0-smime.1"
  sha256 arm:   "1ac5626b5e7454aa9357898691df457ddf3d730752a644d92aa92ee09879ded9",
         intel: "44ceadf58e08c8f20a2bd0f5fab6a2f1f4781662a6b42e416bb1bb0b4725b6b0"

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
