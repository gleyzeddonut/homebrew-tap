cask "uad-doctor" do
  version "1.4.3"
  sha256 "c7d10f76e1318bd28c1483c76892ee9b345ecde4decca01d47b02c44d3dc08f0"

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
