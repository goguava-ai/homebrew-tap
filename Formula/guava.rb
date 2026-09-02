class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.41.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.41.0/guava-darwin-x86_64"
      sha256 "129d7db37711ddcc8a4db34cbfdb68b10510a8b3d14529f592fcf777a7e79824"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.41.0/guava-darwin-aarch64"
      sha256 "b11b0be48ccc0b2f511fa1e2fa80decbccf324c674a7a5355c3f33b90e8dad84"
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
