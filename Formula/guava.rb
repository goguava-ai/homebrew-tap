class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.47.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.47.0/guava-darwin-x86_64"
      sha256 "6cc3e4d08c8774bb36f6fb42c080ced4913e7b5a52dc9103afa86c1b39cf3a8a"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.47.0/guava-darwin-aarch64"
      sha256 "d6479b614cde049e19d6e3a914e5c647af0dee169d586eea7daa5517c54f5c9b"
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
