#!/bin/bash -eux

# Installing packages.
echo "[ INFO ] Installing packages..."
# apt update
# apt upgrade -y
apt-get clean
apt install -y apt-transport-https \
    apt-show-versions \
    software-properties-common \
    apt-transport-https \
    aptitude \
    atop \
    bzip2 \
    debsums \
    dstat \
    git \
    htop \
    iftop \
    ioping \
    iotop \
    iptables-persistent \
    jq \
    locate \
    logrotate \
    mlocate \
    mtr-tiny \
    ncdu \
    net-tools \
    nfs-common \
    nscd \
    ntpdate \
    progress \
    pv \
    screen \
    snapd \
    tcptraceroute \
    tree \
    unzip \
    vnstat \
    neofetch \
    wget \
    zip \
    curl 
apt remove -y modemmanager \
    popularity-contest \
    unattended-upgrades \
    ufw
apt autoremove -y
history -c
rm -f ~/.bash_history
