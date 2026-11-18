cask "starfield-app" do
  version "2.0.1"
  sha256 "64bc0f5e072afc437f47dd28966fa6de53abb1527b1071f2adce67d3b37f8d96"

  url "https://github.com/waschmittel/starfield/releases/download/v#{version}/Starfield-macos-appex-#{version}.app.zip"
  name "Starfield"
  desc "Classic Windows-style starfield screensaver (app extension)"
  homepage "https://github.com/waschmittel/starfield"

  conflicts_with cask: "starfield"
  depends_on macos: :sonoma

  app "Starfield.app"

  # The app is only ad-hoc signed, so macOS would refuse to load a quarantined copy.
  preflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{staged_path}}/Starfield.app"]
  end

  zap trash: "~/Library/Containers/de.flubba.starfield.extension"

  caveats <<~EOS
    Open Starfield.app once to register the screen saver extension:
      open -a Starfield
  EOS
end
