class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/kamo-naoyuki/rotari"
  url "https://github.com/kamo-naoyuki/rotari/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "487ce38171acd805c72c1c078fc3cf0d7dbd3fe35665644709c55ab226d65212"
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
