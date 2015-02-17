# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If interactive, run fish 
#[[ $- == *i* && -x $(which fish) ]] && fish --login

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/ben/.gvm/bin/gvm-init.sh" ]] && source "/home/ben/.gvm/bin/gvm-init.sh"

# added by travis gem
[ -f /home/ben/.travis/travis.sh ] && source /home/ben/.travis/travis.sh

alias arch=`uname -m`

export JAVA_HOME=/opt/java
