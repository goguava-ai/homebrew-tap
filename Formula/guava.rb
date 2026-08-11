class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.38.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.38.0/guava-darwin-x86_64"
      sha256 "2128c465f31ebdc49ca980e7c43c0a4cd1732f1b5d18a22b02336a4d1ca8935a"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.38.0/guava-darwin-aarch64"
      sha256 "c7a8d1274bb389dec115a12373f119cd52c5da61e371a56f0923a75500385ab7"
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
