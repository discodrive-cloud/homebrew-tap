cask "discodrive" do
  version "0.1.0"
  sha256 "ce66083919616e45c55a25ed68176aeea2e926b0b46fef8386c8f6c04f0ee54b"

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
