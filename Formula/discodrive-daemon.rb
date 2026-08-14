class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.0.5"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-darwin-arm64.tar.gz"
      sha256 "2eff6f1cbe8fb266ea8046ca98ba597bc1fa4fafa744994b9f96a22e19767895"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-darwin-amd64.tar.gz"
      sha256 "88e8ec21cac91c1b22a917523ed1035e6cd50d380c26c46c1629c7b0d6a45800"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-linux-arm64.tar.gz"
      sha256 "85480b6ceaa514190db7bd8f8a1813bf2a6316cfcadded16848a601b898138ff"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-linux-amd64.tar.gz"
      sha256 "5863cb18a1a92efec753b96cc7cca1ecd22eed9ccd9ed51d322d7f291139bc0a"
    end
  end

  def install
    bin.install "discodrive"
  end

  def caveats
    <<~EOS
      Pair with your DiscoDrive server first:
        discodrive pair --server https://your-server.example
      Then run it in the foreground with `discodrive run`, or install it
      as a login service with `discodrive install`.
    EOS
  end

  test do
    output = shell_output("#{bin}/discodrive 2>&1", 2)
    assert_match "pair|run|tray|status|install|uninstall", output
  end
end
