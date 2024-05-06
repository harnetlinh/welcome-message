#!/bin/bash

# Set PrintMotd to yes in sshd_config
sudo sed -i 's/#\?PrintMotd.*/PrintMotd yes/' /etc/ssh/sshd_config

# Remove the existing /etc/motd file
sudo rm /etc/motd

# Create a new /etc/motd file with the desired message
sudo tee /etc/motd > /dev/null <<EOF


============================
-- Welcome to omiCode VPS --
============================


EOF

# Comment out lines in /etc/pam.d/sshd
sudo sed -i '/pam_motd.so/s/^/#/' /etc/pam.d/sshd

# Restart the SSH service
sudo systemctl restart ssh
