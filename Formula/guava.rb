class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.49.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.49.0/guava-darwin-x86_64"
      sha256 "9849c6970c63a5fc86b3d1d671bc12a1c102cbe5bd8e91d501597c7829b6ab37"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.49.0/guava-darwin-aarch64"
      sha256 "93e97ea00af0429426d9598bedd8d6a3e4c18c8304f1f10a88602c1f274e1bbb"
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
