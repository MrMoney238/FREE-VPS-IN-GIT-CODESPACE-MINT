#!/bin/bash
set -e
apt-get update
wget -qO- https://dl.discordapp.com/desktop-linux/latest/discord-*.deb -O /tmp/discord.deb || true
if [ -f /tmp/discord.deb ]; then
  apt-get install -y /tmp/discord.deb
fi
