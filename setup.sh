#!/bin/sh

echo '# Starting'

echo '## Setup python virtual environment'
mkdir -p ~/Development/Python_VENVs ~/Development/GitHub
cd ~/Development/Python_VENVs
/usr/bin/python3 -m venv macup
ln -s macup ansible
cd ~/Development/Python_VENVs/ansible
source bin/activate

echo '### Upgrade pip'
python3 -m pip install --upgrade pip
echo '### Install ansible'
python3 -m pip install ansible
echo '### Purge cache'
python3 -m pip cache purge

echo '## Clone git repositories'
git clone https://github.com/geerlingguy/mac-dev-playbook.git ~/Development/macup/mac-dev-playbook
git clone https://github.com/glillico/mac-dev-playbook_myconfigs.git ~/Development/macup/mac-dev-playbook_myconfigs

echo '## Configure playbook'
echo '### Link config.yml'
cd ~/Development/macup/mac-dev-playbook
ln -s ~/Development/macup/mac-dev-playbook_myconfigs/config.yml

echo '### Configure terminal'
cd ~/Development/macup/mac-dev-playbook/files/terminal
ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/terminal/GL-Term.terminal
cd ~/Development/macup/mac-dev-playbook/tasks
sed -i '' 's/JJG-Term/GL-Term/g' terminal.yml && sed -i '' '/Cobalt (SL).tmTheme/d' sublime-text.yml

echo '### Configure sublime-text'
cd ~/Development/macup/mac-dev-playbook/files/sublime
mv Preferences.sublime-settings JJG.Preferences.sublime-settings
ln -s ~/Development/macup/mac-dev-playbook_myconfigs/files/sublime/Preferences.sublime-settings

echo '### Modify ansible.cfg'
cd ~/Development/macup/mac-dev-playbook && echo "collections_path = ./" >> ansible.cfg

echo '### Modify .gitignore'
cd ~/Development/macup/mac-dev-playbook && echo "ansible_collections" >> .gitignore

echo '### Install ansible requirements'
ansible-galaxy install -r requirements.yml

echo '## Install Rosetta 2'
sudo softwareupdate --install-rosetta

echo '## Run ansible playbook'
ANSIBLE_CONFIG=~/Development/macup/mac-dev-playbook/ansible.cfg ansible-playbook -i ~/Development/macup/mac-dev-playbook/inventory ~/Development/macup/mac-dev-playbook/main.yml -K

echo '## Setup gickup'
echo '### Setup gickup environment'
mkdir -p ~/Development/gickup
cd ~/Development/gickup
echo '### Download gickup binary'
wget https://github.com/cooperspencer/gickup/releases/download/v0.10.14/gickup_0.10.14_darwin_arm64.tar.gz
tar zxvf gickup_0.10.14_darwin_arm64.tar.gz
echo '### Configure gickup'
curl https://gist.githubusercontent.com/glillico/f6b4866741ce7640ab56b3d78dd05e2d/raw/cfe1c43d95bbbe8720692d71146f1631b4e8a69d/conf.yml -o conf.yml
echo '## Run gickup'
~/Development/gickup/gickup ~/Development/gickup/conf.yml

echo '## Setup ssh keys'
echo '### Clone ssh repository'
git clone https://github.com/glillico/ssh.git ~/ssh
echo '### Configure ssh keys'
cd ~/
mv .ssh .OLD.ssh
mv ssh .ssh
chmod 644 ~/.ssh/authorized_keys
echo '### Configure active templates'
cd ~/.ssh/active
ln -s ~/.ssh/templates/1Password

echo '## Setup homelab'
cd ~/Development
echo '### Clone homelab repository'
git clone https://github.com/glillico/homelab.git ~/Development/GitHub/homelab
echo '### Link to homelab repository'
ln -s ~/Development/GitHub/homelab

echo '## Complete setup of backblaze'
open '/opt/homebrew/Caskroom/backblaze/8.5.0.664/Backblaze Installer.app'

echo '## Purge cache'
python3 -m pip cache purge

echo '# Done'
