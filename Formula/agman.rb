class Agman < Formula
  desc "Agent manager: switchable config profiles for AI coding agents"
  homepage "https://github.com/memandip/agman"
  url "https://github.com/memandip/agman/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "7b0907729c3b0aa73244544888fc7ff0118eaf2d2e671ab00d8975244775fcab"
  license "MIT"
  head "https://github.com/memandip/agman.git", branch: "main"

  def install
    bin.install "bin/agman"
    doc.install "README.md", "docs"
  end

  test do
    assert_match "agman", shell_output("#{bin}/agman version")

    # A fresh install must manage nothing: with no profiles, 'current' reports
    # none and the real ~/.claude is left alone.
    ENV["AGMAN_HOME"] = testpath/"profiles"
    ENV["AGMAN_CLAUDE_HOME"] = testpath/"claude"
    assert_match "none", shell_output("#{bin}/agman current")

    system bin/"agman", "create", "example"
    assert_path_exists testpath/"profiles/example/claude/CLAUDE.md"
    assert_match "example", shell_output("#{bin}/agman list")
  end
end
