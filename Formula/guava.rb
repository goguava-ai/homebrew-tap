class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.35.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.35.0/guava-darwin-x86_64"
      sha256 "5d4d5cfd4b4dd900903af2628f357816d9c179005a59102cf4dce0ba8bba28f2"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.35.0/guava-darwin-aarch64"
      sha256 "3516fc679bbe471df86f71fcecc68a9b2865734a93f41d56a9712d73750b8bdd"
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
