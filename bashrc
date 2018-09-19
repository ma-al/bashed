[ -z "$PS1" ] && return
PS1="\[\e[0;36m\]\[\e[1;33m\]>>>>\[\e[0m\] "

cd $HOME
source bashed/exportsrc
source bashed/basic

# source all my other shortcuts
source bashed/python
source bashed/docker
source bashed/git
source bashed/misc
#source .bashrc/vim
source bashed/perforce

details

cd $(cat ~/.bash-last-dir)
echo "Starting in:" $(pwd)
