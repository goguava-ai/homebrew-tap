class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.31.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.31.0/guava-darwin-x86_64"
      sha256 "ad43e5445d270386102e2081b2d41a7a504359fac74a40cb5723295721d4e026"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.31.0/guava-darwin-aarch64"
      sha256 "0c62efb811f5cad271d6b8311a866fc8dae5dd925cd79c7dae428054b8233935"
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
