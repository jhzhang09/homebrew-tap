cask "tendyron-token" do
  version "0.3.3"

  on_arm do
    on_tahoe :or_older do
      sha256 "d10bd9b7982c5b4e4b85e2f3ad87a2d726faaaf02f6a8b6f169b365551208361"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos12-universal.pkg"

      pkg "TendyronTokenMac-#{version}-macos12-universal.pkg"
    end
    on_golden_gate :or_newer do
      sha256 "842e0151161bad6c5c38eb8049186d72ef77790cd955c813895ee4109b8991c3"

      url "https://github.com/jhzhang09/homebrew-tap/releases/download/tendyron-token-v#{version}/TendyronTokenMac-#{version}-macos27-arm64.pkg"

      pkg "TendyronTokenMac-#{version}-macos27-arm64.pkg"
    end
  end
  on_intel do
    sha256 "d10bd9b7982c5b4e4b85e2f3ad87a2d726faaaf02f6a8b6f169b365551208361"

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
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/TendyronTokenHost.app"]
  end

  uninstall quit:    "com.tendyron.oakey.host",
            pkgutil: "com.tendyron.oakey.installer"

  zap trash: [
    "~/Library/Preferences/com.tendyron.oakey.host.plist",
    "~/Library/Saved Application State/com.tendyron.oakey.host.savedState",
  ]
end
