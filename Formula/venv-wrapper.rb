class VenvWrapper < Formula
  desc "Simple python virtual environment management"
  homepage "https://github.com/marier-nico/venv-wrapper"
  url "https://github.com/marier-nico/venv-wrapper/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "3b2af36b6ff9ee878bbade167f2812ccbfaadac6352c0e832450ae66ba79156d"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "python"
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "venv-wrapper", "-r", testpath, "new", "test"
    system "ls", "#{testpath}/test/pyvenv.cfg"
  end
end
