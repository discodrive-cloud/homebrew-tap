class DiscodriveCli < Formula
  desc "DiscoDrive from the terminal and inside your AI assistant (dd-cli, dd-mcp)"
  homepage "https://github.com/discodrive-cloud/discodrive-cli"
  version "0.1.1"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.1/discodrive-cli-0.1.1-darwin-arm64.tar.gz"
      sha256 "03eb294a45691d2a29cb5bad283abfb92b618ee19762c974ab9b035505029e22"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.1/discodrive-cli-0.1.1-darwin-amd64.tar.gz"
      sha256 "1c44b25c4b648b8191d39721158a20d19ab2d8c2b26361d2315b9adfef392bf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.1/discodrive-cli-0.1.1-linux-arm64.tar.gz"
      sha256 "e8b80b843df09ba2d61cbf234a5ff11264c42e835a8534358dda52694513414a"
    end
    on_intel do
      url "https://github.com/discodrive-cloud/discodrive-cli/releases/download/v0.1.1/discodrive-cli-0.1.1-linux-amd64.tar.gz"
      sha256 "ed59d06cb586e0dd6ca7953ab5de0f5a3e1f54eda932cc87a60ee87e2ae439a3"
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
