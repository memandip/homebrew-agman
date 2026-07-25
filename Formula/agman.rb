class Agman < Formula
  desc "Agent manager: switchable config profiles for AI coding agents"
  homepage "https://github.com/memandip/agman"
  url "https://github.com/memandip/agman/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c7ed4de936f8016d3d8ceb92347b05cc5778980e66e508ddb641f9e7b44d901c"
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
    assert_predicate testpath/"profiles/example/CLAUDE.md", :exist?
    assert_match "example", shell_output("#{bin}/agman list")
  end
end
