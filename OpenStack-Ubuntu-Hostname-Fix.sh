#!/bin/sh
#
# Ubuntu openstack host fix
# - fixes the madness that is Canonical not using cloud-init to set the hostname on instance launch.
#
# bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Ubuntu-Hostname-Fix.sh)

# We have to do things in this convoluted fashion to stop AppArmor freaking out:
# we are editing a system file with a cheap script...

cp /etc/hosts /tmp/hosts && \
echo "127.0.1.1 localhost `hostname`">> /tmp/hosts && \
sudo mv -f /tmp/hosts /etc/hosts && \
echo "Hopefully the last time you see the above error message!"
