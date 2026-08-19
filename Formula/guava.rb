class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.39.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.39.0/guava-darwin-x86_64"
      sha256 "667fc7adc44123da5e97cd14ee892b4b93101541d24bc9a226a1cf970bb97ab8"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.39.0/guava-darwin-aarch64"
      sha256 "0f507cffb1f58f3da1e070274b722aaa97ee867f9ac65c94552cf083f6cbc573"
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
