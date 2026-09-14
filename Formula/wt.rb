class Wt < Formula
  desc "Git worktree manager CLI"
  homepage "https://github.com/leesangb/wt"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/leesangb/wt/releases/download/v0.12.0/wt-macos-arm64"
      sha256 "660aac1752b441732944e87e0b7417b8886ab7a5493fcde5cc193264080e67ff"
    end

    on_intel do
      url "https://github.com/leesangb/wt/releases/download/v0.12.0/wt-macos-x64"
      sha256 "5242b789f54aca5fbfcabb9b378136a2151ef0186a4aef2cb64cb0ae23f59aac"
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
