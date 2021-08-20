#! /bin/bash 
sh ~/.screenlayout/monitor.sh &
xrdb -merge ~/.Xresources &
/usr/bin/dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
/usr/bin/clipmenud &
dex -a -s /etc/xdg/autostart/:~/.config/autostart/
nvidia-settings --load-config-only &
picom -CGb &
xsetroot -cursor_name left_ptr &
pgrep -x sxhkd > /dev/null || sxhkd -c /home/stn29a/.config/sxhkd/sxhkd_dwm &
dwmblocks &