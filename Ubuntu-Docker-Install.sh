#!/bin/sh
#
# Install docker on Ubuntu 14.04
#
# bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Ubuntu-Docker-Install.sh)

sudo apt-get -y update && \
sudo apt-get -y install docker.io && \
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker && \
sudo restart docker.io