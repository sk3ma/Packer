#!/bin/bash -eux

# Installing packages.
echo "[ INFO ] Installing packages..."
apt-get clean
apt install vim  \
    screenfetch  \
    git  \
    net-tools  \
    pv  \
    screen  \
    sysstat  \
    unzip  \
    wget  \
    curl -y
apt remove unattended-upgrades -y
apt autoremove -y
