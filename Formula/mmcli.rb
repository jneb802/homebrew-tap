class Mmcli < Formula
  desc "Command-line Valheim mod manager"
  homepage "https://github.com/jneb802/mmcli"
  version "0.12.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.13/mmcli-darwin-arm64"
      sha256 "2a4655f2f1ad4e8e6aa2017928d466e85839ffb69eba18e2e860d78c66176f16"
    else
      url "https://github.com/jneb802/mmcli/releases/download/v0.12.13/mmcli-darwin-amd64"
      sha256 "b5e5afedfd69302951ebea4ee5c909bde59f2f9023174d0cd8978210a6da7ff3"
    end
  end

  on_linux do
    url "https://github.com/jneb802/mmcli/releases/download/v0.12.13/mmcli-linux-amd64"
    sha256 "93c01139f5e71ff46df33f6ff8fa61d320d2dcfdeaca1e12562be31d70d4e098"
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
