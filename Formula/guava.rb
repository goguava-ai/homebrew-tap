class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.29.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.29.0/guava-darwin-x86_64"
      sha256 "0610aab7d1c4ae8ecaf348ca3a7f8ebc45048c7754e907ad6ea8074c1265f537"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.29.0/guava-darwin-aarch64"
      sha256 "bb0f011cf45f86cd57841f8fd1d2d49e6c8ee575dd41b55d99d5af71ee281ebb"
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
