#!/bin/bash
set -e

function LOG {
    echo $(date -R): $0: $*
}

mkdir -p $HOME/.config/pulse
rm -f $HOME/.config/pulse/*

LOG "Starting pulseaudio"
pulseaudio --log-level=1 #--log-target=stderr -v
