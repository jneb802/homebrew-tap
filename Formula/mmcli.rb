class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.10/mmcli-darwin-arm64"
      sha256 "ff23ffa4235d603448dfae48ec6f9d4463f5f1ec98e3f8db1b45c4b74e2bf205"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.10/mmcli-darwin-amd64"
      sha256 "807724a52c265ef313d4c22d2fecfbb27eb183f750f06475b02cd4e44829107a"
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
