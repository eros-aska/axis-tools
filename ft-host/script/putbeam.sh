#!/bin/bash

rsync -r --delete -e "ssh -x" ~/beam/ root@SC:/storage/system/config/sgc/sc_dev_patches/
rsync -r --delete -e "ssh -x" ~/beam/ root@SC:/storage/system/config/sgc/bs_SSC_1/dev_patches/