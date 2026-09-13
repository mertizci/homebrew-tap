# Homebrew Cask for Browser Picker.
#
# Place this file in your tap repository (github.com/mertizci/homebrew-tap)
# under Casks/browser-picker.rb so users can install with:
#
#   brew install --cask mertizci/tap/browser-picker
#
# After each release, update `version` and `sha256` (printed by scripts/release.sh).
cask "browser-picker" do
  version "1.0.21"
  sha256 "140ffec5ab8812ba176d3937f3bb634a01ded75fae3924d0f5bf4024a8e06c09"

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
