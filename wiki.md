+ xdo
+ xdotool
+ exa
+ slop
+ lemonbar (special fonts support)
+ nnn
+ sxiv
+ feh
+ dunst
+ picom
+ coreutils
+ ncmpcpp
+ mpd
+ mpdscribble
+ glib2
+ lib32-glib2
+ gcr
+ fcitx5
+ fcitx5-configtool
+ fcitx5-gtk
+ fcitx5-material-color
+ fcitx5-qt
+ fcitx5-mozc


---

+ Fira Code
+ Noto Sans CJK


### Post-Installation Artix

Swap Memory:

---

Auto-login:

Using openrc its simple (should be similar for runit). Each virtual
console has its own config `/etc/runit/sv/agetty-ttyX/conf`, where **X** is **1 to 5**.
Chose one (or create another one, at least 1-9 should be no problem) and
add `--autologin USERNAME` to the config string. This will make agetty to
autologin **USERNAME** on virtual console X.

Now, open `~/.zshrc` and add after the shebang (remember to replace
X in ttyX):

```zsh
[ $(tty) = "/dev/ttyX" ] && exec startx
```

this will start X when logged in on console X.

### Firefox

about:config

```
config.trim_on_minimize = true
browser.download.dir = /home/magic/downloads
browser.download.lastDir = /home/magic/img

```


