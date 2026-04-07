class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.1/mmcli-darwin-arm64"
      sha256 "69826011882506106bb97cb82b1904879d507563607f6c027c40058ef56ff2f2"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.1/mmcli-darwin-amd64"
      sha256 "591d5cf1f1dea42996b60e840500a699d2761a91e0a35f537a8861706f6d2ca0"
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
