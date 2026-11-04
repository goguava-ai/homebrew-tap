class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.51.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.51.0/guava-darwin-x86_64"
      sha256 "f0bd1ec800e4f825ee13008d6579b78616f97ecb08dbf0e246885631f2817a96"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.51.0/guava-darwin-aarch64"
      sha256 "5ada200d3574955194dbb4532283be5e3aea37a6a292708042ef7524e11e3ef7"
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
