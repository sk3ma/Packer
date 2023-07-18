#!/bin/bash -eux

# Installing packages.
echo "[ INFO ] Installing packages..."
apt-get clean
apt install vim -y
apt install screenfetch -y
apt install git -y
apt install net-tools -y
apt install pv -y
apt install screen -y
apt install sysstat -y
apt install unzip -y
apt install wget -y
apt install curl -y
apt remove unattended-upgrades -y
apt autoremove -y
