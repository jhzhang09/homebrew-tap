cask "serval" do
  version "0.6.0"
  sha256 "ed6c08ef92c2845f3f7c5c7c6ff37e3c6e293cc368f38725055c6edf04ddb7fb"

  url "https://github.com/jhzhang09/serval/releases/download/v#{version}/serval-#{version}.dmg"
  name "Serval"
  desc "Lightweight native SSH, SFTP and terminal client"
  homepage "https://github.com/jhzhang09/serval"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Serval.app"
  binary "#{appdir}/Serval.app/Contents/MacOS/Serval", target: "serval"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Serval.app"]
  end

  zap trash: [
    "~/Library/Application Support/Serval",
    "~/Library/Preferences/io.github.jhzhang09.serval.plist",
    "~/Library/Saved Application State/io.github.jhzhang09.serval.savedState",
  ]
end
