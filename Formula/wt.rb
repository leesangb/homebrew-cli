class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.11.0/wt-macos-arm64"
      sha256 "39ceb86b5b71d521cb964b14cd23f1155741b33fdcd15d156e9c6e165b448c9b"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.11.0/wt-macos-x64"
      sha256 "fb0e7dcb76c5b2eaed41e52f03d0c6b5b1d16df73583272b96bb79f779cc23d4"
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
