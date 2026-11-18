# homebrew-starfield

Homebrew tap for [Starfield](https://github.com/waschmittel/starfield), a classic Windows-style starfield
screensaver for macOS.

```sh
brew install --cask waschmittel/starfield/starfield-app
# or
brew tap waschmittel/starfield
brew install --cask starfield-app
```

Requires macOS 14 or newer (Apple Silicon and Intel). Open `Starfield.app` once (`open -a Starfield`) to
register the screen saver extension, then pick **Starfield** in
**System Settings > Wallpaper > Screen Saver** (macOS 26) or **System Settings > Screen Saver** (macOS 14
and 15). After an upgrade run `killall WallpaperAgent`.

`starfield-app` installs `Starfield.app`, which embeds the screensaver as a modern app extension (the format
Apple's own savers use, not affected by `legacyScreenSaver`'s memory leaks).

### Deprecated: `starfield` (`.saver` bundle)

The legacy `starfield` cask (`Starfield.saver`) is deprecated in favor of `starfield-app` and conflicts
with it:

```sh
brew install --cask waschmittel/starfield/starfield
```

After an upgrade run `killall legacyScreenSaver WallpaperAgent` so the new version is loaded.

Neither is signed with an Apple Developer ID, so the casks remove the download quarantine flag
after installing it.

The casks in `Casks/` are **generated** by the release workflow of
[starfield](https://github.com/waschmittel/starfield) whenever a `v*` tag is pushed there (new version
and checksum). Do not edit it by hand; fix the workflow instead.

## One-time setup

The workflow pushes to this repository with a token stored in the *starfield* repository secrets as
`HOMEBREW_TAP_TOKEN`: a fine-grained personal access token with **Contents: read and write** on this
repository only.
