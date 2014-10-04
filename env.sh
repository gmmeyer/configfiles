#!/bin/sh

# setup zsh as our environment. 
# now that everything is actually installed, we can also call the zshrc
# that'll make intalling a version of python, etc, trivial.

env zsh
.  ~/.zshrc

NODE="v0.11.14"
PYTHON="2.7.8"

nvm install $NODE
nvm alias current $NODE

pyenv install $PYTHON
pyenv rehash
pyenv global $PYTHON
