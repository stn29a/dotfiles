sh ~/.screenlayout/monitor.sh &
xrdb -merge ~/.Xresources &
/usr/bin/dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
/usr/bin/clipmenud &
dex -a -s /etc/xdg/autostart/:~/.config/autostart/
picom -CGb &
xsetroot -cursor_name left_ptr &
xset r rate 300 50 &
pgrep -x sxhkd > /dev/null || sxhkd &
exec bspwm
