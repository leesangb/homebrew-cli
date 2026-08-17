class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.11.3/wt-macos-arm64"
      sha256 "c9b4f0219b88d35aebd90630813a329debcd6a541906dd47bb585d41f84c16a4"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.11.3/wt-macos-x64"
      sha256 "ef59e7d3fb70869ea63be6ecb29bdae85811487e718feabbdf00dc5b6560f974"
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
