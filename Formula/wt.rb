class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.11.2/wt-macos-arm64"
      sha256 "3bbeba9e5c235d41dce40a5c296dae19d549dcbcb4390b0b4f9ed21c157c022a"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.11.2/wt-macos-x64"
      sha256 "eb80b1a0969304ed22b4bfd909d0ee120c2f59b8a856214ca94b52ecf617369e"
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
