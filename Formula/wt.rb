class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.5.3/wt-macos-arm64"
      sha256 "6012bbdb68c5f6d2c63267eb6125451e770c164fbb976ace1548bf05ea185fb7"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.5.3/wt-macos-x64"
      sha256 "7d49e4d9daa1d6b09431e6a5ac49d06f6ae7072aa8e7f88c004ebcea021e220d"
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
