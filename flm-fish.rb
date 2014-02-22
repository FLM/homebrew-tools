require 'formula'

class FlmFish < Formula
  homepage 'https://github.com/FLM/tools'
  url 'https://github.com/FLM/tools', :using => :git
  sha1 'c882ba107e6b0886dd4d8ccd51274eda2680b5be'
  version '0.1'

  depends_on 'fishfish'

  def install
    bin.install 'vagrant-ssh','vagrant-ssh-debug'
    etc.install 'config.fish'
    system "echo Adding 'source /usr/local/etc/config.fish' to ~/.config/fish/config if not present..."
    system "mkdir -p ~/.config/fish && touch ~/.config/fish/config && if [ \"grep -q '^source /usr/local/etc/config.fish' ~/.config/fish/config\" == \"\" ]; then echo 'source /usr/local/etc/config.fish' | tee -a ~/.config/fish/config; fi"
    system "echo Changing default shell to fish requires your password..."
    system "mkdir -p ~/.config/fish && if [ \"grep -q '^/usr/local/bin/fish$' /etc/shells\" == \"\" ]; then echo '/usr/local/bin/fish' | sudo tee -a /etc/shells; fi"
    system "chsh -s /usr/local/bin/fish"
  end
end
