class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.18/mmcli-darwin-arm64"
      sha256 "b403fc5a82940055882ce1b3c8f5b37e8fca69f873770b262e9bf5fafa900bf2"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.18/mmcli-darwin-amd64"
      sha256 "15a3b7fc4b8158723eabbee25dfeea77ba025802243072afe24914417fb3e82e"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.18/mmcli-linux-amd64"
    sha256 "cd2113eb12baefab053c936346a45a74607a99adde3148782c86e5791adcfa01"
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
