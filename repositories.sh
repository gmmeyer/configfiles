#!/bin/sh

## Adding Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

## Adding google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

## Adding Spotify
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

## Adding Virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'

## Adding R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list.d/r.list'

## Adding MongoDB
sudo apt-key adv --keyserver hkp://,keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

## Adding Heroku Toolbelt
wget -O- https://toolbelt.heroku.com/apt/release.key | sudo apt-key add -
echo "deb http://toolbelt.heroku.com/ubuntu ./" | sudo tee /etc/apt/sources.list.d/heroku.list

## The stupid add-apt-repo won't work because this is only realeased for LTS and not for utopic. 
echo "deb http://ppa.launchpad.net/martin-frost/thoughtbot-rcm/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/thoughtbot-rcm.list

# Another thing I need to do in this is to generate an ssl key
PPAS=(
    'fkrull/deadsnakes'
    'gnome3-team/gnome3'
    'git-core/ppa'
    'klaus-vormweg/awesome'
    'libreoffice/ppa'
    'martin-frost/thoughtbot-rcm'
    'mozillateam/firefox-next'
    'pidgin-developers/ppa'
    'pipelight/stable'
    'rwky/redis'
    'ubuntu-wine/ppa'
    'webupd8team/atom'
    'webupd8team/brackets'
    'webupd8team/java'
    'webupd8team/sublime-text-3'
)

for i in ${PPAS[@]}; do
    sudo add-apt-repository -y 'ppa:'$i
done

