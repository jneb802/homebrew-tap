class Mmcli < Formula
  desc "Command-line Valheim mod manager for macOS"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.9/mmcli-darwin-arm64"
      sha256 "5f8c6b1328620e6030cb5c74c715b289fda4842454f7c4169942f657eb34f5ad"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.9/mmcli-darwin-amd64"
      sha256 "2096d48ac6078159dc59d094bf7da5f62def86010ff880500b45fe4cf0ffc098"
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
