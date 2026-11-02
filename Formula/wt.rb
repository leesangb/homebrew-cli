class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.14.0/wt-macos-arm64"
      sha256 "4690782fe67343de5d28ce973e20bb7bad7352916f69244f902542af33a1e559"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.14.0/wt-macos-x64"
      sha256 "c2cb81657169dfe576ea0b61e74a3dfe06f1a2977640b9886706302d01583969"
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
