#!/bin/bash -eux

# Installing packages.
echo "==> Installing packages..."
apt-get clean
apt install -y vim  \
    screenfetch     \
    git             \
    net-tools       \
    pv              \
    screen          \
    sysstat         \
    unzip           \
    wget            \
    curl
apt remove unattended-upgrades -y
apt autoremove -y
