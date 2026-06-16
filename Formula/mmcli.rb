class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.14/mmcli-darwin-arm64"
      sha256 "1fa14a45e55d2a30edb788d7c392308f70127c6db177233fe983b65cdf7fc112"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.14/mmcli-darwin-amd64"
      sha256 "2fc0cd2e452a745883abb3763b175402df93e59785c99d48d9dbb3640e02254d"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.14/mmcli-linux-amd64"
    sha256 "52ed7caad422b1f3f9f896be223f0045ed2556f3c2c502c978a2aabf3a15a46f"
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    cpu = OS.mac? && Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "mmcli-#{os}-#{cpu}" => "mmcli"
  end

  test do
    assert_match "Valheim mod manager", shell_output("#{bin}/mmcli --help")
  end
end
