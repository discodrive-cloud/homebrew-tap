cask "discodrive" do
  version "0.1.8"
  sha256 "662ffc52b3e6dc41283a259bcd9a9125bc559902d964413dfbff78695dcce01a"

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
