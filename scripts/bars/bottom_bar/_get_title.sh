#!/usr/bin/env sh
#
#   Get the title of the active windows
#   You can set an icon for specific programs that you
#   Often use :)
#
# BeyondMagic © 2021

  affix=""
name_fg="#FFFFFF"; name_bg="#1D1D1D"
icon_fg="#FF5EA4"

# Format a Process name based on ID
#   Note: it's ID, not PID
format_active_window() {

        icon=""
  process_id="$1"

       total=$(xprop -id $process_id | grep "_NET_WM_NAME" | sed -r -e 's/(_NET_WM_NAME\(UTF8_STRING\) = ")|"$//g')
        name=$(cat /proc/$(xdotool getwindowpid $process_id)/comm)
  

  # st
       [ "$name" = "st" ] && {

    icon=""
    title_program="$(sed -r 's/ .*//' <<< "$total")"
    total="$(sed -r 's/\w* //' <<< "$total")"
    
    [ "$title_program" = "nvim" ] && icon=""
    [ "$title_program" = "mpd" ] && { icon="ﯢ"; total="$(sed -r "s/» *//g" <<< "$total")"; }
    [ "$title_program" = "n" ] && icon=""

  # Firefox-Developer-Edition
  }; [ "$name" = "firefox" ] && {

    icon=""
    total="$(sed -r 's/(\[Sidebery\] )|( — Firefox.*)//g' <<< "$total")"

  # gcolor2
  }; [ "$name" = "gcolor2" ] && {
    
    icon=""

  }

    # Reduce length if it's bigger than 25 characters
  [ "${#total}" -gt "25" ] && total="$(cut -c -25 <<< $total)..."
    # If there's no icon, then just prints out the name
  [ ! -n "$icon" ] && icon="$name" || icon="%{T3}$icon"

  echo 'T' "%{B$name_bg F$icon_fg}  $icon %{T2 F$name_fg}$total  %{T1 B- F-}"

}

get_active_window() {

  format_active_window "$(xdotool getwindowfocus)"

  dwm-msg --ignore-reply subscribe focused_title_change_event client_focus_change_event |
    grep --line-buffered -oP '((?<=new_win_id": ).*)|((?<=client_window_id": )\d*)' |
    while IFS=$'\n' read -r winid; do
      [ $winid = "null" ] && {

        echo 'T'

      } || {

        format_active_window "$winid"

      }
    done

}

get_active_window
