class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.48.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.48.0/guava-darwin-x86_64"
      sha256 "f112a0d5912f11b96c71c151e8ec52d49c9c2c953a08911254f19de3e521d716"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.48.0/guava-darwin-aarch64"
      sha256 "49d297512c2dbdf567b64bf72871c5789f9303e3fb352d55a28cb149906a6a5d"
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
