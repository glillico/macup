## Quick Start
* 'xcode-select --install'
* `mkdir -p ~/Development/GitHub && cd ~/Development`
* `git clone https://github.com/glillico/macup.git ~/Development/GitHub/macup`
* `ln -s ~/Development/GitHub/macup`
* `cd ~/Development/macup`
* `./setup.sh`

## Instructions
### Install xcode command line tools
* 'xcode-select --install'

### Setup python virtual environment
* `mkdir -p ~/Development/Python_VENVs`
* `cd ~/Development/Python_VENVs`
* `/usr/bin/python3 -m venv macup`
* `ln -s macup ansible`
* `cd ~/Development/Python_VENVs/ansible`
* `source bin/activate`

#### Upgrade pip
* `python3 -m pip install --upgrade pip`

#### Install ansible
* `python3 -m pip install ansible`

#### Purge cache
* `python3 -m pip cache purge`

### Setup directories
* `mkdir -p ~/Development/macup && cd ~/Development/macup`

### Clone git repositories
* `git clone https://github.com/geerlingguy/mac-dev-playbook.git ~/Development/macup/mac-dev-playbook`
* `git clone https://github.com/glillico/mac-dev-playbook_myconfigs.git ~/Development/macup/mac-dev-playbook_myconfigs`

### Configure playbook
#### Link config.yml
* `cd ~/Development/macup/mac-dev-playbook`
* `ln -s ~/Development/macup/mac-dev-playbook_myconfigs/config.yml`

#### Configure terminal
* `cd ~/Development/macup/mac-dev-playbook/files/terminal`
* `ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/terminal/GL-Term.terminal`
* `cd ~/Development/macup/mac-dev-playbook/tasks`
* `sed -i '' 's/JJG-Term/GL-Term/g' terminal.yml && sed -i '' '/Cobalt (SL).tmTheme/d' sublime-text.yml`

#### Configure sublime-text
* `cd ~/Development/macup/mac-dev-playbook/files/sublime`
* `mv Preferences.sublime-settings JJG.Preferences.sublime-settings`
* `ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/sublime/Preferences.sublime-settings`

#### Modify ansible.cfg
* `cd ~/Development/macup/mac-dev-playbook && echo "collections_path = ./" >> ansible.cfg`

#### Install ansible requirements
* `ansible-galaxy install -r requirements.yml`

### Run the below when ready
* `ANSIBLE_CONFIG=~/Development/macup/mac-dev-playbook/ansible.cfg ansible-playbook -i ~/Development/macup/mac-dev-playbook/inventory ~/Development/macup/mac-dev-playbook/main.yml -K`

## Setup gickup
### Setup gickup environment

* `mkdir -p ~/Development/gickup`
* `cd ~/Development/gickup`

### Download gickup binary
* `wget https://github.com/cooperspencer/gickup/releases/download/v0.10.14/gickup_0.10.14_darwin_amd64.tar.gz`
* `tar zxvf gickup_0.10.14_darwin_amd64.tar.gz`

### Configure gickup
* `ln -s ~/Development/macup/gickup_conf.yml ./conf.yml`

### Run gickup
./gickup

## Setup ssh keys
### Clone ssh repository
git clone https://github.com/glillico/ssh.git ~/ssh

### Configure ssh keys
cd ~/
mv .ssh .OLD.ssh
mv ssh .ssh
chmod 644 ~/.ssh/authorized_keys

### Configure active templates
cd ~/.ssh/active
ln -s ~/.ssh/templates/1Password

## Author Information

Created in 2023 by Graham Lillico. (Inspired by [aussielunix](https://gist.github.com/aussielunix/fb1ef2d906183604e3268aa86353bcb3))