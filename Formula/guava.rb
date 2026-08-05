class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.37.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.37.0/guava-darwin-x86_64"
      sha256 "ae378812e85c38268bc796059cfeee6bf74083d0d27904f8f5dc39a1193578bd"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.37.0/guava-darwin-aarch64"
      sha256 "e258dc7b0d219c2c5ca8ae49e4b9d72ec50a40fe34ca75a14e330aa567eb17d7"
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
