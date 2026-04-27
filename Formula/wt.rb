class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.6.0/wt-macos-arm64"
      sha256 "b307da6bea303d5430c53ffcf6f6e0603f1895fa39acbb68fe19f290e5492582"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.6.0/wt-macos-x64"
      sha256 "9e9e9032eea4b07e2507857594e43be6cf2e1eedb181178fdee13a721dec0590"
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
