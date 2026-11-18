cask "starfield-app" do
  version "2.0.0"
  sha256 "56ef6ed7a6e181e9a988ddddbc0c1821437b8153bc877468e67af8734e7341d5"

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

  # Registers the extension with PlugInKit, like opening the app once.
  postflight_steps do
    run "/usr/bin/pluginkit",
        args: ["-a", "{{appdir}}/Starfield.app/Contents/PlugIns/Starfield.appex"]
  end

  uninstall_preflight_steps do
    run "/usr/bin/pluginkit",
        args:         ["-r", "{{appdir}}/Starfield.app/Contents/PlugIns/Starfield.appex"],
        must_succeed: false
  end

  zap trash: "~/Library/Containers/de.flubba.starfield.extension"
end
