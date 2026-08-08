# homebrew-tap

Homebrew tap for [PortKilla](https://github.com/mukes555/PortKilla) — a native
macOS menu-bar port manager.

## Install

```bash
brew tap mukes555/tap
brew install --cask portkilla
```

If Homebrew asks you to trust the tap (a standard prompt for third-party casks
that run setup commands — PortKilla's just strips the Gatekeeper quarantine so
the unsigned app opens cleanly), approve it once:

```bash
brew trust mukes555/tap
```

The cask tracks the latest PortKilla release (a universal build for Apple
Silicon + Intel), so it stays current without per-release updates. Requires
macOS 13 (Ventura) or newer.
