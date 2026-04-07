class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.2/mmcli-darwin-arm64"
      sha256 "48b8169fb65ec0ebcebbdff437e2d06ac7c845d96691f677212a9dba201613fe"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.2/mmcli-darwin-amd64"
      sha256 "5fcf9139a1b42d808b56c049742a06c48a5590ded908bb7c3f904a512f5bc19c"
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
