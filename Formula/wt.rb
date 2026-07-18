class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.11.1/wt-macos-arm64"
      sha256 "40aa5c3c20e1f449e7c15e0a2812b4b3ee5b05ceb859f7f8419602f2fec0d4d2"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.11.1/wt-macos-x64"
      sha256 "82ec995e84e4a306b21c1c4a12d34eb99139767343a5eb779f2e907cee8a7b6f"
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
