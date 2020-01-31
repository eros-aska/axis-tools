#!/bin/bash

rsync -e "ssh -x" ft-host/ssh/config vsbg-ft-host:~/.ssh/config
rsync -e "ssh -x" ft-host/env/.bash_aliases vsbg-ft-host:~/.bash_aliases
