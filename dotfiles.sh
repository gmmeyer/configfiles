#!/bin/sh

HOMEDIR='~/'
CONFIGFILES=$HOMEDIR'configfiles/'
DOTFILES=$HOMEDIR'dotfiles/'
DOTDOTFILES=$HOMEDIR'.dotfiles/'
DOTCONFIGFILES=$HOMEDIR'.config/'
BACKUP=$DOTFILES"backup_dotfiles/"

ln -s $CONFIGFILES'dotfiles' $DOTFILES
ln -s $CONFIGFILES'dotfiles' $DOTDOTFILES

# Add emacs lisp in there when it becomes useful
dotfiles=(
    'bash_profile'
    'bashrc'
    'emacs'
    'emacs.d'
    'gitconfig'
    'gitignore'
    'gitignore_global'
    'inputrc'
    'profile'
    'urxvt'
    'vim'
    'vimrc'
    'Xresources'
    'zlogin'
    'zshrc'
)

mkdir $BACKUP

for i in ${dotfiles[@]}; do
  ORIGINAL=$DOTFILES$i
  TARGET=$HOMEDIR'.'$i

  if [ -e $TARGET]
  then
    mv $TARGET $BACKUP
  fi

  ln -s $ORIGINAL $TARGET
done