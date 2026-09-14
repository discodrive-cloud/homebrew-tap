class DiscodriveDaemonTray < Formula
  desc "Sync daemon for the DiscoDrive personal cloud, with a menu bar icon"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.0.6"
  license "PolyForm-Noncommercial-1.0.0"

  conflicts_with "discodrive-daemon", because: "both install the discodrive binary"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-darwin-arm64-tray.tar.gz"
      sha256 "fdc7c28bf96c1c0fe1c1640e1646b67fbc304f37e91977a3261b10e677753064"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-darwin-amd64-tray.tar.gz"
      sha256 "dfdec2d6f67ff114833e4aafb613c4ecd23ca20b2411f05bbee353e10eaa1b77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-linux-arm64-tray.tar.gz"
      sha256 "b597b7161f50e6f9d458be14b5b62e0d094f01e0a2c5b6aeb5fd14a0b129f5bf"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-linux-amd64-tray.tar.gz"
      sha256 "5672a1049738a23cbdc7e72e6132f47c513bcbccb76cc794ff903071e1617abc"
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

      Run it with the menu bar icon:
        discodrive tray
    EOS
  end

  test do
    output = shell_output("#{bin}/discodrive 2>&1", 2)
    assert_match "pair|run|tray|status|install|uninstall", output
  end
end
