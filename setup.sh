#!/bin/bash -eux

sudo systemctl start ssh

# Alter user account.
sudo echo "ubuntu        ALL=(ALL)       NOPASSWD: ALL" | sudo tee -a /etc/sudoers
sudo sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers