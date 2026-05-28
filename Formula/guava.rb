class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.27.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.27.0/guava-darwin-x86_64"
      sha256 "e7e53a3c62d761542136a8325c76076308c4bd7268f082708542ea53644b6c79"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.27.0/guava-darwin-aarch64"
      sha256 "54e7b5db642568c1b08c0d50f69eb3e48ba2e6921aaedd01c29507cba32cc4b6"
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
