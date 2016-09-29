set fish_greeting
set -x PATH ~/bin $PATH
set -x EDITOR vim
set -x GPG_TTY (tty)

set fish_term24bit 1

set fish_color_normal      eeeeee
set fish_color_command     73cef4
set fish_color_quote       d3b987
set fish_color_param       b3deef
set fish_color_error       c5152f
set fish_color_escape      715b2f
set fish_color_redirection bbbbbb
set fish_color_end         bbbbbb
set fish_auto_suggestion   666666

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
eval (python -m virtualfish)
