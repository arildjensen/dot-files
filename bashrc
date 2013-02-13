# ~/.bashrc: executed by bash(1) for non-login shells.
GPG_TTY='tty'
EDITOR='vim'
TERM='xterm-color'
export GPG_TTY EDITOR TERM

alias ssh='ssh -A'
alias ls='ls --color=auto'

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$NORMAL[ $RED\u@\h$NORMAL ]# "
else
  PS1="$NORMAL[ $GREEN\u@\h$NORMAL]\$ "
fi
