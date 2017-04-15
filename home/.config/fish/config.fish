set fish_greeting
set -x PATH ~/bin $PATH
set -x EDITOR vim
set -x GPG_TTY (tty)
set -x LDAPTLS_CACERT /etc/ssl/certs/ca-certificates.crt
set -x LEDGER_FILE ~/accounts/hledger/general.journal

# make sure that gpg has has the right tty
gpg-connect-agent updatestartuptty /bye > /dev/null ^&1

set fish_term24bit 1

# set pure_symbol_prompt "❯\033]0;"(pwd) "|" (history | head -n1)"\007"
set pure_color_blue (set_color "458588")
set pure_color_cyan (set_color "83a598")
set pure_color_gray (set_color "a89984")
set pure_color_green (set_color "689d6a")
set pure_color_normal (set_color "ebdbb2")
set pure_color_red (set_color "cc241d")
set pure_color_yellow (set_color "fabd2f")

# dem sweet manpage colors
set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
. "$HOME/.homesick/repos/homeshick/completions/homeshick.fish"
eval (python -m virtualfish auto_activation)
