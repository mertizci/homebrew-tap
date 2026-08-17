# Homebrew Cask for Duckows.
#
# Users install with:
#
#   brew install --cask mertizci/tap/duckows
#
# `version` and `sha256` are bumped automatically by the Release workflow in
# mertizci/duckows. Keep the two-space indentation on those two lines — the
# sed-based bump anchors on it.
cask "duckows" do
  version "0.2.0"
  sha256 "c244e4999114e870580177105a81017fdba21e343ec17b2bce50f7ed62c5d628"

  url "https://github.com/mertizci/duckows/releases/download/v#{version}/Duckows-#{version}.zip"
  name "Duckows"
  desc "Windows-style taskbar and Start menu that replaces the macOS Dock"
  homepage "https://github.com/mertizci/duckows"

  # Duckows ships a signature-verified in-app updater, so `brew upgrade` must
  # not roll a self-updated copy back to whatever the cask last recorded.
  auto_updates true

  depends_on macos: :sonoma

  app "Duckows.app"

  # Quit gracefully instead of letting Homebrew delete a running app:
  # applicationWillTerminate is what puts the system Dock back. A hard delete
  # would leave the user with no Dock and no taskbar.
  uninstall quit: "com.duckows.app"

  zap trash: [
    "~/Library/Application Support/Duckows",
    "~/Library/Caches/com.duckows.app",
    "~/Library/HTTPStorages/com.duckows.app",
    "~/Library/Preferences/com.duckows.app.plist",
    "~/Library/Saved Application State/com.duckows.app.savedState",
  ]

  caveats <<~EOS
    First launch: open Duckows from Applications and click "Open" when macOS
    asks about an app downloaded from the Internet. Duckows has no Dock icon
    and no window of its own, so if that prompt is dismissed or missed it
    looks like nothing happened — the app is simply waiting for the answer.

    Duckows needs Accessibility to read window titles and move windows.
    Grant it in System Settings -> Privacy & Security -> Accessibility,
    then relaunch Duckows.

    Duckows takes the Dock's place while it runs and restores your Dock
    settings when it quits. If the Dock is ever left in a strange state:
      open -a Duckows --args --restore-dock
  EOS
end
