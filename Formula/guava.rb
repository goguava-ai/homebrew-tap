class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.44.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.44.0/guava-darwin-x86_64"
      sha256 "51ec775296176315b0f5b59b086f5b0f2aa2abac15c5889e8c3f44b72339f59c"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.44.0/guava-darwin-aarch64"
      sha256 "5eb43af06c6c0acb17251dd0ac6b44bbd24d1207847e17b7f1f023ef499ebe15"
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
