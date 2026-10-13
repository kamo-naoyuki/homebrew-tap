class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/kamo-naoyuki/rotari"
  url "https://github.com/kamo-naoyuki/rotari/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "d32f950d40fe83d3b291c7575333f068f29cfe4e22959c5baddc9c79be23ff9f"
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
