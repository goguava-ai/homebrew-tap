class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.30.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.30.0/guava-darwin-x86_64"
      sha256 "f26d4afacc814fa26b3660482a05387cd3a2bcbc51a3d9b41f76234cce907211"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.30.0/guava-darwin-aarch64"
      sha256 "a7cd1d2328fb2b988d7a3085500cc36000b10c28ccf22a6fa50e0c5bedc9381a"
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
