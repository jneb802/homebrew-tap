class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.6/mmcli-darwin-arm64"
      sha256 "85c527668b9de6337a1ea1494c96bc092f7fd99d9578c45b38c9a1eb023d45dc"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.6/mmcli-darwin-amd64"
      sha256 "8440895b1601e138ec1db673772ecaba5601c8cff0677c35071b016e300cb3ee"
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
