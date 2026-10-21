#!/bin/bash
set -e

apt-get update

wget -O /tmp/discord.deb "https://dl.discordapp.com/api/download?platform=linux&format=deb" || true

if [ -f /tmp/discord.deb ]; then
  apt-get install -y /tmp/discord.deb || echo "Discord install skipped"
fi
