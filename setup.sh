#!/bin/sh

# This setup script is just for me, personally, for when I have to put together a new comptuer.
# I don't suggest anyone actually use it. It's mostly for me to remember what I have to do to put it together.
# I've never actually tested it (and there are much better ways of doing it than what I'm doing here).
# If you do use this, I take no responsibility for breaking your computer.

#git clone git@github.com:gmmeyer/dotfiles.git /home/greg/dotfiles

# Also, I know there are better ways to do permissions in a script, you don't have to tell me. ;)

HOMEDIR='~/'
CONFIGFILES=$HOMEDIR'configfiles/'
DOTFILES=$HOMEDIR'dotfiles/'
DOTCONFIGFILES=$HOMEDIR'.config/'
BACKUP=$DOTFILES'backup_dotfiles/'

git clone git@github.com:gmmeyer/configfiles.git $CONFIGFILES

git -C $CONFIGFILES submodule init
git -C $CONFIGFILES submodule update

.$CONFIGFILES/repositories.sh

sudo apt-get -y update

ln -s $CONFIGFILES"awesome-dangerzone" $DOTCONFIGFILES"awesome"
ln -s $CONFIGFILES"terminator" $DOTCONFIGFILES"terminator"

.$CONFIGFILES/dotfiles.sh

.$CONFIGFILES/install.sh

echo "All Done!"
env zsh
.  ~/.zshrc
