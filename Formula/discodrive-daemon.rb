class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.1.1"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :linux

  on_arm do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.1/discodrive-daemon-linux-arm64.tar.gz"
    sha256 "52c5101aa987a0cbde9d5b8f54b2d57ddce6ea0b8937f4eeab22a1ee3531c0be"
  end
  on_intel do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.1/discodrive-daemon-linux-amd64.tar.gz"
    sha256 "1a544e1ebc400163db10cb2680d1a2ad2d7fd6a0f03db3624449266ecc97aa21"
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
    assert_match "pair|run", output
  end
end
