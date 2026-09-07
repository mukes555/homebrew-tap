# homebrew-tap

Homebrew tap for [PortNanny](https://github.com/mukes555/PortNanny), a native
macOS menu bar port manager that knows whose server it is. It was called
PortKilla until 2.1.

## Install

```bash
brew tap mukes555/tap
brew install --cask portnanny
```

If Homebrew asks you to trust the tap (a standard prompt for third-party casks
that run setup commands; PortNanny's just strips the Gatekeeper quarantine so
the unsigned app opens cleanly), approve it once:

```bash
brew trust mukes555/tap
```

The cask is pinned to each release (a universal build for Apple Silicon and
Intel), so `brew upgrade` sees new versions. Requires macOS 13 (Ventura) or
newer.

## Upgrading from PortKilla

The cask was `portkilla` until 2.1. `brew upgrade --cask portnanny` (or a
plain `brew upgrade`) follows the rename: PortKilla.app goes, PortNanny.app
comes, and a `portkilla` command stays linked next to `portnanny`. The rest
is in [docs/FIRST-RUN.md](https://github.com/mukes555/PortNanny/blob/main/docs/FIRST-RUN.md#upgrading-from-portkilla).
