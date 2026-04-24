class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.8/mmcli-darwin-arm64"
      sha256 "527b3d7d5c298bcfa0c687ca18c60e4e96c418dd466c0b4092451ae2c6255359"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.8/mmcli-darwin-amd64"
      sha256 "2244d5ef7c72b4e95eecb73d55497b0a049414bbfc50e83f9261cad46f90c4a6"
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
