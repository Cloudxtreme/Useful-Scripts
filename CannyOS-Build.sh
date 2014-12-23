#!/bin/sh
#
# CannyOS docker container build scripts
#
# https://github.com/intlabs/cannyos-ubuntu-desktop-symbiose
#
# Copyright 2014 Pete Birley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Please note:
#
# * I have not implemented a private repo or any sort of dependancy checking as yet.
#
# * CannyOS makes estensive use of FUSE, which requires elevated permissions for the docker
#   containers, and why the base containers need a custom two step build process (as we
#   need to do things that cannot be achived using 'docker build') so check out the last
#   lines of the relivant Build Script to see the launch requirments for a container.
#
# * It is imperative to note that CannyOS containers are super particular about their launch peramiters!
#    - security and reliability come through doing things right
#	 - though there is NO security at present, (waiting on FreeIPA)
#		- most containers drop you straight into root ffs!
#		- before long manual launching of containers will be less than pleasant if you want to
#		  do anything with it other than look at a web page - just like the "internet" then :)

#Mind and turn off gro on your OpenStack Hosts!
#ethtool --offload eth0 gro off && ethtool --offload eth1 gro off && ethtool --offload eth2 gro off


# Fix hosts file on ubuntu openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Ubuntu-Hostname-Fix.sh)
# Install Devstack on openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Devstack-installer.sh)
# Install docker on openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Ubuntu-Docker-Install.sh)



##PostgreSQL
# Install TeamPostgresql
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/TeamPostgresql-installer.sh)
# Build TeamPostgresql Container
bash <(curl -s https://raw.githubusercontent.com/intlabs/TeamPostgresql/master/Build.sh)



# Build Canny nginx proxy server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-nginx/master/Build.sh)
# Build CannyOS Horizon Container
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/cannyos-dev-authportal/master/Build.sh)
# Build Canny Wordpress Container
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/cannyos-frontend-wordpress/master/Build.sh)
# Build Canny mediawiki server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-mediawiki/master/Build.sh)
# Build Canny gogs server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/cannyos-frontend-gogs/master/Build.sh)
# Build cannyos-frontend-user-registration
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/cannyos-frontend-user-registration/master/Build.sh)
# Build GateOne web terminal - provides the gate one terminal web interface
# -p 443:443 -p 2222:22
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-desktop-gateone/master/Build.sh)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dev-codebox/master/Build.sh)

# Build Canny Surface Terminal.
bash <(curl -s https://raw.githubusercontent.com/CannyOS/Surface-Terminal/master/Build.sh)
# Build Canny Bedrock Git.
bash <(curl -s https://raw.githubusercontent.com/CannyOS/Bedrock-Git/master/Build.sh)




# Build Base OS containers

# Build CannyOS Ubuntu base containers (main)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base/master/Build.sh)
# Build CannyOS Ubuntu 12.04 LTS container (for older applications)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-12_04-base/master/Build.sh)
# Build CannyOS Fedora container
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-fedora-base/master/Build.sh)
# Build CannyOS ArchLinux container
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-archlinux/master/Build.sh)
# Build CannyOS openSUSE container 
# This is gonna have to be much more in depth as the only way to produce a trusted image is via KIWI
# http://flavio.castelli.name/2014/05/06/building-docker-containers-with-kiwi/
# This should be performed inside vagrant on ubuntu 14.04 to provide a single host build.
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-opensuse/master/Build.sh)





# Build CannyOS Ubuntu container with gtk3
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-ubuntu-gtk3/master/Build.sh)
# Build CannyOS Fedora container with gtk3
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-fedora-gtk3/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-archlinux-gtk3/master/Build.sh)
# Build CannyOS openSUSE container with gtk3
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-base-opensuse-gtk3/master/Build.sh)





# Build CannyOS Ubuntu container with gtk3 & gedit
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-ubuntu-gtk3-gedit/master/Build.sh)
# Build CannyOS Ubuntu container with gtk3 & libreoffice
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-ubuntu-gtk3-libreoffice/master/Build.sh)
# Build CannyOS Ubuntu container with gtk3 & gramps
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-ubuntu-gtk3-gramps/master/Build.sh)
# Build CannyOS Ubuntu container with gtk3 & epiphany
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-ubuntu-gtk3-epiphany/master/Build.sh)






# Build CannyOS Fedora container with gtk3 & gedit
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-fedora-gtk3-gedit/master/Build.sh)
# Build CannyOS Fedora container with gtk3 & libreoffice
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-fedora-gtk3-libreoffice/master/Build.sh)
# Build CannyOS Fedora container with gtk3 & epiphany
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-fedora-gtk3-epiphany/master/Build.sh)
# Build CannyOS Fedora container with gtk3 & gramps
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-fedora-gtk3-gramps/master/Build.sh)
# Build CannyOS Fedora container with gtk3 & geary
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-fedora-gtk3-geary/master/Build.sh)



# Build CannyOS openSUSE container with gtk3 & gedit
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-opensuse-gtk3-gedit/master/Build.sh)
# Build CannyOS openSUSE container with gtk3 & libreoffice
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-opensuse-gtk3-libreoffice/master/Build.sh)
# Build CannyOS openSUSE container with gtk3 & gramps
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-opensuse-gtk3-gramps/master/Build.sh)
# Build CannyOS openSUSE container with gtk3 & epiphany
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-opensuse-gtk3-epiphany/master/Build.sh)




# Build CannyOS ArchLinux container with gtk3 & gedit
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-gedit/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & libreoffice
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-libreoffice/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & gramps
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-gramps/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & epiphany
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-epiphany/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & gimp
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-gimp/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & inkscape
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-inkscape/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & midori
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-midori/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & california
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-california/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & nautilus
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-nautilus/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & gnumeric
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-gnumeric/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & evince
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-evince/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & baobab
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-baobab/master/Build.sh)
# Build CannyOS ArchLinux container with gtk3 & gpg-crypter
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-gtk3-gpgcrypter/master/Build.sh)
# Build CannyOS ArchLinux container with nginx
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-application-archlinux-nginx/master/Build.sh)







# Build CannyOS Ubuntu 14.04 lts based containers:

# Build Dropbox intergration container
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-storage-dropbox/master/Build.sh)




# Build GNOME desktop VNC (via noVNC) - provides gnome classic via vnc.
# -p 800:80
#	This forms the 'lowest' level of remote desktop
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-desktop-gnome/master/Build.sh)


# Build OpenGovernment desktop.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/cannyos-application-ubuntu-opengovernment/master/Build.sh)

# Build OpenGovernment postgres server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-postgres/master/Build.sh)
# Build OpenGovernment opencongress server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-opencongress/master/Build.sh)

# Build OpenGovernment mysql server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-mysql/master/Build.sh)
# Build OpenGovernment mediawiki server.
bash <(curl -s https://raw.githubusercontent.com/cannycomputing/connectedgovernment-mediawiki/master/Build.sh)






# Build the CannyOS user terminal - provides the default user facing terminal
# -p 222:22
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-backend-chroot/master/Build.sh)



# Build Symbiose desktop - provides the Symbiose web desktop
# -p 802:80
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-ubuntu-desktop-symbiose/master/Build.sh)




# Build Broadway application - provides a base container to build all further broadway apps
#  -p 803:80
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base/master/Build.sh)




# Build Broadway application - libreoffice
# -port 804:80
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-libreoffice/master/Build.sh)

# Build GitLab

# Build container repo
# This should be quick and dirty as glance will be used as the repo soon...

# Build SkyDNS - WIP - Provides a DNS server intergrated with etcd for docker containers
#	Contains should 'check in' on launch and have SkyDNS enter a DNS record for it:
#	<user>-<function-area>-<task>-<class>-<uuid>.<domain>.<tld>
#	This needs to run on all CoreOS instances, and the containers set to localhost for dns
https://raw.githubusercontent.com/intlabs/cannyos-backend-skydns/master/Build.sh)

# Build Openstack Client - WIP - provides a the openstack cli tools and pulls in the openrc file for a user
https://raw.githubusercontent.com/intlabs/cannyos-user-backend-openstack/master/Build.sh)

# Build User fileserver - WIP  - provides a centralised location for all storage systems
#	backend shares mounted via sshfs in users home directory
#	user home directory exported via sshfs to all other instances
https://raw.githubusercontent.com/intlabs/cannyos-user-backend-storage/master/Build.sh)

# Build databse containers
#	mySQL
#	postgresql
#	mongoDB
#	trove

# Build 

# Build CannyOS Fedora based containers:

# Build Broadway application
# -p 805:80 (needs done)
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base-fedora/master/Build.sh)

# Build Broadway application - libreoffice
# -p 806:80  (needs done)
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base-fedora/master/Build.sh)

# Build FreeIPA backend - WIP (Requires SkyDNS / CoreOS host)
#	This will be the backbone of user authentication
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-backend-freeipa/master/Build.sh)
