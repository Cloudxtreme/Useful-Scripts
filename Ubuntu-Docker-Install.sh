#!/bin/sh
#
# Install docker on Ubuntu 14.04
#
# bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Ubuntu-Docker-Install.sh)

#sudo apt-get -y update && \
#sudo apt-get -y upgrade && \
#sudo apt-get -y install docker.io && \
#sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && \
#sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io && \
#sudo groupadd docker && \
#sudo gpasswd -a ${USER} docker && \
#sudo restart docker.io

#curl -sSL https://get.docker.io/ubuntu/ | sudo sh

sudo apt-get install -y apt-transport-https && \
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list" && \
sudo apt-get update && \
sudo apt-get install -y lxc-docker



#Subuser

#P