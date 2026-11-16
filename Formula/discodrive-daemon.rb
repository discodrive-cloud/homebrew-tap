class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/discodrive-cloud/discodrive-apps"
  version "0.1.7"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :linux

  on_arm do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.7/discodrive-daemon-linux-arm64.tar.gz"
    sha256 "541aba698646cb12749e08a3b7c29ad52cca06125e8c6ab6e7d65fc2325af0ec"
  end
  on_intel do
    url "https://github.com/discodrive-cloud/discodrive-apps/releases/download/v0.1.7/discodrive-daemon-linux-amd64.tar.gz"
    sha256 "91ff9fd1d5cac94efd44b4afd80c21fae40e0d9d4edbcfbf200ee28a960eb16e"
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
