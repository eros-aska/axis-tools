#!/usr/bin/env python

import sys, os
import datetime
import getpass
import time

i = datetime.datetime.now()
log_dir = i.__format__('%y-%m-%d')
bitbake = "ssekilx5348.seki.rnd.ericsson.se"

print "Connecting bitbake and create a directory suite_log ..."
q = os.popen("ssh -p 11001 -X '"+bitbake+"' mkdir -p /home/'"+getpass.getuser()+"'/suite_log/")
q.close()

if len(sys.argv) == 2 and sys.argv[1] == 'all':
        print "Connecting bitbake and sync all ft test log including yesterday and long ago from ft-host to bitbake ..."
        p = os.popen("ssh -p 11001 -X '"+bitbake+"' rsync -avz vsbg-ft-host:/tmp/mylogdir/ /home/'"+getpass.getuser()+"'/suite_log/")
        p.close()
        print "Sync all ft test log from bitbake to local LMWP ..."
        os.system("rsync -avz  -e 'ssh -p 11001' '"+bitbake+"':~/suite_log/ /proj/htdocs/root/jpT/'"+getpass.getuser()+"'/")
else:
        print "Connecting bitbake and sync ft test log of today from ft-host to bitbake ..."
        p = os.popen("ssh -p 11001 -X '"+bitbake+"' rsync -avz vsbg-ft-host:/tmp/mylogdir/'"+log_dir+"'/* /home/'"+getpass.getuser()+"'/suite_log/'"+log_dir+"'/")
        p.close()
        print "Sync the ft test log of today from bitbake to local LMWP ..."
        os.system("rsync -avz  -e 'ssh -p 11001' '"+bitbake+"':~/suite_log/'"+log_dir+"'/* /proj/htdocs/root/jpT/'"+getpass.getuser()+"'/mylogdir/'"+log_dir+"'/")

print "\nGenerate index and all run page info ..."
os.system("/home/xliqfan/shell/jpT/priv/generate_index.escript /proj/htdocs/root/jpT/'"+getpass.getuser()+"'/")
