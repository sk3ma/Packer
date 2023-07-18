#!/bin/bash -eux

# Installing packages.
echo "[ INFO ] Installing packages..."
apt update
apt upgrade -y
apt-get clean
apt install apt-show-versions -y
apt install apt-transport-https -y
apt install aptitude -y
apt install atop -y
apt install auditd -y
apt install bzip2 -y
apt install curl -y
apt install debsums -y
apt install dos2unix -y
apt install dstat -y
apt install git -y
apt install htop -y
apt install iftop -y
apt install ioping -y
apt install iotop -y
apt install iptables-persistent -y
apt install jq -y
apt install locate -y
apt install logrotate -y
apt install mlocate -y
apt install mtr-tiny -y
apt install ncdu -y
apt install net-tools -y
apt install nfs-common -y
apt install nscd -y
apt install ntpdate -y
apt install progress -y
apt install pv -y
apt install screen -y
apt install snapd -y
apt install sysstat -y
apt install tcptraceroute -y
apt install traceroute -y
apt install tree -y
apt install unzip -y
apt install vnstat -y
apt install neofetch -y
apt install wget -y
apt install zip -y
apt remove modemmanager -y
apt remove popularity-contest -y
apt remove unattended-upgrades -y
apt remove ufw -y
apt autoremove -y
history -c
rm -f ~/.bash_history