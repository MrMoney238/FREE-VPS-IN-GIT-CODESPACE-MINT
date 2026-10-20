#!/bin/bash
set -e

apt update

if jq ".DE" "/options.json" | grep -q "Linux Mint Cinnamon (Mint-style)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        cinnamon \
        cinnamon-common \
        cinnamon-control-center \
        cinnamon-settings-daemon \
        gnome-terminal \
        dbus-x11 \
        firefox \
        xauth \
        x11-xserver-utils \
        xterm
    cp /startwm-cinnamon.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "KDE Plasma (Heavy)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y dolphin gwenview kde-config-gtk-style kdialog kfind khotkeys kio-extras knewstuff-dialog konsole ksystemstats kwin-addons kwin-x11 kwrite plasma-desktop plasma-workspace qml-module-qt-labs-platform systemsettings
    sed -i 's/applications:org.kde.discover.desktop,/applications:org.kde.konsole.desktop,/g' /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml
    cp /startwm-kde.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "XFCE4 (Lightweight)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y firefox mousepad xfce4-terminal xfce4 xubuntu-default-settings xubuntu-icon-theme
    rm -f /etc/xdg/autostart/xscreensaver.desktop
    cp /startwm-xfce.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "I3 (Very Lightweight)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends firefox i3 i3-wm stterm
    update-alternatives --set x-terminal-emulator /usr/bin/st
    cp /startwm-i3.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "GNOME 42 (Very Heavy)"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox gnome-shell gnome-shell-* dbus-x11 gnome-terminal gnome-accessibility-themes gnome-calculator gnome-control-center* gnome-desktop3-data gnome-initial-setup gnome-menus gnome-text-editor gnome-themes-extra* gnome-user-docs gnome-video-effects gnome-tweaks gnome-software language-pack-en-base mesa-utils xterm yaru-* || true
    cp /startwm-gnome.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "Cinnamon"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox cinnamon
    cp /startwm-cinnamon.sh /defaults/startwm.sh
fi

if jq ".DE" "/options.json" | grep -q "LXQT"; then
    DEBIAN_FRONTEND=noninteractive apt-get install -y firefox lxqt
    cp /startwm-lxqt.sh /defaults/startwm.sh
fi

chmod +x /defaults/startwm.sh
rm -f /startwm-kde.sh /startwm-i3.sh /startwm-xfce.sh /startwm-gnome.sh /startwm-lxqt.sh /startwm-cinnamon.sh || true
