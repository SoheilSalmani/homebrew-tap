# Placeholder until the first tagged release of SoheilSalmani/weft: the
# release workflow there overwrites this file with a formula that installs
# prebuilt binaries (see scripts/homebrew-formula.sh in that repo).
class Weft < Formula
  desc "Record-based project scaffolding"
  homepage "https://github.com/SoheilSalmani/weft"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/SoheilSalmani/weft.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/weft-cli")
  end

  test do
    assert_match "weft ", shell_output("#{bin}/weft --version")
  end
end
