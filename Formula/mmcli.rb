class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.7/mmcli-darwin-arm64"
      sha256 "416dd2a9b591f2de928570b4b778b0682038da073dec56d9b9b36c6b6e1c41bc"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.7/mmcli-darwin-amd64"
      sha256 "ff0c098cc2d55f21c810fe1d638be569a84aefec3d44e4267c12cf252ea13818"
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
