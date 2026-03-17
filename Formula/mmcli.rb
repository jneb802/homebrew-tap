class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.3/mmcli-darwin-arm64"
      sha256 "6df86ade91891d81d405b2104347858068cc671c4c24938349c5be161ff16862"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.3/mmcli-darwin-amd64"
      sha256 "2040942c1dba6007b8dbd32ff2b4222c5c2fff0da1044258655b1f7dd9d4b26d"
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
