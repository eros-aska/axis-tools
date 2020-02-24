alias hosts='cat ~/.ssh/config; echo'
alias showbeam='ls -l ~/beam/'

alias rootlogin='func() { sshpass -p rootroot ssh -o strictHostKeyChecking=no root@$1; }; func'

alias cleanlogs='rm -rf /tmp/mylogdir/* ; ls -l /tmp/mylogdir/'
