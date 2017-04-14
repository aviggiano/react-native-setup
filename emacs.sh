#!/usr/bin/env bash

sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install -y emacs-snapshot
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
