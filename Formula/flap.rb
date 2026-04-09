class Flap < Formula
  VERSION = "v1.0.2"

  desc "CLI for Go inside Flutter"
  homepage "https://github.com/nosuta/flap"
  url "https://github.com/nosuta/flap/archive/refs/tags/#{VERSION}.tar.gz"
  sha256 "e0b8fdab2be196ed7057ed9eed1f1b587db09ee071fd93895b0c8fadd2ecf260"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "go", *std_go_args(ldflags: "-X main.Version=#{VERSION} -s -w"), "./cmd/flap"
  end

  test do
    assert_match "flap", shell_output("#{bin}/flap --version")
  end
end
