#!/bin/bash

# Env files
echo "1. Update aliased ..."
#rsync -e "ssh -x" ft-host/ssh/config vsbg-ft-host:~/.ssh/config
rsync -e "ssh -x" ft-host/env/.bash_profile vsbg-ft-host:~/.bash_profile

# Scrpits
echo "2. Upload scripts to vsbg-ft-host ..."
rsync -e "ssh -x" ft-host/script/ vsbg-ft-host:~/

# Sync FT codes
echo "3. Sync FT code"
source ~/.bash_aliases
syncft

# Install
echo "4. Install vsbg-ft-host tools"
ssh -x vsbg-ft-host "~/install.sh"