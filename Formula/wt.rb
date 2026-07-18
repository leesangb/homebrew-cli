class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.9.0/wt-macos-arm64"
      sha256 "c61cced2824f080c8413d198a8087da8f5aaed8b6fadf28ee3efcdf2df64bdeb"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.9.0/wt-macos-x64"
      sha256 "c209791ae15e19037a59b861f967196634a22603f5cf7663bce001ce2db6770a"
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
