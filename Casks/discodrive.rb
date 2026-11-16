cask "discodrive" do
  version "0.1.7"
  sha256 "7c980445b1f2a6c375c4a31aa7dab4a8f9a5876f4c4ee2e7c940dcf8d1ecc5fa"

  url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v#{version}/DiscoDrive-#{version}-macos.dmg"
  name "DiscoDrive"
  desc "DiscoDrive personal cloud in Finder"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "DiscoDrive.app"

  zap trash: [
    "~/Library/Containers/org.discodrive.app",
    "~/Library/Containers/org.discodrive.app.fileprovider",
    "~/Library/Containers/org.discodrive.app.fileproviderui",
    "~/Library/Group Containers/TQD2R45V4P.org.discodrive",
  ]
end
