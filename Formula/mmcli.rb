class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.4/mmcli-darwin-arm64"
      sha256 "6e33ced9342a3ec5d968cfc5667d9c2ce32ec0994695509ee64683519bef376d"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.1.4/mmcli-darwin-amd64"
      sha256 "9526903fb2d58028f1bf61e48da7184c19d8ae57da66bb9650325f499a1be97b"
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
