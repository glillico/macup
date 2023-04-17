# Quick Start
* `xcode-select --install`
* `mkdir -p ~/Development/GitHub && cd ~/Development`
* `git clone https://github.com/glillico/macup.git ~/Development/GitHub/macup`
* `ln -s ~/Development/GitHub/macup`
* `cd ~/Development/macup`
* `./setup.sh`

# Instructions
## Install xcode command line tools
* `xcode-select --install`

## Setup python virtual environment
* `mkdir -p ~/Development/Python_VENVs ~/Development/GitHub`
* `cd ~/Development/Python_VENVs`
* `/usr/bin/python3 -m venv macup`
* `ln -s macup ansible`
* `cd ~/Development/Python_VENVs/ansible`
* `source bin/activate`
### Upgrade pip
* `python3 -m pip install --upgrade pip`
### Install ansible
* `python3 -m pip install ansible`
### Purge cache
* `python3 -m pip cache purge`

## Clone git repositories
* `git clone https://github.com/geerlingguy/mac-dev-playbook.git ~/Development/macup/mac-dev-playbook`
* `git clone https://github.com/glillico/mac-dev-playbook_myconfigs.git ~/Development/macup/mac-dev-playbook_myconfigs`

## Configure playbook
### Link config.yml
* `cd ~/Development/macup/mac-dev-playbook`
* `ln -s ~/Development/macup`
* `mac-dev-playbook_myconfigs/config.yml`

## Configure terminal
* `cd ~/Development/macup/mac-dev-playbook/files/terminal`
* `ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/terminal/GL-Term.terminal`
* `cd ~/Development/macup/mac-dev-playbook/tasks`
* `sed -i '' 's/JJG-Term/GL-Term/g' terminal.yml && sed -i '' '/Cobalt (SL).tmTheme/d' sublime-text.yml`

## Configure sublime-text
* `cd ~/Development/macup/mac-dev-playbook/files/sublime`
* `mv Preferences.sublime-settings JJG.Preferences.sublime-settings`
* `ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/sublime/Preferences.sublime-settings`

## Modify ansible.cfg
* `cd ~/Development/macup/mac-dev-playbook && echo "collections_path = ./" >> ansible.cf`g

## Modify .gitignore
* `cd ~/Development/macup/mac-dev-playbook && echo "ansible_collections" >> .gitignore`

## Install ansible requirements
* `ansible-galaxy install -r requirements.yml`

## Install Rosetta 2
* `sudo softwareupdate --install-rosetta`

## Run ansible playbook
* `ANSIBLE_CONFIG=~/Development/macup/mac-dev-playbook/ansible.cfg ansible-playbook -i ~/Development/macup/mac-dev-playbook/inventory ~/Development/macup/mac-dev-playbook/main.yml -K`

## Setup gickup
### Setup gickup environment
* `mkdir -p ~/Development/gickup`
* `cd ~/Development/gickup`
### Define gickup variables

See https://github.com/cooperspencer/gickup/releases/ for more information.

* `GICKUPVERSION=0.10.14`
* `GICKUPOS=darwin`
* `GICKUPPLATFORM=arm64`
### Download gickup binary
* `curl -LO https://github.com/cooperspencer/gickup/releases/download/v0.10.14/gickup_${GICKUPVERSION}_${GICKUPOS}_${GICKUPPLATFORM}.tar.gz`
* `tar zxvf gickup_${GICKUPVERSION}_${GICKUPOS}_${GICKUPPLATFORM}.tar.gz`
### Configure gickup
* `curl -LO https://gist.githubusercontent.com/glillico/f6b4866741ce7640ab56b3d78dd05e2d/raw/cfe1c43d95bbbe8720692d71146f1631b4e8a69d/conf.yml`
### Run gickup
* `~/Development/gickup/gickup ~/Development/gickup/conf.yml`

## Setup ssh keys
### Clone ssh repository
* `git clone https://github.com/glillico/ssh.git ~/ssh`
### Configure ssh keys
* `cd ~/`
* `mv .ssh .OLD.ssh`
* `mv ssh .ssh`
* `chmod 644 ~/.ssh/authorized_keys`
### Configure active templates
* `cd ~/.ssh/active`
* `ln -s ~/.ssh/templates/1Password`

## Setup homelab
* `cd ~/Development`
### Clone homelab repository
* `git clone https://github.com/glillico/homelab.git ~/Development/GitHub/homelab`
### Link to homelab repository
* `ln -s ~/Development/GitHub/homelab`

## Setup .gitconfig_extras file.
`cp -p ~/Development/GitHub/dotfiles/.example.gitconfig_extras ~/Development/GitHub/dotfiles/.gitconfig_extras`
### Link to .gitconfig_extras file.
`cd ~/`
`ln -s ~/Development/GitHub/dotfiles/.gitconfig_extras`

## Complete setup of backblaze
* `open '/opt/homebrew/Caskroom/backblaze/8.5.0.664/Backblaze Installer.app'`

## Purge cache
* `python3 -m pip cache purge`

## Author Information

Created in 2023 by Graham Lillico. (Inspired by [aussielunix](https://gist.github.com/aussielunix/fb1ef2d906183604e3268aa86353bcb3))