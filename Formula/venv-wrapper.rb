class VenvWrapper < Formula
  desc "Simple python virtual environment management"
  homepage "https://github.com/marier-nico/venv-wrapper"
  url "https://github.com/marier-nico/venv-wrapper/archive/refs/tags/v2.0.2.tar.gz"
  sha256 "d311792a85b40cd30c25c5150cf1e929b6c71cc4be6c16ab8e7fd1c51d55de01"
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
