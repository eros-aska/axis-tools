#!/bin/bash

rsync -e "ssh -x" ft-host/ssh/config vsbg-ft-host:~/.ssh/config