cask "starfield" do
  version "2.0.0"
  sha256 "6e30dc540d8de668e6724d969b5ae0cf22744b58304324f16f1a4eeffdf39a3b"

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
