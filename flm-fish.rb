require 'formula'

class FlmFish < Formula
  homepage 'https://github.com/FLM/tools'
  url 'https://github.com/FLM/tools'
  sha1 '5f00c3886a5f2602e099f7322e369215ef25cdc3'
  version '0.1'

  depends_on 'fishfish'

  def install
    bin.install 'vagrant-ssh','vagrant-ssh-debug'
    etc.install 'config.fish'
    system "echo Adding 'source /usr/local/etc/config.fish' to ~/.config/fish/config if not present..."
    system "grep -q '^source /usr/local/etc/config.fish' ~/.config/fish/config; or mkdir -p ~/.config/fish && echo 'source /usr/local/etc/config.fish' | tee -a ~/.config/fish/config"
    system "echo Changing default shell to fish requires your password..."
    system "grep -q '^/usr/local/bin/fish$' /etc/shells; or echo '/usr/local/bin/fish' | sudo tee -a /etc/shells"
    system "chsh -s /usr/local/bin/fish"
  end
end
