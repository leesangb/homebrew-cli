class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.8.3/wt-macos-arm64"
      sha256 "0a696e19c12caaf31ceb68fc4b3cc5d22d4e1694fc7be0555a3f2857adbeb48a"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.8.3/wt-macos-x64"
      sha256 "0e5e6e19cd56375819aafd4d7c6ae10b9f207c16f215589f09c1c0d82008121e"
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
