class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.50.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.50.0/guava-darwin-x86_64"
      sha256 "6b3e222593a13a2982d56a7968ec8fd272d1b5d573ff4dee5ab529df757c659e"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.50.0/guava-darwin-aarch64"
      sha256 "8a79907fc39d286037e76819b6781be5a40a888c11f5e1527eff4f2247e15ab8"
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
