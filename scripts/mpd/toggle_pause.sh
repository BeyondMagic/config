#!/usr/bin/env sh

mpc toggle


_icon_music() {
  icon="$1"; bg_icon="$2"; fg_icon="$3"
  
  echo "%{T3 B#FFFFFF F#2b2b2b}%{F$fg_icon}$icon%{F#FFFFFF B#EFEFEF}%{T2}%{F#2b2b2b}"
}


_music() {
  icon_paused=""; icon_running=" "; dance="є(｡･◇･)э  "

  mmm="$(_icon_music "$icon_running" "#EFEFEF" "#F76DB6" )"

  song="$($HOME/github/scripts/mpd/mpd-status.sh "#F76DB6" "#0D2331")"

  ## test dance
  [ "$dance" = "є(｡･◇･)э  " ] && dance="є(･◇･｡)э  " || dance="є(｡･◇･)э  "

  [ "$song" = "| •́ ◇ •̀ |" ] && { mmm="$(_icon_music "${icon_running} " "#FFFFFF" "#0D2331" )"; dance=""; }

  echo 'M' "%{T1 O-4}$mmm $dance $song  %{B- F-}"

}

_music > "$HOME/desktop/top.fifo"
