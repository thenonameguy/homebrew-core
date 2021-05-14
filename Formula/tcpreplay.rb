class Tcpreplay < Formula
  desc "Replay saved tcpdump files at arbitrary speeds"
  homepage "https://tcpreplay.appneta.com/"
  url "https://github.com/appneta/tcpreplay/releases/download/v4.3.4/tcpreplay-4.3.4.tar.gz"
  sha256 "ee065310806c22e2fd36f014e1ebb331b98a7ec4db958e91c3d9cbda0640d92c"
  license all_of: ["BSD-2-Clause", "BSD-3-Clause", "BSD-4-Clause", "GPL-3.0-or-later", "ISC"]

  bottle do
    sha256 cellar: :any, big_sur:     "772815bcf05a81fb36acf09acb31bc2eb467cf3b90815461e94fc7babd584d2d"
    sha256 cellar: :any, catalina:    "a4b41c27929bfd52016d1cc576089a9cb42dfd0e595c3078a40b26bd39fbd65f"
    sha256 cellar: :any, mojave:      "0ec1b2260c108d103d4d594a8fff9482656833e5308690b90c5ef0a05a155546"
    sha256 cellar: :any, high_sierra: "439ed368cf28fb710cefec00f88de8d32e0d039abed0f8761f1a1ae4731dac53"
  end

  depends_on "libdnet"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-dynamic-link"
    system "make", "install"
  end

  test do
    system bin/"tcpreplay", "--version"
  end
end
