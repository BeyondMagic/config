*2021 updated by BeyondMagic*

---

# Hello, my Gs

Polybar? Yabar? Nah, that's pure BLOAT. I'll help you to figure out how to make a very simple lemonbar for you to start adding your own modules/blocks or whatever s\*\*\* you call it!

Features of our very simple lemonbar:

- Shell script only
- Update module/block individually from command
- Individual interval for module/block
- Emojis
- Clickable module (left and right button of mouse)
- Display 

I wrote this because I spent weeks trying my best to make lemonbar complete functional with what I wanted, there was never a full lemonbar documentation for something like this or even smple tutorial, very sad, I know, so I hope this help whoever is writing for this pure hell bar.

---

#### Lectures to read before continue!

You **need** to read those to understand what you are going to do right now, so please, go on read each one!

- https://manpages.debian.org/buster/lemonbar/lemonbar.1.en.html
- https://github.com/LemonBoy/bar/issues/225

#### Pre-Instalation & Instalation

So, to start off, we need a lemonbar, but depending on who you are, you probably don't want pixelized text in your bar, instead, you want some zoomer thing like emojis and aliased text, whatever. So if you have already lemonbar installed in your PC, look at that shit to be sure that you have a version that support **fontconfig**, if you don't have one, you can install from either of those places:

- https://github.com/expectocode/bar.git (version that I use)
- https://github.com/drscream/lemonbar-xft (version that many people use)

As you may know, Lemonbar does support emojis (UTF-8), so you can put whatever text you want in there and have something like this:

![image](https://user-images.githubusercontent.com/51831435/110286333-82847080-7fc3-11eb-8652-2111cacd608a.png)

But for that, you'll need the fonts that support such things, I'd recommend using JoyPixels if you like the type of emojis that Google have, or NerdFonts if you want to colorize your emoji as well:

- https://www.nerdfonts.com/ or
- https://www.joypixels.com/

And a font that you like on your system :)

#### Post-installation

Let's test it quickly with the following command:
```
echo "love me :)" | lemonbar -p
```

If everything worked out, you will see `love me :)`in the top of your desktop.


Do you see that `-p` there? It will keep the bar alive after it received the **"love me :)"**, we are going to use it from now on.

Let's make more a few tests, but before it, let's see our fonts, if you installed everything, then you probably did run `fc-cache -fv` to load the cache of your fonts, now let's get the name of your fonts.
```
fc-lists
```
To grep the name of your font, use:
```
fc-list | grep A_WORD_OF_YOUR_FONT
```

