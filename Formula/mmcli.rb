class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.12/mmcli-darwin-arm64"
      sha256 "4e9a4c84233315a00c855026bfb3a5d32d3edeb388ebadf88131db2a31399b73"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.12/mmcli-darwin-amd64"
      sha256 "dd0af2b1c16b7433a00d53dda09ba9a8f28a86a75e3b4e7d4fb88b0b405aa273"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "mmcli-darwin-#{cpu}" => "mmcli"
  end

  test do
    assert_match "Valheim mod manager", shell_output("#{bin}/mmcli --help")
  end
end
