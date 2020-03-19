#!/bin/bash

# Make beam for code patch
echo "a. Make beam directory ..."
mkdir -p ~/beam

# Install sshpass
echo "b. Install sshpass ..."
wget http://sourceforge.net/projects/sshpass/files/sshpass/1.05/sshpass-1.05.tar.gz
tar xvzf sshpass-1.05.tar.gz

cd sshpass-1.05
./configure
make
sudo make install

rm -rf ~/sshpass-1.05*

# Configure passwordless login
echo "c. Configure passwordless login"
cd /local/scratch/${USER}/vsbg && ./tools/ssh/setup_stack_ssh.sh

# Create Network based on FT setup
echo "d. Create network"
if [ `nova list | grep ers | wc -l` = 2 ]; then
    cd /local/scratch/${USER}/vsbg && ./tools/lda_ft/setup_client_evip.sh
    echo "ERS network created."
else
    cd /local/scratch/${USER}/vsbg && ./tools/lda_ft/setup_client_ipnetwork.sh
    echo "None-ERS network created."
fi
