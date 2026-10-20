# README.md

# 🚀 FREE Ubuntu VPS in GitHub Codespaces (Mint-style)
A lightweight Ubuntu desktop environment with a Linux Mint-inspired Cinnamon experience for browser-based cloud development.

## Overview
This project turns GitHub Codespaces into a cloud desktop environment that behaves like a lightweight VPS. It is designed to be easy to launch from a browser and usable for remote work, Linux experimentation, and desktop tasks.

## What this version adds
- Mint-style desktop option via Cinnamon
- Ubuntu base image from Codespaces
- Installer GUI for selecting desktop environment and apps
- Additional app scripts for common developer tools

## Recommended workflow
1. Fork this repository.
2. Open the repository in GitHub Codespaces.
3. Run:

```bash
chmod +x install.sh
./install.sh
```

4. Launch the installer GUI.
5. Select your desktop environment and apps.
6. Rebuild the container to apply the configuration.

## Desktop options
- Linux Mint Cinnamon (Mint-style)
- KDE Plasma
- XFCE4
- i3
- GNOME
- Cinnamon
- LXQt

## Important note
This is not a permanent 24/7 server. GitHub Codespaces is designed for development and temporary cloud work. Use it responsibly and within the platform limits.

## Build example
```bash
docker build -t mint-vps .
docker run --rm -p 3000:3000 -v $PWD:/config mint-vps
```
