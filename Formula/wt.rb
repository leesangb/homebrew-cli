class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.15.1/wt-macos-arm64"
      sha256 "41efa0b89a2acad5cbae926f9e2e02bf121dca398c50426d104c5e8ac0ea9cd9"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.15.1/wt-macos-x64"
      sha256 "a9d4185f21961f2b27c9e7208df57384f674304019d2cc088ccea17f429dff1b"
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
