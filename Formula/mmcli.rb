class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.17/mmcli-darwin-arm64"
      sha256 "f859c55cab9a7110c25cd39e5cbf6b4523cc32994363b1dcfcaedc230c534924"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.17/mmcli-darwin-amd64"
      sha256 "3ef25b637907318291ab133600c9a0f9dbe5b6fd696e8609a6cdb9569109b275"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.17/mmcli-linux-amd64"
    sha256 "96c24f44977ddd6f996c9bc2f31d1aba1dd1788897429327d1599a54208f2a8e"
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
