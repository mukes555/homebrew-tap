# frozen_string_literal: true

# Homebrew cask for Tracon, pinned to one release. The tap workflow renders
# this template (version, checksums) when a release is published and pushes
# it to mukes555/homebrew-tap, so `brew upgrade --cask tracon` sees it.
cask "tracon" do
  version "0.4.0"

  on_arm do
    sha256 "b756d8a92ae0352092e49eaf66d4fbba7e05fcc7fc665d4a21ff77a7da3a5f13"

    url "https://github.com/mukes555/tracon/releases/download/v#{version}/Tracon_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "755590e02ed623b5e836a173767022113d95d7af86d8b361556ac4ed955b469b"

    url "https://github.com/mukes555/tracon/releases/download/v#{version}/Tracon_#{version}_x64.dmg"
  end

  name "Tracon"
  desc "Flight recorder for AI coding agents"
  homepage "https://github.com/mukes555/tracon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tracon.app"

  # The app is not yet code signed, so Gatekeeper quarantine is stripped
  # for it to launch without the "damaged or unidentified developer" dialog.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tracon.app"]
  end

  # Tracon keeps recording from the menu bar after its window is closed, so
  # quit it before an upgrade replaces the bundle.
  uninstall quit: "dev.tracon.desktop"

  # The recorded audit database lives in Application Support; zap removes it
  # along with caches and window state.
  zap trash: [
    "~/.tracon",
    "~/Library/Application Support/dev.tracon.desktop",
    "~/Library/Caches/dev.tracon.desktop",
    "~/Library/Preferences/dev.tracon.desktop.plist",
    "~/Library/Saved Application State/dev.tracon.desktop.savedState",
    "~/Library/WebKit/dev.tracon.desktop",
  ]
end
