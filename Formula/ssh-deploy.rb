class SshDeploy < Formula
  desc "Push a local script to an SSH host and run it there as root"
  homepage "https://github.com/BrainInBlack/ssh-deploy"
  url "https://github.com/BrainInBlack/ssh-deploy/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cd714b7aa27365b73f3b97070ba70e9e63b54956158abf3f48391c0a0f689198"
  license "MIT"
  head "https://github.com/BrainInBlack/ssh-deploy.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "ssh-deploy"
  end

  def caveats
    <<~EOS
      The fuzzy host picker uses fzf. For the richer picker:
        brew install fzf
      Without it, ssh-deploy falls back to a numbered menu.
    EOS
  end

  test do
    assert_match "ssh-deploy #{version}", shell_output("#{bin}/ssh-deploy --version")
  end
end
