class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.53.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.53.0/guava-darwin-x86_64"
      sha256 "be4b68a0363a24a0a0e3c38c59068df112ba7ec3a721e642b43ddc76eb004c9f"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.53.0/guava-darwin-aarch64"
      sha256 "abc961c272fe5c8f90fdab585286332e95010c04ba0d0ccf52a347324a4ab9fe"
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
