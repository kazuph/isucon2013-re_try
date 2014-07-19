# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias st="sudo supervisorctl status"
alias re="sudo supervisorctl restart isucon_ruby"
alias te="sudo isucon3 test --workload 1"
alias b1="sudo isucon3 benchmark --workload 1"
alias b2="sudo isucon3 benchmark --workload 2"
alias b3="sudo isucon3 benchmark --workload 3"
alias b4="sudo isucon3 benchmark --workload 4"
alias myre="sudo /etc/init.d/mysql restart"
alias myad="mysqladmin -uisucon variables | grep "

