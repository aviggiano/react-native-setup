#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y default-jre default-jdk
echo "export JAVA_HOME=$(sudo update-alternatives --config java | awk '{print $NF}' | head -1)" >> ~/.bash_custom
