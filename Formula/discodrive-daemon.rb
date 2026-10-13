class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.1.0"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :linux

  on_arm do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.0/discodrive-daemon-linux-arm64.tar.gz"
    sha256 "d100cc68de9e872c3cf85c228ffb15419cbf34ddf3c2a0f1f7981ae5ad8e4c2d"
  end
  on_intel do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.0/discodrive-daemon-linux-amd64.tar.gz"
    sha256 "9b30cf52593fb23a991bdc72fe403c75d3cbe95c769b628b2f4f2ecd1051e31e"
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
