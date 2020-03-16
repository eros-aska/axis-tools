#!/bin/bash

unload_each_file()
{
    echo -e "\nremove $1 from the patch path"
    #rm -f /storage/system/config/sgc/bs_SSC_1/dev_patches/$1
    rm -f /storage/system/config/sgc/sc_dev_patches/$1

    load_and_purge `basename $1 .beam`
}

load_and_purge()
{
    ERL_CALL="/opt/otp/lib/erl_interface-*/bin/erl_call -c bs_SSC_1 -sname esc1 "    
    LOAD_PATCH="$ERL_CALL -sname esc1 -a \"shell_default nl [$1]\""
    PURGE_PATCH="$ERL_CALL -sname esc1 -a \"code purge [$1]\""
	
    echo -e "\nload the beam file $1"
    /opt/otp/lib/erl_interface-*/bin/erl_call -c bs_SSC_1 -sname esc1 -a "shell_default nl [$1]"
	
    echo -e "\npurge the old beam file $1"
    /opt/otp/lib/erl_interface-*/bin/erl_call -c bs_SSC_1 -sname esc1 -a "code purge [$1]"
}

upload_each_file()
{
    echo -e "\ncopy $1 to the patch path"
    cp $1 /storage/system/config/sgc/sc_dev_patches 
    load_and_purge `basename $1 .beam`
}

upload_files()
{
    beam_files=`find . -maxdepth 1 -name "*.beam"`
    echo starting
    for i in $beam_files
    do
        echo uploading $i
        upload_each_file $i
    done
    echo -e "\nfinished"
}

unload_files()
{
    beam_files=`find . -maxdepth 1 -name "*.beam"`
    echo starting
    for i in $beam_files
    do
    echo unloading $i
    unload_each_file $i
    done
    echo -e "\nfinished"
}

while test $# -gt 0; do
    case "$1" in
        -p|--dev_patches)
            upload_files
            shift
            ;;
        -u|--unload-beams)
            unload_files
            shift
            ;;
        *)
            break
            ;;
    esac
done
