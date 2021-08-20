xrdb -merge ~/.Xresources &
/usr/bin/dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
/usr/bin/clipmenud &
dex -a -s /etc/xdg/autostart/:~/.config/autostart/
nvidia-settings --load-config-only &

xset r rate 300 50 &
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
# Default Session
session=${1:-dwm}

case $session in
    dwm) 
        exec dwm;;
    bspwm) 
        exec bspwm;;
    *)  
        exec $1;;
esac
