cask "discodrive" do
  version "0.1.1"
  sha256 "18e5a193f663718afac59e64043cb2240c108fac79ebe3fc23b516d82d094d03"

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
