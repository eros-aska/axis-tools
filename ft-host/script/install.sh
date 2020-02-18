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
/local/scratch/${USER}/vsbg/tools/ssh/setup_stack_ssh.sh