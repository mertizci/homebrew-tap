# Homebrew Cask for Thermal Printer Simulator.
#
# Place this file in your tap repository (github.com/mertizci/homebrew-tap)
# under Casks/thermal-printer-simulator.rb so users can install with:
#
#   brew install --cask mertizci/tap/thermal-printer-simulator
#
# `version` and `sha256` are bumped automatically by .github/workflows/release.yml.
cask "thermal-printer-simulator" do
  version "1.0.1"
  sha256 "6a4481c2dc57c3e2766365a7bc1c1bfda43fbbf5073767120f3f57eabc298f38"

  url "https://github.com/mertizci/thermal-printer-simulator/releases/download/v#{version}/ThermalPrinterSimulator-#{version}.zip"
  name "Thermal Printer Simulator"
  desc "Virtual ESC/POS and Star thermal printers as real macOS CUPS queues"
  homepage "https://github.com/mertizci/thermal-printer-simulator"

  auto_updates true

  depends_on macos: :sonoma

  app "ThermalPrinterSimulator.app"
  # The CLI ships inside the bundle, so one artifact provides both.
  binary "#{appdir}/ThermalPrinterSimulator.app/Contents/MacOS/thermal-sim"

  uninstall quit: "com.thermalprintersimulator.app",
            delete: [
    # The optional raster filter, installed root-owned by `thermal-sim filter install`
    # because cupsd runs no other kind.
    "/Library/Printers/ThermalPrinterSimulator",
  ]

  # Removing the app does not remove the CUPS queues it created — those are system
  # printer configuration, not app data. Run `thermal-sim uninstall --all` first.
  caveats <<~EOS
    Before uninstalling, remove any simulated printer queues:

      thermal-sim uninstall --all

    Otherwise the CUPS queues stay installed and will keep retrying jobs.

    To let ordinary applications (PDF, images, text) print to the simulated
    printers, install the raster filter once — it needs an administrator:

      thermal-sim filter install
  EOS

  zap trash: [
    "~/Library/Application Support/ThermalPrinterSimulator",
    "~/Library/Preferences/com.thermalprintersimulator.app.plist",
    "~/Library/Caches/com.thermalprintersimulator.app",
  ]
end
