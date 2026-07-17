class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.8.0/wt-macos-arm64"
      sha256 "5eb2a84968ad365d23e1dd33fc68a603dfaa43438b0743960d18475c526811d8"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.8.0/wt-macos-x64"
      sha256 "fef9b6f527baf5bb017eeb7d87b7294b197d658676722c378e3b1abaf15c54ad"
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
