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
xrandr --output DP-0.1 --auto --right-of eDP-1-0

# init keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export keyring
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

# or the icons in the dolphin won't display properly
export XDG_CURRENT_DESKTOP=kde

# disable power saving
xset dpms off

# start Window Manager
exec dbus-launch xmonad

