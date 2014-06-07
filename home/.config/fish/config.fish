set fish_greeting
set -x PATH ~/.cabal/bin $PATH
set -x PATH ~/bin $PATH
set -x PATH ~/.gem/ruby/2.1.0/bin $PATH
set -x EDITOR vim
set -x GPG_TTY (tty)

function paci
    sudo pacman -S $argv
end

function pacs
    pacman -Ss $argv
end

function pacu
    sudo pacman -Syuu
end

if test -d ~/.dir_colors
    eval (dircolors -c ~/.dir_colors/dircolors.ansi-dark )
end

set -l base03  002b36
set -l base02  073642
set -l base01  586e75
set -l base00  657b83
set -l base0   839496
set -l base1   93a1a1
set -l base2   eee8d5
set -l base3   fdf6e3
set -l yellow  b58900
set -l orange  cb4b16
set -l red     dc322f
set -l magenta d33682
set -l violet  6c71c4
set -l blue    268bd2
set -l cyan    2aa198
set -l green   859900

set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

set -g fish_color_normal      $base0
set -g fish_color_command     $base0
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $blue
set -g fish_color_comment     $base01
set -g fish_color_match       $cyan
set -g fish_color_search_match "--background=$base02"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green

. "$HOME/.homesick/repos/homeshick/homeshick.fish"
. "$HOME/.config/fish/virtual.fish"
