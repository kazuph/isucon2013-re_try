# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias bashrc="exec bash"
alias supervisorctl="sudo supervisorctl "
alias st="sudo supervisorctl status"
alias re="sudo supervisorctl restart isucon_ruby nginx"
alias rl="sudo supervisorctl reload all"
alias start="sudo supervisorctl start"
alias te="sudo isucon3 test --workload "
alias b1="sudo isucon3 benchmark --workload 1 --init /home/isucon/init.sh"
alias b2="sudo isucon3 benchmark --workload 2 --init /home/isucon/init.sh"
alias b3="sudo isucon3 benchmark --workload 3 --init /home/isucon/init.sh"
alias b4="sudo isucon3 benchmark --workload 4 --init /home/isucon/init.sh"
alias myre="sudo /etc/init.d/mysql restart"
alias mys="mysqladmin -uisucon status | grep "
alias myv="mysqladmin -uisucon variables | grep "
alias pt="pt-query-digest /tmp/mysql-slow.log --explain h=localhost,u=isucon --database=isucon | tee ptqd.log"

