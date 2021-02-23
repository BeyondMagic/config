#!/bin/bash
# by BeyondMagic 16/02/21
# Genmon script to show output of a tuxi question

TUXIPATH=/home/koetemagie/.local/bin
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
$TUXIPATH/tuxi -r "$(echo ":" | dmenu -p 'tuxi ')" > $SCRIPTPATH/lecture.tuxi

