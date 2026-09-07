# frozen_string_literal: true

# Homebrew cask for Tracon, pinned to one release. Tracon's release workflow
# renders this from packaging/homebrew/tracon.rb.tmpl (version, checksums)
# and pushes it here when a HOMEBREW_TAP_TOKEN secret is configured.
cask "tracon" do
  version "0.3.0"

  on_arm do
    sha256 "188449226c17581296489cbac5f38ec7d4e737423d2e521b805cf6adcec438d4"

    url "https://github.com/mukes555/tracon/releases/download/v#{version}/Tracon_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "39d441942c97716b5b15cb54e0a89dc40b45a96470e549916640c60ab3bbb706"

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
    "~/Library/Application Support/dev.tracon.desktop",
    "~/Library/Caches/dev.tracon.desktop",
    "~/Library/Preferences/dev.tracon.desktop.plist",
    "~/Library/Saved Application State/dev.tracon.desktop.savedState",
    "~/Library/WebKit/dev.tracon.desktop",
  ]
end
