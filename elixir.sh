#!/usr/bin/env bash

set -eux

# https://elixir-lang.org/install.html

cd /tmp
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update || true
sudo apt-get install -y esl-erlang elixir
cd -
