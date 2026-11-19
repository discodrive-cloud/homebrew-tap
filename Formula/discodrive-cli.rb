class DiscodriveCli < Formula
  desc "DiscoDrive from the terminal and inside your AI assistant (dd-cli, dd-mcp)"
  homepage "https://github.com/discodrive-cloud/discodrive-cli"
  version "0.1.2"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.2/discodrive-cli-0.1.2-darwin-arm64.tar.gz"
      sha256 "966f6182db0a3a8417267cc0e69f54772bf51e88c701edcc589c2d9f75d3eec5"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.2/discodrive-cli-0.1.2-darwin-amd64.tar.gz"
      sha256 "e06d4e54e00b3c298244d4967f326380d4f31346216dbe0ba6114964d0b8ccdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.2/discodrive-cli-0.1.2-linux-arm64.tar.gz"
      sha256 "16e09bd8f5d414ff70bd4582115b57c3fed9ea4939df14a6d3b8a74a10fdf74a"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.2/discodrive-cli-0.1.2-linux-amd64.tar.gz"
      sha256 "ce42807629de9e7e06a6d65b6058b613cbdfec3d7fbbf52e2aace78a04b9b6b2"
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
