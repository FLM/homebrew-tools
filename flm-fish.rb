require 'formula'

class FlmFish < Formula
  homepage 'https://github.com/FLM/tools'
  url 'https://github.com/FLM/tools', :using => :git
  version '0.4'

  depends_on 'fishfish'

  def install
    bin.install 'vagrant-ssh','vagrant-ssh-debug'
    etc.install 'config.fish'
    system "echo Adding 'source /usr/local/etc/config.fish' to ~/.config/fish/fish.config if not present..."
    system "mkdir -p ~/.config/fish && touch ~/.config/fish/config.fish && if [ \"$(grep -q '^source /usr/local/etc/config.fish' ~/.config/fish/config.fish)\" == \"\" ]; then echo 'source /usr/local/etc/config.fish' | tee -a ~/.config/fish/config.fish; fi"
    system "echo Changing default shell to fish requires your password..."
    system "if [ \"$(grep -q '^/usr/local/bin/fish$' /etc/shells)\" == \"\" ]; then echo '/usr/local/bin/fish' | sudo tee -a /etc/shells; fi"
    system "chsh -s /usr/local/bin/fish"
  end
end
