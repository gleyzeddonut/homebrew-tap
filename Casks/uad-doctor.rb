cask "uad-doctor" do
  version "1.4.4"
  sha256 "134669ead0496a2e076a44dcf3b4949cb75c452f40b7ea48f5f730f0907a6cf8"

  url "https://gggaudio.store/uad-doctor/UADDoctor-#{version}.pkg"
  name "UAD Doctor"
  desc "Menu-bar DSP monitor and one-click recovery for UA Apollo and UAD-2 rigs"
  homepage "https://gggaudio.store/uad-doctor/"

  livecheck do
    url "https://gggaudio.store/uad-doctor/version.json"
    regex(/"version":\s*"(\d+(?:\.\d+)+)"/i)
  end

  depends_on macos: :ventura

  pkg "UADDoctor-#{version}.pkg"

  uninstall quit:    "com.dangleyzer.uaddoctor",
            pkgutil: "com.dangleyzer.uaddoctor.pkg"

  zap trash: [
    "~/Library/Application Support/uadfix",
    "~/Library/Preferences/com.dangleyzer.uaddoctor.plist",
  ]

  caveats <<~EOS
    UAD Doctor lives in the menu bar (no Dock icon). Open it from /Applications and look for the dot.
    It works with any Apollo or UAD-2 device managed by UA's Console software, and any DAW.
  EOS
end
