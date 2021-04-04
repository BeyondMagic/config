CURSORDIR=$(HOME)/.icons/yellowdotlefthanded/cursors
BUILDDIR=../cursors

#Define here the animation cursor directories
ANIMATED_CURSORS:= watch fd_double_arrow bd_double_arrow xterm left_ptr_watch



########################################################################

#Find list of cursors
conffiles = $(wildcard *.conf)
cursorfiles:= $(foreach conffile,$(conffiles),$(BUILDDIR)/$(subst ./,,$(subst .conf,,$(conffile))))
cursornames:= $(foreach conffile,$(conffiles),$(subst ./,,$(subst .conf,,$(conffile))))
animcursorfiles:=$(foreach animationfile,$(ANIMATED_CURSORS),$(BUILDDIR)/$(animationfile))
animcursornames:=$(ANIMATED_CURSORS)



CURSORS = $(cursorfiles)
CURSORNAMES= $(cursornames)
ANIMATIONS= $(animcursorfiles)
ANIMATIONNAMES=$(animcursornames)




.PHONY: all


all: $(CURSORS) $(ANIMATIONS)

install: all
	#Create necessary directories

	if test ! -d $(HOME)/.icons ;then mkdir $(HOME)/.icons; fi
	if test ! -d $(HOME)/.icons/yellowdotlefthanded ;then mkdir $(HOME)/.icons/yellowdotlefthanded; fi
	if test ! -d $(HOME)/.icons/yellowdotlefthanded/cursors ;then mkdir $(HOME)/.icons/yellowdotlefthanded/cursors; fi
	#Copy the cursors

	cp -Rf $(BUILDDIR)/* $(CURSORDIR)

	#Create some symlinks
	ln -sf $(CURSORDIR)/hand $(CURSORDIR)/hand1
	ln -sf $(CURSORDIR)/hand $(CURSORDIR)/hand2


	#QT symlinks mess :-(

	ln -sf $(CURSORDIR)/v_double_arrow	$(CURSORDIR)/00008160000006810000408080010102 #v_double_arrow
	ln -sf $(CURSORDIR)/h_double_arrow	$(CURSORDIR)/028006030e0e7ebffc7f7070c0600140 #h_double_arrow
	ln -sf $(CURSORDIR)/fd_double_arrow	$(CURSORDIR)/fcf1c3c7cd4491d801f1e1c78f100000 #fd_double_arrow
	ln -sf $(CURSORDIR)/bd_double_arrow	$(CURSORDIR)/c7088f0f3e6c8088236ef8e1e3e70000 #bd_double_arrow
	ln -sf $(CURSORDIR)/sb_h_double_arrow   $(CURSORDIR)/14fef782d02440884392942c11205230 #sb_h_double_arrow 
	ln -sf $(CURSORDIR)/sb_v_double_arrow   $(CURSORDIR)/2870a09082c103050810ffdffffe0204 #sb_v_double_arrow 



	ln -sf $(CURSORDIR)/hand1 $(CURSORDIR)/9d800788f1b08800ae810202380a0822 #hand1
	ln -sf $(CURSORDIR)/hand2 $(CURSORDIR)/e29285e634086352946a0e7090d73106 #hand2
	ln -sf $(CURSORDIR)/crossed_circle $(CURSORDIR)/03b6e0fcb3499374a867c041f52298f0 #crossed_circle (dnd forbidden)
	ln -sf $(CURSORDIR)/move $(CURSORDIR)/4498f0e0c1937ffe01fd06f973665830 #left_ptr (move_cursor)
	ln -sf $(CURSORDIR)/copy $(CURSORDIR)/6407b0e94181790501fd1e167b474872 #copy
	ln -sf $(CURSORDIR)/link $(CURSORDIR)/640fb0e74195791501fd1ed57b41487f # link 

	ln -sf $(CURSORDIR)/left_ptr_watch $(CURSORDIR)/3ecb610c1bf2410f44200f48c40d3599 # left_ptr_watch
	ln -sf $(CURSORDIR)/question_arrow $(CURSORDIR)/d9ce0ab605698f320427677b458ad60b # question_arrow

	#Other apps' symlinks
	ln -sf $(CURSORDIR)/left_ptr_watch $(CURSORDIR)/08e8e1c95fe2fc01f976f1e063a24ccd #mozilla's left_ptr_watch

#Normal Cursors
define CURSOR_template
$(BUILDDIR)/$(1): $(1).png $(1).conf
	xcursorgen $(1).conf $(BUILDDIR)/$(1)
endef

$(foreach cursor,$(CURSORNAMES),$(eval $(call CURSOR_template,$(cursor))))


#Animated Cursors
define ANIMCURSOR_template
$(BUILDDIR)/$(1):  $(1)/$(1).conf $(1)/*.png
	xcursorgen $(1)/$(1).conf $(BUILDDIR)/$(1)
endef

$(foreach anim,$(ANIMATIONNAMES),$(eval $(call ANIMCURSOR_template,$(anim))))

