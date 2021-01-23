<div align="center">![Preview](/forlight/preview.png)</div>


# config
<p align="center">Personal configuration for my desktop, it surely changed a lot, but I always loved the static WM that I use and always used since my first install of Linux. A little bit of pre information, this desktop is meant to be very, very lightweight since it was made in a 2006 computer (with no upgrades); the ricing yet is beautiful.</p>

<p align="center">It is entirely made upon *xfce4*, 'why?', well, it is not every day that you see a *xfce4* complete ricing, right? So I had to build one.</p>

<p align="center">Manjaro 20.2 Nibia</p>

## Apps :?

---

**Base**

- **WM** : xfwm4
- **DM** : xfce4
- **Thell** : zsh (oh my zsh)
- **Terminal** : xfce4-terminal
- **Panel** : xfce4-panel (yes, it is)
- **Text Editor** : neovim
- **File Manager** : n³ & thunar
- **Application Launcher** : rofi
- **Image Editor** : Gimp
- **Video Player** : mpv (faster than vlc)
- **Music Player** : cmus & lollypop
- **PDF Viewer** : zathura
- **Image viewer** : sxiv

---

**Additional**

- **Mathematic Solver** : sagemath
- **Torrents :)** : qBitTorrent
- **Messenger** : Telegram
- **Google Drive Manager** : gcsf
- **A wonderful game** : etterna-git
- **To-do list** : todoncli
- **Extra configuration** : LightDM GTK+ Greeter

## Config

<details open>
  <summary><strong>Firefox-Developer-Edition</strong></summary>
  **Extensions** :
  - [Mind the Time](https://addons.mozilla.org/en-US/firefox/addon/mind-the-time/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search) - See how much time you waste your time on.
  - [Search by Image](https://addons.mozilla.org/en-US/firefox/addon/search_by_image/) - ?
  - [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/) - Apply CSS to any site.
  - [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) - Ads blocker
  - [Web Scrobbler](https://addons.mozilla.org/en-US/firefox/addon/web-scrobbler/) - LastFM scrobbler
  **Theme** :
  - [Space](https://addons.mozilla.org/en-US/firefox/addon/nicothin-space/?utm_content=addons-manager-reviews-link&utm_medium=firefox-browser&utm_source=firefox-browser)
  - Not **gtk.css** yet :(
</details>

<details open>
  <summary><strong>n³</strong></summary>
  **Theme** :
  - [0moonlight](https://github.com/BeyondMagic/nnn-themes)
</details>

<details open>
  <summary><strong>xfce4-terminal</strong></summary>
  **General** :
  - [**terminalrc**](apps/xfce4-terminal/terminalrc) - ~/.config/xfce4-terminal/
  **Colours** :
  - #120D1E, #665757, #CB7872, #C9704C, #9DB995, #9EB247, #E6BB7A, #3F4673, #090416, #A3D5EC, #C5B8AA, #A37A28, #BFCEE2, #BFCEE2, #C693DD, #C693DD
  **Fonts** :
  - [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
</details>

<details open>
  <summary><strong>zathura</strong></summary>
  **Theme** :
  - [base16 dark](https://github.com/BeyondMagic/zathura-themes)
</details>

<details open>
  <summary><strong>neovim</strong></summary>
  - [vimrc](apps/nvim/init.vim)
  **Additional** :
  - [Plug](https://github.com/junegunn/vim-plug)
  - [vim-vue](https://github.com/posva/vim-vue)
</details>

<details open>
  <summary><strong>Kvantum Manager</strong></summary>
  **Theme** :
  - [Moe](https://store.kde.org/p/1337441/)
</details>


<details open>
  <summary><strong>xfwm4-tweaks</strong></summary>
  **Cycling** :
  - Include hidden, Draw frame around selected, Raise windows while cycling
  **Focus** :
  - Honor standard ICCCM focus hint, Swtich to window's workspace
  **Accessibility** :
  - Shift, Raise Windows when any mouse button is pressed
  - Automatically tile windows when moving towards the screen edge
  - Notify of urgency by making window's decoration blink
  - Keep urgent windows blinking repeatedly
  **Workspaces** :
  - Remember and recall previous workspace
  - Wrap workspaces depending on the actual desktop layout
  - Wrap workspaces when the first or the last workspace is reached
  **Placement** :
  - Center
  **Compositor** :
  - Enable everything
</details>

<details open>
  <summary><strong>xfwm4</strong></summary>
  **Theme** :
  - [2bxfwm-Rello](https://store.kde.org/p/1337441/)
  **Focus** :
  - Click to focus, Automatically give focus to newly created windows
  - Automatically raise windows when they receive focus
  - Raise windows when clicking inside application window
  **Advanced** :
  - To screen borders
</details>

<details open>
  <summary><strong>cmus</strong></summary>
  - [cmus-status-line](https://github.com/Noah2610/cmus-status-line) - [config](apps/cmus-status-line/config.toml)
  - [https://github.com/dcx86r/cmus-notify](https://github.com/dcx86r/cmus-notify)
  - [cmusfm](https://github.com/Arkq/cmusfm)
</details>


## Tweaks - ADD

- **unclutter --timeout 1** : Hides mouse after 1 second.
- **pixelfun3** : Mouse cursor (wish there was one left-handed)
- **Noto Sans Regular** : Main font
- **Noto Sans Mono Regular** : Main mono font (not terminal's)
- **candy-icons** : Icons of application/system
- **Materia-Blackout** : Theme of the system


## Xfce4-panel

<p align="center">The panel is definitely the hardest part of this setup, not to set up on your computer, but to made it. Xfce4-panel is very limited and was never meant to ricing, so it's pure try and error every time you want to add something cool. And all of that was even using the debugger.</p>

<p align="center">To start, quit your xfce4-panel with ``xfce4-panel -q``, and then start it with ``GTK_DEBUG=interactive xfce4-panel`` in your terminal, it will open a new window. Copy the icons folder of [icons](theme/icons) into **~/.config/gtk-3.0/** go to Styles/CSS and paste the [**gtk.css**](theme/gtk.css) because you'll need to start editing it in order to see it working fine in your panels.</p>

<p align="center">The scripts of **generic monitors** are [here](config/scripts).</p>

<p align="center">The rest is with you... :)</p>
