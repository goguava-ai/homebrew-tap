class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.45.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.45.0/guava-darwin-x86_64"
      sha256 "d95dd93173f105663846739b249b7efdb233054fcbeca1b1ebf02bcd6a6d6530"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.45.0/guava-darwin-aarch64"
      sha256 "9356629a051010ae24d74719dd0ae80d26de5b1750fe842c245f9748b1049f17"
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
