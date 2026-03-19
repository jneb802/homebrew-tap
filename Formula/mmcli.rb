class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.3.0/mmcli-darwin-arm64"
      sha256 "739a7a39c3cc6a30dec7d0126c89f521d0639ef83818d159c6648c8d7bc4d0bd"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.3.0/mmcli-darwin-amd64"
      sha256 "e1bca24f2229ad6f4fb7d2d0eb8890f426f3d98dc84780fa8471abd4c954cd6d"
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
