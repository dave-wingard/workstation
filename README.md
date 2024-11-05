# workstation

### Install base packages
apt update ; apt install -y sudo vim git ansible rsync

### Clone this repo
git clone git@github.com:dave-wingard/workstation.git

### Run the Ansible playbook
ansible-playbook playbooks/gnome.yml
