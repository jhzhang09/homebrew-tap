cask "gocompare" do
  version "1.1.0"
  sha256 "4cd9b2ceb52c6c09b6239ad90e074350ee702a0fc002dfa4c5d2781de9400988"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/GoCompare.app"]
  end

  zap trash: [
    "~/.config/gocompare",
    "~/Library/Application Support/GoCompare",
    "~/Library/Preferences/dev.gocompare.desktop.plist",
    "~/Library/Saved Application State/dev.gocompare.desktop.savedState",
  ]
end
