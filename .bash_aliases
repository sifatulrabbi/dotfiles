#!/bin/bash

alias ll="ls -alF"
alias la="ls -Alh"
alias l="ls -CF"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls="ls --color=auto"
	alias dir="dir --color=auto"
	alias vdir="vdir --color=auto"
	alias grep="grep --color=auto"
	alias fgrep="fgrep --color=auto"
	alias egrep="egrep --color=auto"
fi

alias sosh="source ~/.bashrc"
alias hibernate="systemctl hibernate"
alias suspend="systemctl suspend"
alias rm-x-file="find . -type f -exec chmod 644 {} \;"
alias rm-x-dir="find . -type d -exec chmod 755 {} \;"

alias sequesto_run_dockers="docker start sequesto-elasticmq sequesto-documentserver kibana882 es882"
alias sequesto_stop_dockers="docker stop sequesto-elasticmq sequesto-documentserver kibana882 es882"

alias makepyenv="python3 -m venv ./.venv"
alias usepyenv="source .venv/bin/activate"
