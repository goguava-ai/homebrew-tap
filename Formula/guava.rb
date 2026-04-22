class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.22.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.22.0/guava-darwin-x86_64"
      sha256 "5f1bad65ace13a5da008da4df5f43205ebc5d4101890f62a22cc23f62f4cc6da"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.22.0/guava-darwin-aarch64"
      sha256 "cd8eab9834014033cb1116f24fd8a15d9be3cf5196f014bb5f039fe8ec9097f1"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "guava-darwin-aarch64" : "guava-darwin-x86_64"
    bin.install binary_name => "guava"
  end

  test do
    system bin/"guava", "--version"
  end
end
