# homebrew-starfield

Homebrew tap for [Starfield](https://github.com/waschmittel/starfield), a classic Windows-style starfield
screensaver for macOS.

```sh
brew install waschmittel/starfield/starfield
# or
brew tap waschmittel/starfield
brew install starfield
```

Requires macOS 14 or newer (Apple Silicon and Intel). Then pick **Starfield** in
**System Settings > Screen Saver**. After an upgrade run `killall legacyScreenSaver WallpaperAgent`
so the new version is loaded.

The saver is not signed with an Apple Developer ID, so the cask removes the download quarantine flag
after installing it.

The cask in `Casks/starfield.rb` is **generated** by the release workflow of
[starfield](https://github.com/waschmittel/starfield) whenever a `v*` tag is pushed there (new version
and checksum). Do not edit it by hand; fix the workflow instead.

## One-time setup

The workflow pushes to this repository with a token stored in the *starfield* repository secrets as
`HOMEBREW_TAP_TOKEN`: a fine-grained personal access token with **Contents: read and write** on this
repository only.
