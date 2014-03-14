# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacs='pacman -Ss'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Syuu'

# eval `keychain --eval --quiet -Q ~/.ssh/id_ecdsa.lan ~/.ssh/id_rsa.bitbucket ~/.ssh/id_rsa.webservers`

eval `dircolors ~/.dir_colors/dircolors.ansi-dark`

source ~/.git-prompt.sh
PS1='\[\033[34m\]\u\[\033[33m\]@\[\033[34m\]\h \[\033[36m\]\W$(__git_ps1 " \[\033[33m\](\[\033[34m\]%s\[\033[33m\])") \[\033[33m\]⚁\[\033[0m\] '

PATH=$HOME/bin/google_appengine:$HOME/.gem/ruby/2.0.0/bin:$HOME/bin:$PATH

export PS1
export EDITOR=vim
export PATH
