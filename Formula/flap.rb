class Flap < Formula
  VERSION = "v0.5.5"

  desc "CLI for Go inside Flutter"
  homepage "https://github.com/nosuta/flap"
  url "https://github.com/nosuta/flap/archive/refs/tags/#{VERSION}.tar.gz"
  sha256 "683412bb38085ecfbc5f5e6bd0271a68de9eecdfc920a7ec6112624d69c54b02"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "go", *std_go_args(ldflags: "-X main.Version=#{VERSION} -s -w"), "./cmd/flap"
  end

  test do
    assert_match "flap", shell_output("#{bin}/flap --version")
  end
end
