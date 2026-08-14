class DiscodriveDaemonTray < Formula
  desc "Sync daemon for the DiscoDrive personal cloud, with a menu bar icon"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.0.5"
  license "PolyForm-Noncommercial-1.0.0"

  conflicts_with "discodrive-daemon", because: "both install the discodrive binary"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-darwin-arm64-tray.tar.gz"
      sha256 "7cbc9d8872520e314f13b0bed16fb4f035387c4595dcea8d5847f706e1fa4571"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-darwin-amd64-tray.tar.gz"
      sha256 "b4624f0b537b5864bf32bc59c89e27cc86f3cf9a81db9a891870dd862529a520"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-linux-arm64-tray.tar.gz"
      sha256 "f23199763b46da061bc8d57b0a2adfc323b099dfa64fe38654755c0204b7198c"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.5/discodrive-daemon-linux-amd64-tray.tar.gz"
      sha256 "7729ce693881a0398baf6ea432f8814bc909d41c82967a104189d8e8c6ab738a"
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
