#!/bin/bash
set -e

json_file="/options.json"

if [ ! -f "$json_file" ]; then
    echo "No /options.json file found."
    exit 1
fi

if jq ".defaultapps | contains([0])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/wine.sh
    ( /installable-apps/wine.sh ) || true
fi
if jq ".defaultapps | contains([1])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/chrome.sh
    ( /installable-apps/chrome.sh ) || true
fi
if jq ".defaultapps | contains([2])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/xarchiver.sh
    ( /installable-apps/xarchiver.sh ) || true
fi
if jq ".defaultapps | contains([3])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/discord.sh
    ( /installable-apps/discord.sh ) || true
fi
if jq ".defaultapps | contains([4])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/steam.sh
    ( /installable-apps/steam.sh ) || true
fi
if jq ".defaultapps | contains([5])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/minecraft.sh
    ( /installable-apps/minecraft.sh ) || true
fi

if jq ".programming | contains([0])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/openjdk-8-jre.sh
    ( /installable-apps/openjdk-8-jre.sh ) || true
fi
if jq ".programming | contains([1])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/openjdk-17-jre.sh
    ( /installable-apps/openjdk-17-jre.sh ) || true
fi
if jq ".programming | contains([2])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/vscodium.sh
    ( /installable-apps/vscodium.sh ) || true
fi

if jq ".apps | contains([0])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/vlc.sh
    ( /installable-apps/vlc.sh ) || true
fi
if jq ".apps | contains([1])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/libreoffice.sh
    ( /installable-apps/libreoffice.sh ) || true
fi
if jq ".apps | contains([2])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/synaptic.sh
    ( /installable-apps/synaptic.sh ) || true
fi
if jq ".apps | contains([3])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/aqemu.sh
    ( /installable-apps/aqemu.sh ) || true
fi
if jq ".apps | contains([4])" "$json_file" | grep -q true; then
    chmod +x /installable-apps/tlauncher.sh
    ( /installable-apps/tlauncher.sh ) || true
fi

rm -rf /installable-apps
