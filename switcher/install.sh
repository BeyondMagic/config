# install panel theme (needed)
cp -f -r ../theme/iume/gtk-3.0/ ~/.config/
# install whole theme
cp -f -r ../theme/iume/nttcp/ ~/.themes/

# install candy icons
git clone https://github.com/EliverLara/candy-icons candy
mkdir ~/.icons/
mv -f ./candy ~/.icons/
gtk-update-icon-cache -f -t ~/.icons/candy

# install cursor theme
cp -f -r ../theme/general/pixelfun3/ ~/.icons/

# install xfce4 rc files completely
cp -f -r ../theme/general/xfce4/ ~/.config/

# change gtk
xfconf-query -c xsettings -p /Net/ThemeName -s "nttcp"
xfconf-query -c xsettings -p /Net/IconThemeName -s "candy-icons"
xfconf-query -c xsettings -p /Net/CursorThemeName -s "pixelfun3"
xfconf-query -c xsettings -p /Net/CursorThemeSize -s 16

# reset xfce4-panel
xfce4-panel -r

# reset xfwm
xfwm4 -r
