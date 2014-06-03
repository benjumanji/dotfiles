#!/bin/bash

./.screenlayout/default.sh &
xrdb ~/.Xresources &
feh --bg-fill ~/Pictures/white-and-grey.jpg &
/usr/bin/start-pulseaudio-x11 &
gpg-agent --daemon --enable-ssh-support \
                   --write-env-file "$HOME/.gpg-agent-info"
