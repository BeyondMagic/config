_icon_music() {
  icon="$1"; bg_icon="$2"; fg_icon="$3"
  
  echo "%{T3 B#FFFFFF F#2b2b2b}%{F$fg_icon}$icon%{F#FFFFFF B#EFEFEF}%{T2}%{F#2b2b2b}"
}



_music() {
  icon_paused=""; icon_running=" "; dance="(｡･◇･)э  "

  while :; do
    mmm="$(_icon_music "$icon_running" "#EFEFEF" "#F76DB6" )"

    song="$($HOME/github/scripts/mpd/mpd-status.sh "#F76DB6" "#0D2331")"

    ## test dance
      [ "$dance" = "(｡･◇･)э  " ] && dance="є(･◇･｡)  " || dance="(｡･◇･)э  "

      [ "$song" = "| •́ ◇ •̀ |" ] && {
        mmm="$(_icon_music "${icon_paused} " "#FFFFFF" "#0D2331" )"
        echo 'M' "%{T1 O-4}$mmm %{F#0D2331} $song  %{B- F-}"
        exit
      }

      echo 'M' "%{T1 O-4}$mmm %{F#F76DB6}$dance $song  %{B- F-}"   

    sleep 2
  done
}

_music
