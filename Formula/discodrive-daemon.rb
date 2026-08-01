class DiscodriveDaemon < Formula
  desc "Headless sync daemon for the DiscoDrive personal cloud"
  homepage "https://github.com/kosmosoid/discodrive-apps"
  version "0.0.4"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.4/discodrive-daemon-darwin-arm64.tar.gz"
      sha256 "2724e34e13878a1ab583904032065f11d047e45bde0a12efc07faac3e281f87c"
    end
    on_intel do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.4/discodrive-daemon-darwin-amd64.tar.gz"
      sha256 "d0d1dcf01336ef6b9f3f3a25aab68579b10deb45d1bd8c95e1396d81e734dc26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.4/discodrive-daemon-linux-arm64.tar.gz"
      sha256 "c69ec9170bc12db650cd13b8b8dca9f64f31e36af5fed713f32d1ceaf31a9dfe"
    end
    on_intel do
      url "https://github.com/kosmosoid/discodrive-apps/releases/download/v0.0.4/discodrive-daemon-linux-amd64.tar.gz"
      sha256 "983589d2de31fc44e10b45591c69eff305fc7799833bd6cf5efb40fbfc242312"
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
