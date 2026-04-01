class Flap < Formula
  VERSION = "v0.5.2"

  desc "CLI for Go inside Flutter"
  homepage "https://github.com/nosuta/flap"
  url "https://github.com/nosuta/flap/archive/refs/tags/#{VERSION}.tar.gz"
  sha256 "6fd8f2a1fc4a7e1c9c97408f9218486f3f5ce8dda497575ce78711902194183f"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", "-C", "go", *std_go_args(ldflags: "-X main.Version=#{VERSION} -s -w"), "./cmd/flap"
  end

  test do
    assert_match "flap", shell_output("#{bin}/flap --version")
  end
end
