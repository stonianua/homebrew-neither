class Neither < Formula
  desc "Neither decision-memory CLI"
  homepage "https://github.com/stonianua/neither-mcp"
  url "https://registry.npmjs.org/neither/-/neither-0.1.2.tgz"
  sha256 "c38eb50ac2c8e8b68a8cd6ff22a4fde96b4becec270d91d90aae09a32a0e6a51"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    libexec.glob("bin/*").each do |path|
      name = path.basename
      rm_f bin/name
      (bin/name).write_env_script path, PATH: "#{Formula["node"].opt_bin}:$PATH"
    end
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/neither --version")
  end
end
