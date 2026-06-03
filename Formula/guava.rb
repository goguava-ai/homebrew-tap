class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.28.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.28.0/guava-darwin-x86_64"
      sha256 "e6232e4a3d66458dd1c65f664985c6e87b767140317335bd9ee067e81900c4cd"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.28.0/guava-darwin-aarch64"
      sha256 "5f43c4911785cd2103806bd2b6ebd64da3af425522b24b3589ac0737c42a414a"
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
