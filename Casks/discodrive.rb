cask "discodrive" do
  version "0.0.6"
  sha256 "d33d1edd1e2823976addd37c4b7efb082a915044668a21113277855ba2f7d7b3"

  url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v#{version}/DiscoDrive-#{version}-macos.dmg"
  name "DiscoDrive"
  desc "Desktop client for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "DiscoDrive.app"

  zap trash: [
    "~/Library/Application Support/discodrive/desktop",
    "~/Library/LaunchAgents/com.wails.discodrive-wails.plist",
  ]
end
