class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.10.0/wt-macos-arm64"
      sha256 "1e4f88bba9697a98e0b64eba60261e111c3e571a97179e4e29809665a91af1aa"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.10.0/wt-macos-x64"
      sha256 "84b328954c5ac8b9335986c081f8ccafbd3e27c9f635cddc8775d13a768d289c"
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
