class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.5.1/wt-macos-arm64"
      sha256 "c1225c15b5812b84e638f190e6e4d1d317e81e2d73243df57143395852348df9"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.5.1/wt-macos-x64"
      sha256 "ae0e19c7efe7b90efa277a24ad4df6155aa6578d015fa21c6d76c1709fb7fa1d"
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
