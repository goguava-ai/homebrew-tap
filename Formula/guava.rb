class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.42.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.42.0/guava-darwin-x86_64"
      sha256 "527b1979c8a83b1ff835f90a51277782e92404e638482a43f92ab8e09aa7dbf3"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.42.0/guava-darwin-aarch64"
      sha256 "478c05bc55d37ec46b6bdaf3ea7ecc69ebe9677691740b82ee8089f2a4b7f89d"
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
