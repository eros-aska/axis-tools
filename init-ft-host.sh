#!/bin/bash

rsync -e "ssh -x" ft-host/ssh/config vsbg-ft-host:~/.ssh/config
rsync -e "ssh -x" ft-host/env/.bash_profile vsbg-ft-host:~/.bash_profile
