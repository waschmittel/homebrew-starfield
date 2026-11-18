cask "starfield" do
  version "2.0.0"
  sha256 "e77f2d5b079e26dc502634fed7e1fd4dfb2b281e8cfb4b349f30ba341fdc0259"

  url "https://github.com/waschmittel/starfield/releases/download/v#{version}/Starfield-macos-#{version}.saver.zip"
  name "Starfield"
  desc "Classic Windows-style starfield screensaver"
  homepage "https://github.com/waschmittel/starfield"

  deprecate! date: "2026-11-18", because: :discontinued, replacement_cask: "starfield-app"

  depends_on macos: :sonoma

  screen_saver "Starfield.saver"

  # The saver is only ad-hoc signed, so macOS would refuse to load a quarantined copy.
  preflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{staged_path}}/Starfield.saver"]
  end

  zap trash: "~/Library/Preferences/ByHost/de.flubba.starfield.saver.*.plist"
end
