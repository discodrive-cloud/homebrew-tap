class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.0.6"
  license "PolyForm-Noncommercial-1.0.0"

  conflicts_with "discodrive-daemon-tray", because: "both install the discodrive binary"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-darwin-arm64.tar.gz"
      sha256 "2b9b71769d81732bb9c697102de8190a033f4ebd113550815ac102fb27f969b7"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-darwin-amd64.tar.gz"
      sha256 "5353b8024b949e6e14738e693608030500242f5ac7905d55a0dd432d2c139caa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-linux-arm64.tar.gz"
      sha256 "c0725a8a78e2eabf521126365a78935a7972ed7e4fa046ac1f7399448997ae30"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.0.6/discodrive-daemon-linux-amd64.tar.gz"
      sha256 "68818db7b0a4051d5c9182ebda904a24de250bb778b1a5193fc783f5f29fa629"
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
