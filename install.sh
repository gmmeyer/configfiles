#!/bin/sh

sudo apt-get -y update || true

# needs to be more here
# I could just save the apps via dpkg and then reinstall them via the same
sudo apt-get install -y --install-recommends pipelight-multi

sudo apt-get install -y nvidia-331-updates

sudo apt-get install -y aptitude awesome awesome-extra atom blueman dropbox \
  emacs24-nox fontforge google-chrome-stable google-chrome-beta \
  heroku-toolbelt \
  keychain mongodb-org network-manager nginx nodejs oracle-java8-installer \
  pidgin pidgin-plugin-pack pidgin-skype python python3 r-base r-recommended \
  redshift rcm redis-server ruby rxvt-unicode skype spotify-client \
  sublime-text-installer synaptic terminator tmux vim xfce4-goodies \
  xfce4-terminal xfce4-volumed xfce4-power-manager xubuntu-desktop zsh


#changes shell to zsh, now that it's installed
chsh -s $(which zsh)

sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable flash

## Upgrade
####################
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean


## Oh My Zsh
####################
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOMEDIR'.oh-my-zsh'

## Ruby
################
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
ruby_version="$(curl -sSL http://ruby.thoughtbot.com/latest)"

rbenv install -s "$ruby_version"
rbenv global "$ruby_version"
rbenv rehash

gem update --system
gem install bundler --no-document --pre

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))


## Python
##################
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
eval "$(pyenv init - zsh)"

python_version='2.7.8'
pyenv install $python_version
pyenv global $python_version
pyenv rehash

## Node
####################
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash
source ~/.nvm/nvm.sh

node_version='v0.11.14'
nvm install $node_version

node_version='v0.10.33'
nvm install $node_version
nvm alias default $node_version


## Powerline Fonts
#################

git clone git@github.com:Lokaltog/powerline-fonts.git
. ~/powerline-fonts/install.sh
rm -rf ~/powerline-fonts
fc-cache -fv
