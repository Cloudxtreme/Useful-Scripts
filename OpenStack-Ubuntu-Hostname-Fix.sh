#!/bin/sh
#
# Ubuntu openstack host fix
#
# bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Ubuntu-Hostname-Fix.sh)

cp /etc/hosts /tmp/hosts && echo "127.0.1.1 localhost `hostname`">> /tmp/hosts && sudo mv -f /tmp/hosts /etc/hosts
