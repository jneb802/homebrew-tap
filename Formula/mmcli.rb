class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.5/mmcli-darwin-arm64"
      sha256 "d3863fbe6a187f973441e08339fa1d61c9cae330a8a3e4d502a540087aa49d49"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.5/mmcli-darwin-amd64"
      sha256 "6d906e6ac51ae277f45b96c02767b8bb747b29cd41090a9a3bd253b602348bfd"
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
