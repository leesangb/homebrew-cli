class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.5.2/wt-macos-arm64"
      sha256 "8dee82e51c75d57e49baf6092b09e12fd0dc398b612f7d0a35ea79acc25efed3"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.5.2/wt-macos-x64"
      sha256 "8d50563ebee38ad369eb7e2e75449c0a724652494300c8fcfe4f1b09d6668ac7"
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
