class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.3.1/wt-macos-arm64"
      sha256 "d6a86578ade2ff42483578b02192ca21bc501176039ea2497bddc5b7a0dc5208"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.3.1/wt-macos-x64"
      sha256 "6f6f2786210e269a26bf571e78d86b5cea279adb32392539519d6844677bf0d0"
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
