#!/bin/bash

./.screenlayout/default.sh &
xrdb ~/.Xresources &
feh --bg-fill ~/Pictures/white-and-grey.jpg &
/usr/bin/start-pulseaudio-x11 &
gpg-agent --daemon --enable-ssh-support \
                   --write-env-file "$HOME/.gpg-agent-info"

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
