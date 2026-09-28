class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/kamo-naoyuki/rotari"
  url "https://github.com/kamo-naoyuki/rotari/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "699757f47f0f04f6cfd95fcd2ed75f73f335c47646bac85e667815e3d2a8eb8a"
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
