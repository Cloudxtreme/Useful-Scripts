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

# Fix hosts file on ubuntu openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/OpenStack-Ubuntu-Hostname-Fix.sh)

# Install docker on openstack
bash <(curl -s https://raw.githubusercontent.com/intlabs/Useful-Scripts/master/Ubuntu-Docker-Install.sh)

# Build CannyOS Ubuntu base containers (main)
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-14_04-base/master/Build.sh)

# Build CannyOS Ubuntu 12.04 LTS container
bash <(curl -s https://raw.githubusercontent.com/intlabs/dockerfile-cannyos-ubuntu-12_04-base/master/Build.sh)

# Build Dropbox intergration container
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-storage-dropbox/master/Build.sh)

# Build GNOME desktop vnc
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-desktop-gnome/master/Build.sh)

# Build Symbiose desktop
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-ubuntu-desktop-symbiose/master/Build.sh)

# Build Broadway application
bash <(curl -s https://raw.githubusercontent.com/intlabs/cannyos-user-application-broadway-base/master/Build.sh)
