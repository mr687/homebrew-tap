class Laplap < Formula
  desc "Cat-proof input lock for macOS — ignore keyboard, trackpad, and mouse"
  homepage "https://github.com/mr687/laplap"
  url "https://github.com/mr687/laplap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7ebdcd3c3c953b438d50b3c961791ee7e3eb98c432ef6046356d761b132b131d"
  license "MIT"

  depends_on :macos => :ventura
  depends_on "swift" => :build

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    bin_path = Utils.safe_popen_read("swift", "build", "--configuration", "release", "--show-bin-path", "--disable-sandbox").strip
    bin.install File.join(bin_path, "laplap")
  end

  test do
    system "#{bin}/laplap", "--help"
  end
end
