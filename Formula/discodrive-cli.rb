class DiscodriveCli < Formula
  desc "DiscoDrive from the terminal and inside your AI assistant (dd-cli, dd-mcp)"
  homepage "https://github.com/discodrive-cloud/discodrive-cli"
  version "0.1.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.0/discodrive-cli-0.1.0-darwin-arm64.tar.gz"
      sha256 "a062ad7aca11ec49d5f560b1a82b79bce09c2f5feee819b31f988cbaf3b61a3b"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.0/discodrive-cli-0.1.0-darwin-amd64.tar.gz"
      sha256 "e4c3b3a66aa1d49a77991731f43b0fde1176d1b618919a79f071d9a1ed372366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.0/discodrive-cli-0.1.0-linux-arm64.tar.gz"
      sha256 "d4564f003d6eeeb1a3da169854474f4fa77e422a48ad46a3ca719497c57beeeb"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.0/discodrive-cli-0.1.0-linux-amd64.tar.gz"
      sha256 "6b2bec1b981c69ca73541ee98b7b0611c80472dbd42e4eebe8085ef0bd94baee"
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
