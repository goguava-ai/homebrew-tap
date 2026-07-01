class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.32.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.32.0/guava-darwin-x86_64"
      sha256 "f7ee4691121504ac9d46bcb56d3f8294b14a3f304fb9208136a596ac8fb5aae6"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.32.0/guava-darwin-aarch64"
      sha256 "a13660152b29eb96a2ab0ccefa39096a28b4ae38cab3898333d38ffa06fea85b"
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
