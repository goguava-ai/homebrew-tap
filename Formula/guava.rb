class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.43.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.43.0/guava-darwin-x86_64"
      sha256 "cc43c863f53837143e49e63d5e0bd4ac380d8482e0e302d0b3251eda619cca6f"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.43.0/guava-darwin-aarch64"
      sha256 "982fb976995ab90edcbe67f4c5cf690b491f8c71884523cb84e92fb06cf7817a"
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
