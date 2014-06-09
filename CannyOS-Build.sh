#!/bin/sh
#
# CannyOS docker container build script
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
# * I have not implemented a private repo or any sort of dependancy checking as yet.
# * CannyOS makes estensive use of FUSE, which requires elevated permissions for the docker
#   containers, and why the base containers need a custom two step build process (as we
#   need to do things that cannot be achived using 'docker build') so check out the last
#   lines of the relivant Build Script to see the launch requirments for a container.
# * It is imperative to note that CannyOS are super particular about their launch peramiters!
#    - security and reliability come through doing things right
#	 - though there is NO security at present, (waiting on FreeIPA)
#		- most containers drop you straight into root ffs!

# Fix hosts file on ubuntu openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Ubuntu-Hostname-Fix.sh)

# Install docker on openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Ubuntu-Docker-Install.sh)



# Build Base OS containers

# Build CannyOS Ubuntu base containers (main)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base/master/Build.sh)

# Build CannyOS Ubuntu 12.04 LTS container (for older applications)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-12_04-base/master/Build.sh)

# Build CannyOS Fedora container ( initially to provide authorisation backend )
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-fedora-base/master/Build.sh)

# Build CannyOS openSUSE container 
# This is gonna have to be much more in depth as the only way to produce a trusted image is via KIWI
# http://flavio.castelli.name/2014/05/06/building-docker-containers-with-kiwi/
# This should be performed inside vagrant on ubuntu 14.04 to provide a single host build.

# Build CannyOS Ubuntu 14.04 lts based containers:

# Build Dropbox intergration container
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-storage-dropbox/master/Build.sh)

# Build GNOME desktop vnc - provides gnome classic via vnc.
#	This forms the 'lowest' level of remote desktop
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-desktop-gnome/master/Build.sh)

# Build GateOne web terminal - provides the gate one terminal web interface
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-desktop-gateone/master/Build.sh)

# Build Symbiose desktop - provides the Symbiose web desktop
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-ubuntu-desktop-symbiose/master/Build.sh)

# Build Broadway application - provides a base container to build all further broadway apps
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base/master/Build.sh)

# Build Broadway application - libreoffice
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

# Build Broadway application - WIP
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base-fedora/master/Build.sh)

# Build FreeIPA backend - WIP (Requires SkyDNS / CoreOS host)
#	This will be the backbone of user authentication
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-backend-freeipa/master/Build.sh)
