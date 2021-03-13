#!/bin/sh
#
# Lemonbar with fifo
# Events as well
# Clickable bars
# Everything :)
#
# BeyondMagic © 2021

# Dependencies
#   tuxi     (https://github.com/Bugswriter/tuxi)
#   lemonbar (https://github.com/expectocode/bar)

# Initilization for future events
#   This will be used when an event is called
#   Instead of reloading the whole bar, just update what's necessary :)
#     tbar for top bar
#     bbar for bottom bar
  tbar=""
 btbar=""

# Config of Bars
#   Geometry
height_tbar="19"; width_tbar="1440"; offset_ty="0"; offset_tx="0"
height_bbar="19"; width_bbar="1440"; offset_by="0"; offset_bx="0"

# Constants of Fonts
#   Each font is beautifully chosen :)
normal_font="Noto Sans CJK JP DemiLight:antialias=true:size=10:weight=200" # 1
  bold_font="Noto Sans CJK JP Black:antialias=true:size=10:weight=900"     # 2
 emoji_font="NotoEmoji Nerd Font:antialias=true"                 # 3


# Constants of places
#   :)
location_of_bottom_fifo="$HOME/desktop/bottom.fifo"
   location_of_top_fifo="$HOME/desktop/top.fifo"


# Start basic config
origin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$origin/bars_colours.sh"




# Clean later processes
killall lemonbar
rm -rf "$location_of_bottom_fifo" "$location_of_top_fifo" 


# Start fifos
mkfifo "$location_of_bottom_fifo" "$location_of_top_fifo"
exec 3<> "$location_of_bottom_fifo"; exec 3<> "$location_of_top_fifo"







{

  _clock &
  _sensors &
  $origin/top_bar/_song.sh &
  $origin/top_bar/_gmail.sh &
  $origin/top_bar/_volume.sh &

} > "$location_of_top_fifo" &

read_top_bar() {
  while read -r line; do
    case $line in

      # Clock ( date )
      C*)
        clock="${line#?}";;

      # Sensors of CPU
      S*)
        sensors="${line#?}";;

      # Volume
      V*)
        volume="${line#?}";;

      # Music
      M*)
        music="${line#?}";;

      # Gmail
      G*)
        gmail="${line#?}";;

    esac

    printf "%s%s%s\n" "$clock  %{F- B-}$sensors$music%{r}$gmail$volume"

  done < "$location_of_top_fifo" 
}

# Function of the bottom bar for Lemonbar
#   Modules are:
read_bottom_bar() {
  while read -r line; do
    case $line in
    
      # Title of Current Window
      T*)
        title="${line#?}";;

      # Tags
      W*)
        tags="${line#?}";;

      # Layouts
      L*)
        layouts="${line#?}";;

    esac

    printf "%s%s%s\n" "$layouts%{T3}$tags%{T1 c}$title"

   done < "$location_of_bottom_fifo"  
}


{

  $origin/bottom_bar/_get_title.sh &
  $origin/bottom_bar/_tags_layout.sh &

} > "$location_of_bottom_fifo" &






   read_top_bar |    lemonbar -p -g "${width_tbar}x${height_tbar}x${offset_ty}x${offset_tx}" -f "$normal_font" -f "$bold_font" -f "$emoji_font:size=10.3" &
read_bottom_bar | lemonbar -b -p -g "${width_bbar}x${height_bbar}x${offset_by}x${offset_bx}" -o 0 -f "$normal_font" -o 0 -f "$bold_font" -o 2 -f "$emoji_font:size=11"






# Lemonbar exiting
#   It will look always for thetop bar, so if it dies
#   everything dies!
printf " - It seems that your top bar just died, oh no! We're exiting.\n"
killall lemonbar; pkill -KILL -f "_gmail.sh"; pkill -KILL -f "bars.sh"; pkill -KILL -f "sleep"; pkill -KILL -f "sleep"
rm -rf "$location_of_bottom_fifo" "$location_of_top_fifo"
exit 0
