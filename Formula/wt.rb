class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.4.0/wt-macos-arm64"
      sha256 "892cf851a45e9680f9f501eeff6db078ec7d50ddfccb93144e7122d48cd46c2a"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.4.0/wt-macos-x64"
      sha256 "eced0e511bcc046d713b7716b11106579ea978ed492bd7189c9b594422350a97"
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
