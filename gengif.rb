class Gengif < Formula
  desc "A lightweight CLI to generate animated GIFs"
  homepage "https://github.com/MajdHallak/gengif"
  url "https://github.com/MajdHallak/gengif/archive/refs/tags/v1.0.tar.gz"
  sha256 "f58e2de001988ee00ba7fc8d19b021c10c9b2407cecba616aaff9069ef62171b"
  license "MIT"

  # Ensure Python is installed on the target machine
  depends_on "python@3.12"

  def install
    # Create an isolated virtual environment in Homebrew's libexec directory
    system "python3", "-m", "venv", libexec
    
    # Install our package and its Pillow dependency into that environment
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:", "--ignore-installed", buildpath
    
    # Create a symlink in Homebrew's bin folder so the command is globally available
    bin.install_symlink libexec/"bin/gengif"
  end
end
