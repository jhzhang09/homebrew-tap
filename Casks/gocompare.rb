cask "gocompare" do
  version "0.3.0"
  sha256 "550a6b20f825388008986f2b6e9181c857ed787e5f27d9251d9ea0b4bb5509c8"

  url "https://github.com/jhzhang09/gocompare/releases/download/v#{version}/gocompare-#{version}.dmg"
  name "GoCompare"
  desc "Native file and folder comparison tool"
  homepage "https://github.com/jhzhang09/gocompare"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "GoCompare.app"
  # 与 Linux 安装包和 README 一致：命令 gocompare 打开桌面应用，命令行工具是 gocompare-cli。
  binary "#{appdir}/GoCompare.app/Contents/MacOS/GoCompare", target: "gocompare"

  zap trash: [
    "~/.config/gocompare",
    "~/Library/Application Support/GoCompare",
    "~/Library/Preferences/dev.gocompare.desktop.plist",
    "~/Library/Saved Application State/dev.gocompare.desktop.savedState",
  ]

  caveats <<~EOS
    GoCompare is ad-hoc signed but not notarized, so macOS blocks the first launch.
    Allow it once with either:
      xattr -dr com.apple.quarantine "#{appdir}/GoCompare.app"
    or open it, then choose System Settings > Privacy & Security > Open Anyway.
  EOS
end
