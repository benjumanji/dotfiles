set fish_greeting
set -x PATH ~/bin $PATH
set -x EDITOR vim
set -x GPG_TTY (tty)

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
. "$HOME/.config/fish/virtual.fish"
