cask "tendyron-token" do
  version "0.4.0"

  on_arm do
    on_tahoe :or_older do
      sha256 "8d5228a0a13db3c6df1c0a565d292f7c033bbb40a8512968223002f1f17e3977"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos12-universal.pkg"

      pkg "TendyronTokenMac-#{version}-macos12-universal.pkg"
    end
    on_golden_gate :or_newer do
      sha256 "e9d66491e19a92d08afb4642fd80f26fcae13e9be1a2ec71d742c8a68f0dd84e"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos27-arm64.pkg"

      pkg "TendyronTokenMac-#{version}-macos27-arm64.pkg"
    end
  end
  on_intel do
    sha256 "8d5228a0a13db3c6df1c0a565d292f7c033bbb40a8512968223002f1f17e3977"

    url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos12-universal.pkg"

    pkg "TendyronTokenMac-#{version}-macos12-universal.pkg"
  end

  name "TendyronTokenHost"
  desc "CryptoTokenKit smart card extension and CCID driver for Tendyron OA Key"
  homepage "https://github.com/jhzhang09/homebrew-tap"

  livecheck do
    url :homepage
    regex(/^tendyron-token-v?(\d+(?:\.\d+)+)$/i)
    strategy :git
  end

  depends_on macos: :monterey

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
