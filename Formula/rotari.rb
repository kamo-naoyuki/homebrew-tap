class Rotari < Formula
  desc "Serverless workflow engine for repeatable shell-command jobs"
  homepage "https://github.com/kamo-naoyuki/rotari"
  url "https://github.com/kamo-naoyuki/rotari/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "83e42eca02aad4f4dfca74d6531781f7f6d182dccb446bcb6d8f5de22d4d5451"
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
