class AlloydbAuthProxy < Formula
  desc "Utility for connecting securely to your AlloyDB instances"
  homepage "https://github.com/GoogleCloudPlatform/alloydb-auth-proxy"
  url "https://github.com/GoogleCloudPlatform/alloydb-auth-proxy/archive/refs/tags/v1.10.2.tar.gz"
  sha256 "22729e327b06a9724630c7e1e021cee091c0cd22af6c91ad423234df77804a17"
  license "Apache-2.0"
  head "https://github.com/GoogleCloudPlatform/alloydb-auth-proxy.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "alloydb-auth-proxy version #{version}", shell_output("#{bin}/alloydb-auth-proxy --version")
    assert_match "could not find default credentials", shell_output("#{bin}/alloydb-auth-proxy test 2>&1", 1)
  end
end
