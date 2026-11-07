class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.15.2/wt-macos-arm64"
      sha256 "3692cf99ae47125006223357bc5c716ad9046298575a100083c104a66b5d0209"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.15.2/wt-macos-x64"
      sha256 "53a3f361e6cd37573d4ed9e989b251470b11b3e58805dbd903f633f5214729dc"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "wt-macos-arm64" => "wt"
    else
      bin.install "wt-macos-x64" => "wt"
    end
  end

  def caveats
    <<~EOS
      Optional shell integration:
        wt shell install zsh
        wt shell install bash
        wt shell install fish

      Upgrade with Homebrew:
        brew upgrade wt

      Run the command printed by `wt shell install` to append it to your shell config.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
