#!/usr/bin/env sh
#
# Description
#   Execute magic's desktop :)
#
# Executed by startx (run your window manager from here)

#--------------------------------------------------------------------------------
# Environment Variables
#---------------------------------------------------------------------------------

export NO_AT_BRIDGE=1
export XMODIFIERS="@im=fcitx5"
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export ZDOTDIR=$HOME/.config/zsh/
export LESSHISTFILE=/dev/null
export XDG_CONFIG_HOME=$HOME/.config/
export XMODIFIERS="@im=fcitx5"
export EDITOR=nvim VISUAL=nvim
export BROWSER='firefox'
export READER='zathura'
export FILE='nnn'
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export ZDOTDIR="$HOME/.config/zsh"
export LESSHISTFILE=/dev/null
export XDG_CONFIG_HOME="$HOME/.config/"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/github/scripts/root:$HOME/github/scripts/screenshot:$HOME/github/scripts/colour:$HOME/github/scripts/quotes:$PATH"


#--------------------------------------------------------------------------------
# Start shit
#--------------------------------------------------------------------------------

#   Choose wallpaper with FEH
feh --no-fehbg --bg-scale "$HOME/img/wallpapers/$(ls $HOME/img/wallpapers | shuf -n 1)" &

#   Start xbindkeys for keybinds
xbindkeys -f "$HOME/desktop/xbindkeysrc" &
c

#   Start MPD and MPD Scrible to Lastfm and Music
mpd "$HOME/.config/mpd/mpd.conf" &
mpdscribble --conf "$HOME/.config/mpdscribble/mpdscribble.conf" &

#   Picom as compositor
picom &

#   Japanese Keyboard
fcitx5 &

#   Start Pulseaudio for sound
pulseaudio &

#   Start unclutter to make mouse disappear after one second
unclutter --timeout 1 &

#   Start Lemonbar (bottom and top bars)
$HOME/github/scripts/bars/start_bars &

#   Set Keyboard to Portuguese ABNT 2
setxkbmap -model abnt2 -layout br -variant abnt2 &

#   Set Keyboard speed typing
xset r rate 170 60 & 

#   Set Mouse speed
xinput --set-prop 8 277 0.5 &

#   Set Left Handed Mouse
xmodmap -e 'pointer = 3 2 1' &

#   Remove shit
rm -rf "$HOME/.zlogin" "$HOME/.xsession-errors" "$HOME/.xsession" "$HOME/.lyrics" &

#   Lock screen because yes
eval "sleep 3; lock" & 

#   Lock after 8 minutes of inactivity
xautolock -time 8 -locker "lock" &

#   Sleep after 12 minutes of inactivity
xautolock -time 5 -locker "lock" &
xautolock -time 7 -locker "zzz" &

#   Reset xbindkeys ??? a few keybinds only work with this
killall xbindkeys; xbindkeys -f "$HOME/desktop/xbindkeysrc"

#   Start Window Manager
exec dwm
