class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.40.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.40.0/guava-darwin-x86_64"
      sha256 "cc86e129675fdebeb8e9f79c84d23ac46761fb69d90a1214a2ee9b64fba3af00"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.40.0/guava-darwin-aarch64"
      sha256 "a0a626b9c1d97296ace1fd5b334ac67acad9de29bdc95166f71e4d39a15a20ae"
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
