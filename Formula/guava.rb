class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.25.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.25.0/guava-darwin-x86_64"
      sha256 "e35dd5a881e9f6e14c5dd12b1c1871deda83a135d19438f865f73a4abc04170a"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.25.0/guava-darwin-aarch64"
      sha256 "a3ee2f56bf97cd00dbac55b5362c8e11b4f9b58ed3006db027fa9fc154207480"
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
