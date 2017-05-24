#!/usr/bin/env bash

sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install -y emacs-snapshot
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# react
npm install -g tern
npm install -g eslint babel-eslint eslint-plugin-react
npm install -g js-beautify

