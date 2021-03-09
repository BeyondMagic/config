#!/usr/bin/env sh

pactl -- set-sink-volume @DEFAULT_SINK@ +1%
$HOME/github/scripts/bars/top_bar/_volume.sh > $HOME/desktop/top.fifo
