class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.15/mmcli-darwin-arm64"
      sha256 "42065b9c27a9a8768eeff583b3a13ec2e049c1aacf056a3ba09630e671c67377"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.15/mmcli-darwin-amd64"
      sha256 "6a45bf342d27879fc3524ebbb8f2e49df0b8b57dac2286b3d5b7b5fb67c8fb43"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.15/mmcli-linux-amd64"
    sha256 "17ad4071bc5fc49e6b3ada43fc6ebed912c4c84764112b3e19874989595cf811"
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
