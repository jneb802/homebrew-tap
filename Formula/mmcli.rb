class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.0/mmcli-darwin-arm64"
      sha256 "bb52a36c398d08680ddaf6ac087c4ebfe8ec161e3dbfcb3b7cae5a584c2aac46"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.0/mmcli-darwin-amd64"
      sha256 "633ef554ccb980ee1db3c67858a01b09ee37acff893312d1d8f43c4eda352509"
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
