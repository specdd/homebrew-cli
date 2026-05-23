class Specdd < Formula
  desc "CLI tool for working with SpecDD workflows"
  homepage "https://specdd.ai"
  url "https://registry.npmjs.org/specdd/-/specdd-1.0.1.tgz"
  sha256 "1f456217ebb25253fa804d64a3f7be23bbecb7089ef82d0c4c201ab9b6d67be6"
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
