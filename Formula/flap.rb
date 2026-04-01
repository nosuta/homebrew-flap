class Flap < Formula
  VERSION = "v0.5.2"

  desc "CLI for Go inside Flutter"
  homepage "https://github.com/nosuta/flap"
  url "https://github.com/nosuta/flap/archive/refs/tags/#{VERSION}.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "go", *std_go_args(ldflags: "-X main.Version=#{VERSION} -s -w"), "./cmd/flap"
  end

  test do
    assert_match "flap", shell_output("#{bin}/flap --version")
  end
end
