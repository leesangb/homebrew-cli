class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.3.0/wt-macos-arm64"
      sha256 "113359b3cd5fbb21eee2da034a5bed7aad2640b13efde76ed774e14a8049baa1"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.3.0/wt-macos-x64"
      sha256 "f882443faff3d2861ac4d69cb14e02b9a9be9ca5cff91c169a08422b73d1dd6b"
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
