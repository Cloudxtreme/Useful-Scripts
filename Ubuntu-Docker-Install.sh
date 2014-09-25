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


sudo apt-get -y update && \
sudo apt-get -y upgrade && \
curl -sSL https://get.docker.io/ubuntu/ | sudo sh




#Subuser

#P