#!/usr/bin/env sh
# 
# Lemonbar Configuration
# with Fifos for the script
#
# BeyondMagic © 2021


# Function of the top bar for Lemonnbar
#   Modules are:
#     Date - CPU% - Song (bar) - Title of Active Window - Gmail Notifications

# %{T1} : normal font
# %{T2} : normal font bold
# ${T3} : emoji font


# set icon to right
_icon_right() {
  icon="$1"; affix="$2"; fg="$3"; bg="$4"; f_bg="$5"

  echo "%{T3 B$bg F$fg}$icon%{F$bg B$f_bg}$affix%{T2 B- O-0}"
}

_icon_sensors() {
  icon="$1"; bg_icon="$2"; fg_icon="$3"
  
  echo "%{T3 B$bg_icon F#FFFFFF}%{F$fg_icon}$icon%{F$bg_icon B#2B2B2B}%{T2}%{F$bg_icon B#2B2B2B}"
}

_clock() {

  icon=" 神"
  affix=""
  fg="#123456"; bg="#ECF3FA"; f_bg="#ffffff"

  prefix="%{O-3}$(_icon_right "$icon" "$affix" "$fg" "$bg" "$f_bg")"

  while :; do

    echo 'C' "$prefix%{B#ffffff F#123456}$(date | sed -r -e 's/ -03//' -e 's/:/%{F#BDCDD7}:%{F#123456}/g')"
    sleep 1

  done

}



_sensors() {
  while :; do

    sss="$(sensors | grep Temperature | sed -r -e 's/CPU Temperature: *\+//' -e 's/\.0°C//' -e 's/  \(high.*//')"

    mmm=""

    #  0 < sss < 50
                             [ "$sss" -lt "52" ] && mmm="$(_icon_sensors " " "#BDCDD7" "#0D2331" ) $sss"

    # 50 < sss < 67
      [ "$sss" -gt "51" ] && [ "$sss" -lt "68" ] && mmm="$(_icon_sensors " " "#87C7E4" "#0D2331" ) $sss"

    # 67 < sss < 77
      [ "$sss" -gt "67" ] && [ "$sss" -lt "77" ] && mmm="$(_icon_sensors " " "#FAFBC2" "#340010" ) $sss"

    # 77 < sss < 95
      [ "$sss" -gt "76" ] && [ "$sss" -lt "95" ] && mmm="$(_icon_sensors " " "#FF4464" "#0D2331" ) $sss"



      echo 'S' "%{T1 O-4}$mmm ºC  %{B- F-}"

    sleep 5
  done
}


# Function of the bottom bar for Lemonbar
#   Modules are
#     Tags name - Next Task - Volume - ...

