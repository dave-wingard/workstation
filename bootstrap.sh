#!/bin/bash

### Prevent the script from running as root 
check_not_root() {
    if [ "$EUID" -eq 0 ]; then
        echo "This script should not be run as root. Exiting."
        exit 1
    fi
}

### Install base packages
sudo apt update ; sudo apt install -y git ansible rsync

### Copy ssh keys
check_not_root

mkdir ~/.ssh
rsync dave@nas01:~/setup/id_rsa* ~/.ssh

sudo chown -R dave:dave ~/.ssh
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 644 ~/.ssh/id_rsa.pub

### Clone this repo
mkdir ~/github
cd ~/github
git clone git@github.com:dave-wingard/workstation.git

### Run the Ansible playbook
cd workstation
ansible-playbook playbooks/gnome.yml
