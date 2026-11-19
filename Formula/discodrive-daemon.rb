class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.1.8"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :linux

  on_arm do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.8/discodrive-daemon-linux-arm64.tar.gz"
    sha256 "a8ed137789c38665afaa862e768fc3af056f437b217e89fded48cdb97865a10f"
  end
  on_intel do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.8/discodrive-daemon-linux-amd64.tar.gz"
    sha256 "808709036106c9d91e14da57751729f7a1799c841cd521f5010cc8b900904931"
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
