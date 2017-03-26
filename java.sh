#!/usr/bin/env bash

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java8-installer
sudo apt install -y oracle-java8-set-default
HAS_CHOICES=$(echo '' | sudo update-alternatives --config java | grep choice)
if [ "$HAS_CHOICES" != "" ]; then
    JAVA_HOME=$(echo '' | sudo update-alternatives --config java | grep '*' | grep -v choice | awk '{print $3}' | sed 's/\/jre.*//g')
else    
    JAVA_HOME=$(sudo update-alternatives --config java | awk '{print $NF}' | head -1)
fi
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bash_custom
