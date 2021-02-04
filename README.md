<div align="center"><img src="prev.png"></img></div>

<h1 align="center">config</h1>
<p align="center">Personal configuration for my desktop, it surely changed a lot, but I always loved the static WM that I use and always used since my first install of Linux. A little bit of pre information, this desktop is meant to be very, very lightweight since it was made in a 2006 computer (with no upgrades); the ricing yet is beautiful.</p>

<p align="center">It is entirely made upon *xfce4*, 'why?', well, it is not every day that you see a *xfce4* complete ricing, right? So I had to build one.</p>

<p align="center">Manjaro 20.2 Nibia</p>

---

## Apps :?

**Base**

- **WM** : [xfwm4](https://www.xfce.org/)
- **DM** : [xfce4](https://www.xfce.org/)
- **Shell** : [zsh](https://ohmyz.sh/) ([oh my zsh](https://github.com/ohmyzsh/ohmyzsh))
- **Terminal** : [xfce4-terminal](https://gitlab.xfce.org/apps/xfce4-terminal)
- **Panel** : [xfce4-panel]([xfce4](https://www.xfce.org/) (yes, it is)
- **Text Editor** : [neovim](https://neovim.io/)
- **File Manager** : [n³](https://github.com/jarun/nnn/) & [thunar](https://www.xfce.org/)
- **Application Launcher** : [rofi](https://github.com/davatorium/rofi)
- **Image Editor** : [Gimp](https://www.gimp.org/)
- **Video Player** : [mpv](https://mpv.io/) (faster than vlc)
- **Music Player** : [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)
- **PDF Viewer** : [zathura](https://pwmt.org/projects/zathura/)
- **Image viewer** : [sxiv](https://github.com/muennich/sxiv)
- **Browser** : [Firefox-Developer-Edition](https://www.mozilla.org/en-US/firefox/developer/)
---

**Additional**

- **Mathematic Solver** : [sagemath](https://www.sagemath.org/)
- **Torrents :)** : [qBitTorrent](https://www.qbittorrent.org/)
- **Messenger** : [Telegram](https://telegram.org/)
- **Google Drive Manager** : [gcsf](https://github.com/harababurel/gcsf)
- **A wonderful game** : [etterna-git](https://etternaonline.com/)
- **To-do list** : [todoncli](https://github.com/murilo-arruda/todo-list-node-cli/)
- **Extra configuration** : [LightDM GTK+ Greeter](https://github.com/Xubuntu/lightdm-gtk-greeter)

---

## Configuration of programs

**Firefox-Developer-Edition**
  - **Extensions** :
  - [Mind the Time](https://addons.mozilla.org/en-US/firefox/addon/mind-the-time/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) - See how much time you waste your time on.
  - [Search by Image](https://addons.mozilla.org/en-US/firefox/addon/search_by_image/) - ?
  - [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/) - Apply CSS to any site.
  - [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) - Ads blocker
  - [Web Scrobbler](https://addons.mozilla.org/en-US/firefox/addon/web-scrobbler/) - LastFM scrobbler
  - **Theme** :
  - [Space](https://addons.mozilla.org/en-US/firefox/addon/nicothin-space/?utm_content=addons-manager-reviews-link&utm_medium=firefox-browser&utm_source=firefox-browser)
  - Not **gtk.css** yet :(

**n³**
  - **Theme** :
  - [0moonlight](https://github.com/BeyondMagic/nnn-themes)


**fce4-terminal**
  - **General** :
  - [**terminalrc**](apps/xfce4-terminal/terminalrc) - ~/.config/xfce4-terminal/
  - **Colours** :
  - #120D1E, #665757, #CB7872, #C9704C, #9DB995, #9EB247, #E6BB7A, #3F4673, #090416, #A3D5EC, #C5B8AA, #A37A28, #BFCEE2, #BFCEE2, #C693DD, #C693DD
  - **Fonts** :
  - [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

**zathura**
  - **Theme** :
  - [base16 dark](https://github.com/BeyondMagic/zathura-themes)

**neovim**
  - [vimrc](apps/nvim/init.vim)
  - **Additional** :
  - [Plug](https://github.com/junegunn/vim-plug)
  - [vim-vue](https://github.com/posva/vim-vue)

**Kvantum Manager**
  - **Theme** :
  - [Moe](https://store.kde.org/p/1337441/)

**Firefox Developer Edition**
  - **Theme** :
  - [MaterialFox](https://github.com/muckSponge/MaterialFox)



**xfwm4-tweaks**
  - **Cycling** :
  - Include hidden, Draw frame around selected, Raise windows while cycling
  - **Focus** :
  - Honor standard ICCCM focus hint, Swtich to window's workspace
  - **Accessibility** :
  - Shift, Raise Windows when any mouse button is pressed
  - Automatically tile windows when moving towards the screen edge
  - Notify of urgency by making window's decoration blink
  - Keep urgent windows blinking repeatedly
  - **Workspaces** :
  - Remember and recall previous workspace
  - Wrap workspaces depending on the actual desktop layout
  - Wrap workspaces when the first or the last workspace is reached
  - **Placement** :
  - Center
  - **Compositor** :
  - Enable everything

**xfwm4**
  - **Theme** :
  - [2bxfwm-Rello](https://store.kde.org/p/1337441/)
  - **Focus** :
  - Click to focus, Automatically give focus to newly created windows
  - Automatically raise windows when they receive focus
  - Raise windows when clicking inside application window
  - **Advanced** :
  - To screen borders

## Tweaks - ADD

- **unclutter --timeout 1** : Hides mouse after 1 second.
- **pixelfun3** : Mouse cursor (wish there was one left-handed)
- **Noto Sans Regular** : Main font
- **Noto Sans Mono Regular** : Main mono font (not terminal's)
- **candy-icons** : Icons of application/system
- **nttcp** : Theme of the system


## Xfce4-panel

<p align="center">The panel is definitely the hardest part of this setup, not to set up on your computer, but to made it. Xfce4-panel is very limited and was never meant to ricing, so it's pure try and error every time you want to add something cool. And all of that was even using the debugger.</p>

<p align="center">To start, quit your xfce4-panel with <strong>xfce4-panel -q</strong>, and then start it with <strong>GTK_DEBUG=interactive xfce4-panel</strong> in your terminal, it will open a new window. Copy the icons folder of <a href="/theme/icons">icons</a> into <strong>~/.config/gtk-3.0/<strong> go to Styles/CSS and paste the <a href="theme/gtk.css"><strong>gtk.css</strong></a> because you'll need to start editing it in order to see it working fine in your panels.</p>

<p align="center">The scripts of **generic monitors** are <a href="config/scripts">here</a>.</p>

<p align="center">The rest is with you... :)</p>
