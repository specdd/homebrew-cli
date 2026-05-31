class Specdd < Formula
  desc "CLI tool for working with SpecDD workflows"
  homepage "https://specdd.ai"
  url "https://registry.npmjs.org/specdd/-/specdd-1.1.1.tgz"
  sha256 "c1b93e304f1d63588e2ce2389bcf5f5ea8070dca0ba5c53093f01eaedeebcb30"
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
