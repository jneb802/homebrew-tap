class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.2.0/mmcli-darwin-arm64"
      sha256 "973e7111d258ee907dd054c5bf065d71e26b62a4028a37f77307e45f3acc38f2"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.2.0/mmcli-darwin-amd64"
      sha256 "ae727b344f4f557180a1ef9021407fb57a5e3ef6327b9990414d7cc79fa4fd02"
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
