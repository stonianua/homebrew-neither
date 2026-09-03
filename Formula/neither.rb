class Neither < Formula
  desc "Neither decision-memory CLI"
  homepage "https://github.com/stonianua/neither-mcp"
  url "https://registry.npmjs.org/neither/-/neither-0.1.1.tgz"
  sha256 "f57f345ae94f0b139729a5305b6fbaa7da2c6d0b84ce18afd6b6c6160ed0ecd2"
  license "MIT"

  depends_on "node@20"

  def install
    system "npm", "install", *std_npm_args
    libexec.glob("bin/*").each do |path|
      name = path.basename
      rm_f bin/name
      (bin/name).write_env_script path, PATH: "#{Formula["node@20"].opt_bin}:$PATH"
    end
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/neither --version")
  end
end
