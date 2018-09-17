[ -z "$PS1" ] && return
PS1="\[\e[0;36m\]\[\e[1;33m\]>>>>\[\e[0m\] "

source .bashrc-sources/exportsrc
source .bashrc-sources/basic

# source all my other shortcuts
source .bashrc-sources/python
source .bashrc-sources/docker
source .bashrc-sources/git
source .bashrc-sources/misc
#source .bashrc-sources/vim
source .bashrc-sources/perforce

details

cd $(cat ~/.bash-last-dir)
echo "Starting in:" $(pwd)
