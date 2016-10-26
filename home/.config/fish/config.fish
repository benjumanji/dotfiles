set fish_greeting
set -x PATH ~/bin $PATH
set -x EDITOR vim
set -x GPG_TTY (tty)
set -x LDAPTLS_CACERT /etc/ssl/certs/ca-certificates.crt

# make sure that gpg has has the right tty
gpg-connect-agent updatestartuptty /bye > /dev/null ^&1

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

# dem sweet manpage colors
set -xU LESS_TERMCAP_md (printf "\e[01;31m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
eval (python -m virtualfish)
