class Guava < Formula
  desc "Command-line interface for managing Guava agents and deployments"
  homepage "https://goguava.ai"
  version "0.23.0"

  on_macos do
    on_intel do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.23.0/guava-darwin-x86_64"
      sha256 "d7e3deedcdf60a1e915b47f54ed8b6dfbd751b68e3db4cc419089a7c4f864e51"
    end
    on_arm do
      url "https://storage.googleapis.com/gridspace-guava-cli/cli/0.23.0/guava-darwin-aarch64"
      sha256 "c093d252689a4fd8ad16cc42f29fc14b769048bb5aa53ee3764b2b46adc5ff6f"
    end
  end

  def install
    binary_name = Hardware::CPU.arm? ? "guava-darwin-aarch64" : "guava-darwin-x86_64"
    bin.install binary_name => "guava"
  end

  test do
    system bin/"guava", "--version"
  end
end
