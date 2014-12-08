#!/bin/sh

CONFIGFILES=$HOME'configfiles/'
DOTFILES=$HOME'dotfiles/'
DOTDOTFILES=$HOME'.dotfiles/'
DOTCONFIGFILES=$HOME'.config/'
BACKUP=$DOTFILES"backup_dotfiles/"

# I need to add a check for these files to see if they are there.

mkdir $DOTDOTFILES
ln -s $CONFIGFILES'dotfiles/rcrc' $DOTDOTFILES'rcrc'

ln -s $CONFIGFILES'dotfiles' $DOTFILES

# This is so much cleaner than the previous one.

# RCRC has a fucked up bit in it that makes it impossible to call rcdn
# and then rcup without getting things from the dotfiles directory that should
# be excluded. So, I am going to put it together this way, therefore,
# it won't do that.

# This goes first so that .rcrc is put out there
rcup

# This goes second so that the dotfiles are all placed out there
rcup
