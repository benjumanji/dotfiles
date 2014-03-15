# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If interactive, run fish 
[[ $- == *i* && -x $(which fish) ]] && fish --login
