class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.3/mmcli-darwin-arm64"
      sha256 "dcf10b5674c05204f2ed80fe233f822a6afc2d016af1704ff0687272aba2b9ad"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.3/mmcli-darwin-amd64"
      sha256 "6e7d3dfdba10f902befd912f88bb8a96261b8ea6cb867ae503d7b92be21b3b37"
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
