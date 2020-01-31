alias repo='cd /repo/${USER}/vsbg'
alias reposrc='cd /repo/${USER}/vsbg/src'

alias syncft='rsync -a -z -u -e "ssh -x" --exclude='/.git*' --exclude=/bin-sbc-sbg/ --exclude='/bazel-*' /repo/${USER}/vsbg/ vsbg-ft-host:/local/scratch/$USER/vsbg/'
alias putbeam='rsync -r --delete -e "ssh -x" /repo/home/${USER}/beam/ vsbg-ft-host:~/beam/'
