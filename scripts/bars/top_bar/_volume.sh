#!/usr/bin/env sh

left_icon=""; right_icon=""

icon="  "; affix=""; fg="#123456"; bg="#F3E7F7"; f_bg="#123456"
prefix="%{T3 B$bg F$fg}$icon%{F$bg B$f_bg}$affix%{T2 B- F-}"

percentages="$(pactl list sinks | grep "ボリューム" | head -n 1 | sed -r -e "s/\tボリューム: front-left: [0-9]* \/ +//" -e "s/ \/( | -)[0-9]*\.[0-9]* dB, *front-right: [0-9]*.{2} */ /" -e "s/ \/( | -)[0-9]*\.[0-9]* dB//" -e 's/%/%{F#6B7F93}%%%{F-}/g')" 

echo 'V' "$prefix%{B#123456} $left_icon $percentages $right_icon" "%{B- F-}"
