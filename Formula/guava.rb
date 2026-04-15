class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.21.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.21.0/guava-darwin-x86_64"
      sha256 "088936a2506d6fa49e16587efa4d9aeb0d8e6ea33a8800cfc7b7754dbe097338"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.21.0/guava-darwin-aarch64"
      sha256 "4d5b2913650ef8eee9d7d6f2116a09742f0d9f430b9cf8ac8bd5cbbcbf00ad03"
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
