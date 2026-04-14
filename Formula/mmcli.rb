class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.4/mmcli-darwin-arm64"
      sha256 "0c67d18ae76ba18d5a9462b62c6cea02e416db6e24f36195e8ff3aca3984597e"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.4/mmcli-darwin-amd64"
      sha256 "25fba73f3026257e71367e8c353e9beeea487d7e9f38e1be922a938c4e2c1d8b"
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
