#!/bin/bash

# Install sshpass
wget http://sourceforge.net/projects/sshpass/files/sshpass/1.05/sshpass-1.05.tar.gz
tar xvzf sshpass-1.05.tar.gz
./configure
cd sshpass-1.05
make
sudo make install

