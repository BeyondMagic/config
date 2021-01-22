#!/bin/sh
Cmus_remote=$(cmus-remote -Q)
Instance=$(echo -e "$Cmus_remote" | wc -l)
Shuffle="Shuffle On"
if [ $Instance = 1 ]; then
    terminal -e cmus &&
    sleep 2
    cmus-remote -p
else
    if [ $1 == "-S" ]; then
        if [ `echo "$Cmus_remote" | grep shuffle | cut -d ' ' -f 3` == true ]; then
            Shuffle="Shuffle Off"
        fi
        cmus-remote $1
        notify-send -t 800 $Shuffle
    elif [ $1 == "-Q" ]; then
        Cur_song=$(echo "$Cmus_remote" | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- )
        notify-send -i multimedia-volume-control -t 1800 "$Cur_song"
#        artist=$(echo -e "$Cur_song" | head -n 2 | tail -n 1)
#        title=$(echo -e "$Cur_song" | head -n 1 )
#        cmus-updatepidgin artist "$artist" title "$title"
    else
        cmus-remote $1
        Cur_song=$(cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- )
        notify-send -i multimedia-volume-control -t 1800 "$Cur_song"
    fi
fi
