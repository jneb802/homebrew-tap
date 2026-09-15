class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.16/mmcli-darwin-arm64"
      sha256 "3ce896f1e69d54c758734ff5ffef801ca7654671828c1e960a761981256fb472"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.16/mmcli-darwin-amd64"
      sha256 "ac2df6280792ab3b44911ae55d04bdf22de8a9c81b0147be6f3df17daecd06b3"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.16/mmcli-linux-amd64"
    sha256 "c3d12da1e31cc4fab7ae303992d87cf77e6be2fdcec992b725525ad9ad7891db"
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
