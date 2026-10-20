#!/bin/bash
set -e
apt-get update
wget -qO- https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor > /usr/share/keyrings/vscodium.gpg
sh -c 'echo "deb [ signed-by=/usr/share/keyrings/vscodium.gpg ] https://download.vscodium.com/debs stable main" > /etc/apt/sources.list.d/vscodium.list'
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends codium
