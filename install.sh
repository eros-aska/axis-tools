#!/bin/bash

PATCH_BEAM_DIR=~/{USER}/beam

if [ ! -d ${PATCH_BEAM_DIR}  ];then
    mkdir -p ${PATCH_BEAM_DIR}
fi

cp env/.bash_alias ~/.bash_alias
source ~/.bash_alias
