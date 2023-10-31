require "language/node"

class Marked < Formula
  desc "Markdown parser and compiler built for speed"
  homepage "https://marked.js.org/"
  url "https://registry.npmjs.org/marked/-/marked-9.1.4.tgz"
  sha256 "351a09bff6eb18c37446c0231f21e6eed2134dca03217cab0d06e5d48b900516"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "35b471d3017e48ba97a44734d25861967ebb6e0bc22e603cbb36b22b907c27c3"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "<p>hello <em>world</em></p>", pipe_output("#{bin}/marked", "hello *world*").strip
  end
end
