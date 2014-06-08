#!/bin/sh
#
# Installs command line tools for openstack on Mac OS X (tested on 10.9)
#
# bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Mac-CLI-tools.sh)

sudo easy_install pip

sudo pip install python-novaclient && \
sudo pip install python-ceilometerclient && \
sudo pip install python-cinderclient && \
sudo pip install python-glanceclient && \
sudo pip install python-heatclient && \
sudo pip install python-keystoneclient && \
sudo pip install python-neutronclient && \
sudo pip install python-swiftclient && \
sudo pip install python-troveclient
