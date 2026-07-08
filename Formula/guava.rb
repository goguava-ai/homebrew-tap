class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.33.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.33.0/guava-darwin-x86_64"
      sha256 "b221c3d8f33badd0f779f03ee7b8636f2da6dcb06b63bec10dcdc427605c61e8"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.33.0/guava-darwin-aarch64"
      sha256 "b659521162b1185ded35f705b95dcefddba68facd3855bb50b342430d06a76b8"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "guava-darwin-aarch64" : "guava-darwin-x86_64"
    bin.install binary_name => "guava"
    (bin / "guava.install.json").write <<~JSON
      {
        "distribution": "homebrew",
        "self_update": false
      }
    JSON
  end

  test do
    system bin/"guava", "--version"
  end
end
