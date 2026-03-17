class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.5/mmcli-darwin-arm64"
      sha256 "f30c33a3e33a1d41d134cc6acb4ad7d63a0339db55ec922684dce0b10965ec7f"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.5/mmcli-darwin-amd64"
      sha256 "f475f63d6828e009405eba5100c13645d513fa3dc8f71f958172f5150d2744c1"
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
