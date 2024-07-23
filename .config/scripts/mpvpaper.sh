#!/bin/bash
killall hyprpaper
mpvpaper -o "no-audio --loop-playlist shuffle" '*' ~/.settings/live_wallpaper/live_wallpaper.mp4
