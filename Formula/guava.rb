class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.36.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.36.0/guava-darwin-x86_64"
      sha256 "c5042d35e6a8624b2f6f2213b498a9bbae0b91b6795de7509b3e8dde406e7a5b"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.36.0/guava-darwin-aarch64"
      sha256 "8ea5c5d67cce1443a925413c3590e0bdef160f6e5a622c7f0f9b371f723ff2fb"
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
