class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.13.0/wt-macos-arm64"
      sha256 "4cc25596acc94a30bf3027c70ca20d69405f3f4f6fad9b22f04df31d97bbb3f6"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.13.0/wt-macos-x64"
      sha256 "92f119d4737fdce8bcc58ea0ee5805d7f6a45b67b16822d807d779d6d77176b3"
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
