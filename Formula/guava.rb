class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.34.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.34.0/guava-darwin-x86_64"
      sha256 "a01220925a676e19a2dd23ef6fc2c5affee9ada1b315dbe341ee2ded6cfb33ea"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.34.0/guava-darwin-aarch64"
      sha256 "0a66b7a9aa30d2fff5c6e8d3c75df5f631391c5284251a8cc11dd6bb741658a2"
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
