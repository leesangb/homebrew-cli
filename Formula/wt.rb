class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.11.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.11.4/wt-macos-arm64"
      sha256 "358573816959f7eb9c55a4a2689e1e49705da7c9c4680d655b8babdb2bcd3606"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.11.4/wt-macos-x64"
      sha256 "81b7f501c0ead269d3bee33ba9e3c8ea4b91464e5477d8672e06d4dde1ea6e0c"
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
