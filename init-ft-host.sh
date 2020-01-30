#!/bin/bash

rsync -e "ssh -x" ssh/config vsbg-ft-host:~/.ssh/config