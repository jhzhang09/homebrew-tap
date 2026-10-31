cask "gocompare" do
  version "0.1.0"
  sha256 "0d06ce5f41902ec30011e3cd01cd15d34753012d8b4fd68afe35b38d45266522"

  url "https://github.com/jhzhang09/gocompare/releases/download/v#{version}/gocompare-#{version}.dmg"
  name "GoCompare"
  desc "Native, cross-platform file and folder comparison tool"
  homepage "https://github.com/jhzhang09/gocompare"

  app "GoCompare.app"

  zap trash: [
    "~/Library/Application Support/GoCompare",
    "~/Library/Preferences/dev.gocompare.desktop.plist",
    "~/Library/Saved Application State/dev.gocompare.desktop.savedState",
  ]

  caveats <<~EOS
    GoCompare is not notarized with an Apple Developer account.
    To avoid macOS Gatekeeper blocking the app, install with --no-quarantine:
      brew install --cask --no-quarantine jhzhang09/tap/gocompare

    If already installed and macOS blocks it, run:
      xattr -dr com.apple.quarantine "#{appdir}/GoCompare.app"
    Or right-click the app in Finder and choose "Open".
  EOS
end
