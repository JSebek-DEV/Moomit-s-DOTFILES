#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[0;34m\] \[\e[0;34m\]\u \[\e[0;33m\]\w\[\e[0m\]: '
command_not_found_handle() {
    echo -e "\e[31mCommand not found: $1\e[0m"
}