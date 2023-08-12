#!/bin/bash -eux

# Installing packages.
echo "==> Installing packages..."
sudo apt-get clean
sudo apt install -y vim  \
    screenfetch          \
    git                  \
    net-tools            \
    pv                   \
    screen               \
    sysstat              \
    unzip                \
    wget                 \
    curl
sudo apt remove unattended-upgrades -y
sudo apt autoremove -y
