class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/kosmosoid/discodrive-apps"
  version "0.0.3"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.3/discodrive-daemon-darwin-arm64.tar.gz"
      sha256 "8c2d58dea918e886708235bc9175c88b77fb952797b49a69794c82472f002081"
    end
    on_intel do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.3/discodrive-daemon-darwin-amd64.tar.gz"
      sha256 "82c937dba748a59c4830ee1c2e509b210bb34b9fda36bef208f8076ef05f4c37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.3/discodrive-daemon-linux-arm64.tar.gz"
      sha256 "47e337d4edbed17538278cf21ad1ba4863075c5e0e26366b0f19e030c5507aac"
    end
    on_intel do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.3/discodrive-daemon-linux-amd64.tar.gz"
      sha256 "4039b81b6c50c968d8f25c2acfcd5cab9e462df1b557e77f12636eedcf88bf94"
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
