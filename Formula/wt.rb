class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.7.0/wt-macos-arm64"
      sha256 "92ac6259ece85ba309ca554c5091ec533b3746b65f6f0f199639f1d66e18f1ba"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.7.0/wt-macos-x64"
      sha256 "4cc7ac0315eef3ed113dee79bb152d0caa6dc3a38fa343764c90642c6fc1e746"
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
