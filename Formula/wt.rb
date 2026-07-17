class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.8.1/wt-macos-arm64"
      sha256 "8f01833cf51737ccca9c9b944c74ac74a04e2221dbb6d2559d7d886490c53d8a"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.8.1/wt-macos-x64"
      sha256 "705ebd7921fd23111c97cfd8aa586ac7ce58890ae13bee93a7a9608c1081783a"
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
