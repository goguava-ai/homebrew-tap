class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.52.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.52.0/guava-darwin-x86_64"
      sha256 "02ab8a847fb38b8f101829ce826b82bb3f53832845d6b43dc9e20796d36107cb"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.52.0/guava-darwin-aarch64"
      sha256 "cc5b93de085a07d85a8e6a010ab942a7b6ee38026ab66b54572255f63034de8e"
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
