#!/bin/sh

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

echo '### Install ansible requirements'
ansible-galaxy install -r requirements.yml

echo '## Setup gickup'
echo '## Setup gickup environment'
mkdir -p ~/Development/gickup
cd ~/Development/gickup
echo '## Download gickup binary'
wget https://github.com/cooperspencer/gickup/releases/download/v0.10.14/gickup_0.10.14_darwin_amd64.tar.gz
tar zxvf gickup_0.10.14_darwin_amd64.tar.gz
echo 'Configure gickup'
ln -s ~/Development/macup/gickup_conf.yml ./conf.yml

echo '## Done'

echo
echo Run the below when ready.
echo 'source ~/Development/Python_VENVs/macup/bin/activate'
echo 'ANSIBLE_CONFIG=~/Development/macup/mac-dev-playbook/ansible.cfg ansible-playbook -i ~/Development/macup/mac-dev-playbook/inventory ~/Development/macup/mac-dev-playbook/main.yml -K'
