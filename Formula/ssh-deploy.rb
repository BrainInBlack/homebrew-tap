class SshDeploy < Formula
  desc "Push a local script to an SSH host and run it there as root"
  homepage "https://github.com/BrainInBlack/ssh-deploy"
  url "https://github.com/BrainInBlack/ssh-deploy/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "09a634d866694cf304c200ee2d1c913ffa37d9f1f9b2da0b5bf4fdf0ab08b185"
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
