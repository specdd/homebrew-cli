class Specdd < Formula
  desc "CLI tool for working with SpecDD workflows"
  homepage "https://specdd.ai"
  url "https://registry.npmjs.org/specdd/-/specdd-1.1.0.tgz"
  sha256 "e49eb54b4d6e4cdbde6ad5e7a960c99acdae2e6fa12021621700f3b5c64370a9"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :npm
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args

    env = {
      PATH: "#{Formula["node"].opt_bin}:$PATH",
    }
    (bin/"specdd").write_env_script libexec/"bin/specdd", env
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/specdd --help")
  end
end
