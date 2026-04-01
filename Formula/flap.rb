class Flap < Formula
  VERSION = "v0.5.2"

  desc "CLI for Go inside Flutter"
  homepage "https://github.com/nosuta/flap"
  url "https://github.com/nosuta/flap/archive/refs/tags/#{VERSION}.tar.gz"
  sha256 "63d57476d37d3c56a881e5dccb1355062c73299555d620b0997cd43b6cedbc5a"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "go", *std_go_args(ldflags: "-X main.Version=#{VERSION} -s -w"), "./cmd/flap"
  end

  test do
    assert_match "flap", shell_output("#{bin}/flap --version")
  end
end