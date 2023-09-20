#!/usr/bin/env bash

# init wallpaper daemon
swww init &
swww img ~/Pictures/Wallpaper.jpg &

# waybar
waybar &

# dunst
dunst &

# dark mode for gtk
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita{,-dark}' &
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
