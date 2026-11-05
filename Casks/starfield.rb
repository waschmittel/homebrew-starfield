cask "starfield" do
  version "1.2.0"
  sha256 "e40c10c41a47cc1209baea239f05406eadb16e6fb9f24d19ff33ea7a4c6142fb"

  url "https://github.com/waschmittel/starfield/releases/download/v#{version}/Starfield-macos-#{version}.saver.zip"
  name "Starfield"
  desc "Classic Windows-style starfield screensaver"
  homepage "https://github.com/waschmittel/starfield"

  depends_on macos: :sonoma

  screen_saver "Starfield.saver"

  # The saver is only ad-hoc signed, so macOS would refuse to load a quarantined copy.
  preflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{staged_path}}/Starfield.saver"]
  end

  zap trash: "~/Library/Preferences/ByHost/de.flubba.starfield.saver.*.plist"
end
