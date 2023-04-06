## Quick Start
* `mkdir -p ~/Development && cd ~/Development`
* `git clone https://github.com/glillico/macup.git ~/Development/macup`
* `cd ~/Development/macup`
* `./setup.sh`

## Instructions
### Setup python virtual environment
* `mkdir -p ~/Development/Python_VENVs ~/Development/GitHub`
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

### Clone ssh keys
* TBC

### Clone git repositories
* TBC

## Author Information

Created in 2023 by Graham Lillico. (Inspired by [aussielunix](https://gist.github.com/aussielunix/fb1ef2d906183604e3268aa86353bcb3))