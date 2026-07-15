# Homebrew Cask for Browser Picker.
#
# Place this file in your tap repository (github.com/mertizci/homebrew-tap)
# under Casks/browser-picker.rb so users can install with:
#
#   brew install --cask mertizci/tap/browser-picker
#
# After each release, update `version` and `sha256` (printed by scripts/release.sh).
cask "browser-picker" do
  version "1.0.15"
  sha256 "3fab87b0d879bb152430c46db7c16c808a0bf38f2604b66ab47b513124b0fa66"

  url "https://github.com/mertizci/browser-picker/releases/download/v#{version}/BrowserPicker-#{version}.zip"
  name "Browser Picker"
  desc "Menu bar default-browser router with per-profile routing rules"
  homepage "https://github.com/mertizci/browser-picker"

  depends_on macos: :sonoma

  app "BrowserPicker.app"

  zap trash: [
    "~/Library/Application Support/BrowserPicker",
    "~/Library/Preferences/com.browserpicker.app.plist",
    "~/Library/Caches/com.browserpicker.app",
  ]
end
