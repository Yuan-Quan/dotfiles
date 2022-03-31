#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# enable all display
xrandr --auto
xrandr --output DisplayPort-1-0 --auto --below eDP-1-0
xrandr --output HDMI-0 --auto --right-of eDP-1-0

# start Window Manager
exec xmonad

