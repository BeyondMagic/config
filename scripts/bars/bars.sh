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
  emoji_font="NotoEmoji Nerd Font:size=10.3:antialias=true"                                 # 3


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







{ eval "_clock &"; eval "_sensors &"; eval "_music &"; } > "$location_of_top_fifo" &
  $origin/top_bar/_volume.sh > "$location_of_top_fifo" &

#echo "\n" > "$location_of_top_fifo"



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

    esac

    printf "%s%s%s\n" "$clock  %{F- B-}$sensors$music %{r}$volume"

  done < "$location_of_top_fifo" 
}








# Function of the bottom bar for Lemonbar
#   Modules are:

read_top_bar | lemonbar -p -g "${width_tbar}x${height_tbar}x${offset_ty}x${offset_tx}" -f "$normal_font" -f "$bold_font" -f "$emoji_font"
#cat "$location_of_bottom_fifo" | lemonbar -p -b -g 1440x19x0x0 -f "$normal_font" -f "$bold_font" -f "$emojifont" -f "$affixfont" # &








# Lemonbar exiting
#   It will look always for thetop bar, so if it dies
#   everything dies!
printf " - It seems that your top bar just died, oh no! We're exiting.\n"
killall lemonbar
pkill -KILL -f "sleep infinity"
pkill -KILL -f "_volume.sh"
rm -rf "$location_of_bottom_fifo" "$location_of_top_fifo"
exit 0
