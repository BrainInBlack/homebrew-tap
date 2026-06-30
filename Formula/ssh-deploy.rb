class SshDeploy < Formula
  desc "Push a local script to an SSH host and run it there as root"
  homepage "https://github.com/BrainInBlack/ssh-deploy"
  url "https://github.com/BrainInBlack/ssh-deploy/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "c0d21691cf147e548e305c79eae1a75967c078dd352f78862628efeec2eed06b"
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
