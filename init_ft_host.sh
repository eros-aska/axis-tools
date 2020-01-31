#!/bin/bash

# Env files
rsync -e "ssh -x" ft-host/ssh/config vsbg-ft-host:~/.ssh/config
rsync -e "ssh -x" ft-host/env/.bash_profile vsbg-ft-host:~/.bash_profile

# Scrpits
rsync -e "ssh -x" ft-host/install.sh vsbg-ft-host:~/install.sh
rsync -e "ssh -x" ft-host/putbeam.sh vsbg-ft-host:~/putbeam.sh
