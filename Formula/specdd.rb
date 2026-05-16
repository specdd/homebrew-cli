class Specdd < Formula
  desc "CLI tool for working with SpecDD workflows"
  homepage "https://specdd.ai"
  url "https://registry.npmjs.org/specdd/-/specdd-1.0.0.tgz"
  sha256 "36d8da95f152286635e22bf20a3c786d45b381dd2132e8e3e8b0ada17c63c361"
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
