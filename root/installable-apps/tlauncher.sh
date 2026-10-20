#!/bin/bash
set -e
apt-get update
wget -q -O /tmp/tlauncher.tar.gz https://launcher.mojang.com/download/Minecraft.jar
mkdir -p /opt/tlauncher
cp /tmp/tlauncher.tar.gz /opt/tlauncher/
