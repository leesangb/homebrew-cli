class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.5.0/wt-macos-arm64"
      sha256 "e5c627da8595eef4f74668160a2158b28a915ea6d6a0ee7d4763194ddfaf294c"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.5.0/wt-macos-x64"
      sha256 "86a160a97e5bd97b33fb7c296c11f1b393e2856bc153303d56cf8f669b27991e"
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
