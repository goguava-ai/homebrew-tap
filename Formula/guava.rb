class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.46.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.46.0/guava-darwin-x86_64"
      sha256 "e7c7fefada6cda6b18dd5d4bf0d0938f902c23b911f3ead765362b62db194a20"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.46.0/guava-darwin-aarch64"
      sha256 "601b3c66c62c6b7989c75f7bda61e344874b1b08fe4a36b0c60e8d03bac8ea9b"
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

  def caveats
    <<~EOS
      #{Tty.green}Next steps:#{Tty.reset}
        • Run #{Tty.green}guava login#{Tty.reset} to get started.
    EOS
  end

  test do
    system bin/"guava", "--version"
  end
end
