class Laplap < Formula
  desc "Cat-proof input lock for macOS — ignore keyboard, trackpad, and mouse"
  homepage "https://github.com/mr687/laplap"
  url "https://github.com/mr687/laplap/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "96a773be12afe3c46d11f3a40690095478838dcc6983a0e4f172901d82f26187"
  license "MIT"

  depends_on "swift" => :build
  depends_on macos: :ventura

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin_path = Utils.safe_popen_read(
      "swift", "build", "--configuration", "release",
      "--show-bin-path", "--disable-sandbox"
    ).strip
    bin.install File.join(bin_path, "laplap")
  end

  test do
    system bin/"laplap", "--help"
  end
end
