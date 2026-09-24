class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/kamo-naoyuki/rotari"
  url "https://github.com/kamo-naoyuki/rotari/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "f4144bb20f9e3c427da19e01d7c9e9b8234b64f2b625a23bcfd626739c4f21e0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath",
           "-ldflags", "-s -w -X main.version=#{version}",
           "-o", bin/"rotari", "./cmd/rotari"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rotari version")
  end
end
