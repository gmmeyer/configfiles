#!/bin/sh

sudo apt-get -y update

# needs to be more here
# I could just save the apps via dpkg and then reinstall them via the same
sudo apt-get install -y --install-recommends pipelight-multi nvidia-331-updates

sudo apt-get install -y \
  awesome awesome-extra \
  blueman \
  dropbox \
  emacs24-nox \
  google-chrome-stable google-chrome-beta \
  heroku-toolbelt \
  keychain \
  mongodb-org \
  network-manager \
  nginx \
  nodejs \
  oracle-java8-installer \
  pidgin pidgin-plugin-pack pidgin-skype \
  python python3 \
  r-base r-recommended \
  rcm \
  redis-server \
  ruby \
  rxvt-unicode \
  skype \
  spotify-client \
  sublime-text-installer \
  synaptic \
  terminator \
  tmux \
  vim \
  xfce4-goodies xfce4-terminal xfce4-volumed \
  xfce4-power-manager xubuntu-desktop \
  zsh

sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight
sudo pipelight-plugin --enable flash

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOMEDIR'.oh-my-zsh'

curl -sSL https://get.rvm.io | bash -s stable --autolibs --rails
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | bash

sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
