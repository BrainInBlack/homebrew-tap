class SshDeploy < Formula
  desc "Push a local script to an SSH host and run it there as root"
  homepage "https://github.com/BrainInBlack/ssh-deploy"
  url "https://github.com/BrainInBlack/ssh-deploy/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "024c8995094e39787e98d2da7e6e6a31136b0d9ea443dbcbb88e51599d7c6755"
  license "MIT"
  head "https://github.com/BrainInBlack/ssh-deploy.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "ssh-deploy"
    man1.install "ssh-deploy.1"
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
    assert_path_exists man1/"ssh-deploy.1"
  end
end
