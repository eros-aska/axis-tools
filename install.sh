#!/bin/bash

PATCH_BEAM_DIR=~/beam

if [ ! -d ${PATCH_BEAM_DIR}  ];then
    mkdir -p ${PATCH_BEAM_DIR}
fi

cp env/.bash_aliases ~/.bash_aliases
source ~/.bash_aliases
