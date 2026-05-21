class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.26.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.26.0/guava-darwin-x86_64"
      sha256 "217c8cf18624b17bee5a13db3d8c212e8d6d74fcd238fb35d167831728101051"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.26.0/guava-darwin-aarch64"
      sha256 "0b6e207a54fd5338c62d1ffc6e4a01a6f82f95c38d372f56e4c9cb4bc0ca5217"
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
