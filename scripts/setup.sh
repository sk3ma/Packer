#!/bin/bash -eux

sudo systemctl start ssh

# Alter user account.
echo "ubuntu        ALL=(ALL)       NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/ubuntu
sudo sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers.d/ubuntu
