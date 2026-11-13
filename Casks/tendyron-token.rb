cask "tendyron-token" do
  version "0.4.6"

  on_arm do
    on_tahoe :or_older do
      sha256 "0e00121d5150f30c5c1af44713c4cef826f8cf77c969866f74f1139f2f526295"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos11-universal.pkg"

      pkg "TendyronTokenMac-#{version}-macos11-universal.pkg"
    end
    on_golden_gate :or_newer do
      sha256 "333edc9e2e2a085787da8d4e7c671c24b50101d2a453786e2a4452de93c53b34"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos27-arm64.pkg"

      pkg "TendyronTokenMac-#{version}-macos27-arm64.pkg"
    end
  end
  on_intel do
    sha256 "0e00121d5150f30c5c1af44713c4cef826f8cf77c969866f74f1139f2f526295"

    url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos11-universal.pkg"

    pkg "TendyronTokenMac-#{version}-macos11-universal.pkg"
  end

  name "TendyronTokenHost"
  desc "CryptoTokenKit smart card extension and CCID driver for Tendyron OA Key"
  homepage "https://github.com/jhzhang09/homebrew-tap"

  livecheck do
    url :homepage
    regex(/^tendyron-token-v?(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  depends_on macos: :big_sur

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/TendyronTokenHost.app"],
        sudo: true
  end

  # pkgutil 卸载会按安装记录一并移除宿主内的 OA 桥接、扩展目录和系统级 Chrome 注册文件。
  uninstall quit:    "com.tendyron.oakey.host",
            pkgutil: "com.tendyron.oakey.installer"

  zap trash: [
    "~/Library/Logs/Tendyron/OABridge",
    "~/Library/Preferences/com.tendyron.oakey.host.plist",
    "~/Library/Saved Application State/com.tendyron.oakey.host.savedState",
  ]

  caveats <<~EOS
    Chrome OA 登录助手需要手动加载一次：
      打开 TendyronTokenHost 的“状态”页，按提示在 chrome://extensions 加载
      /Applications/TendyronTokenHost.app/Contents/Resources/OAChromeExtension
    每次 brew upgrade 后，请在 chrome://extensions 重新加载该扩展并刷新 OA 页面。
    卸载后请在 Chrome 中移除该扩展。
  EOS
end
