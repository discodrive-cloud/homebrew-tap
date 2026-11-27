class DiscodriveCli < Formula
  desc "DiscoDrive from the terminal and inside your AI assistant (dd-cli, dd-mcp)"
  homepage "https://github.com/discodrive-cloud/discodrive-cli"
  version "0.1.3"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.3/discodrive-cli-0.1.3-darwin-arm64.tar.gz"
      sha256 "d0c4012f1f78838113b1682d4ce7b2fcc600f4d3f84e036b0e6a572d01f07892"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.3/discodrive-cli-0.1.3-darwin-amd64.tar.gz"
      sha256 "153cf4b47e364ca422f78a3eefd81d1d45f5db292e4304ece1690f192c962e3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.3/discodrive-cli-0.1.3-linux-arm64.tar.gz"
      sha256 "3c34d8f80cd2b2494032d54549f6539fb3dda0b5bf0e161c99f728484d78189a"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.3/discodrive-cli-0.1.3-linux-amd64.tar.gz"
      sha256 "44e4958357394ff6a0c7299baad7c2f76b641844a6296e0af44feea35bbb75a3"
    end
  end

  def install
    bin.install "dd-cli"
    bin.install "dd-mcp"
  end

  def caveats
    <<~EOS
      Sign in to your DiscoDrive server (this also connects Claude):
        dd-cli login --server https://your-server.example
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dd-cli --version")
    assert_match version.to_s, shell_output("#{bin}/dd-mcp --version")
  end
end
