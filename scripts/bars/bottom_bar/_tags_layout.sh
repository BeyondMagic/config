#!/usr/bin/env sh
#
# Get tags of wm
#
# Dependencies
#   dwm
#   dwm-msg
#
# BeyondMagic © 2021

bg_tags="#FFFFFF"

         icon_selected=""
icon_selected_occupied=""
         icon_unselect=""
icon_unselect_occupied=""

         fg_selected="#3C48FF";          fg_unselect="#393939"
fg_selected_occupied="#349AFF"; fg_unselect_occupied="#C92A61"

layout_fg="#FFFFFF"; layout_bg="#3C48FF"

affix=""

_get_tags() {

  dwm-msg --ignore-reply subscribe tag_change_event |
  jq --unbuffered '.tag_change_event.new_state | .selected, .occupied' |
  while IFS=$'\n' read -r selected && read -r occupied; do

    out=""

    tag=0; while [ $tag -le 8 ]; do

      bit=$((1 << $tag))

      # selected and have windows on it
      if [[ $(($selected & $bit)) -ne 0 && $(($occupied & $bit)) -ne 0 ]]; then
        out="${out}%{F$fg_selected_occupied} $icon_selected_occupied"

      # selected
      elif [[ $(($selected & $bit)) -ne 0 ]]; then
        out="${out}%{F$fg_selected} $icon_selected"

      # have windows on it
      elif [[ $(($occupied & $bit)) -ne 0 ]]; then
        out="${out}%{F$fg_unselect} $icon_unselect"

      # nothing
      else
        out="${out}%{F$fg_unselect} $icon_unselect_occupied"
      fi

    tag=$((tag+1)); done

    echo 'W' "%{T3 B$bg_tags}$out  %{F- B-}"
    
  done
}

_get_layout() {

  dwm-msg --ignore-reply subscribe layout_change_event | grep --line-buffered -oP '(?<=new_symbol": ").*' | sed -u 's/",$//' |
  while IFS=$'\n' read -r tagid; do

    echo 'L' "%{O-3 B$layout_bg F$layout_fg T1} $tagid %{F$bg_tags B$layout_bg}$affix%{B$bg_tags F-}"

  done

}

_get_tags & _get_layout
