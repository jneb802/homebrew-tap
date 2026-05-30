class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.11/mmcli-darwin-arm64"
      sha256 "570fe555af07a53af20c6f555392b44b18dadfd5c108f4200a786819fff957da"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.11/mmcli-darwin-amd64"
      sha256 "fe3743b8da0063ce7c5adf70279d0cc2149636aead5819a8ceb958cf1c635d4f"
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
