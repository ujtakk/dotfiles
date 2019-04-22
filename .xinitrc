#!/bin/bash
#
# ~/.xinitrc
#

case `hostname` in
ibiza )
  xrandr --output HDMI-1 --mode 1920x1200
  xrandr --output VGA-1 --mode 1920x1080
  xrandr --output VGA-1 --auto --right-of HDMI-1
  ;;
molokai )
  xrandr --output DVI-I-1 --mode 1024x768
  ;;
lanai )
  xrandr --output Screen 0 --mode 1920x1080
  ;;
york )
  xrandr --output VGA-0 --mode 1366x768
  ;;
* )
  ;;
esac

# for urxvt
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx

xrdb ~/.Xresources
exec /usr/bin/i3
