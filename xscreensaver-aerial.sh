#!/usr/bin/env bash

# https://github.com/graysky2/xscreensaver-aerial/


# mpv
# http://ubuntuhandbook.org/index.php/2016/07/install-mpv-media-player-ubuntu-16-04/
sudo add-apt-repository ppa:mc3man/mpv-tests -y
sudo apt update
sudo apt install mpv -y

# xscreensaver
sudo apt-get install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra xscreensaver-screensaver-bsod -y
sudo apt-get remove gnome-screensaver -y
xscreensaver -nosplash

