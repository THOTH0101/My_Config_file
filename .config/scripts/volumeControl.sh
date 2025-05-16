#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
  amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off >/dev/null
}

function send_notification {
  volume=$(get_volume)
  extra=2
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" $(($volume / 5 * $extra)) | sed 's/[0-9]//g')
  # Send the notification
  if [ "$volume" -eq 0 ]; then
    dunstify -i audio-volume-muted -t 1000 -r 2593 -u normal "    $bar"
  else
    dunstify -i audio-volume-high -t 1000 -r 2593 -u normal "    $bar"
  fi
}

case $1 in
up)
  # Set the volume on (if it was muted)
  # Up the volume (+ 5%)
  amixer set Master 5%+ >/dev/null
  send_notification
  ;;
down)
  # amixer -D pulse set Master on >/dev/null
  amixer set Master 5%- >/dev/null
  send_notification
  ;;
mute)
  # Toggle mute
  amixer set Master 1+ toggle >/dev/null
  if is_mute; then
    dunstify -i audio-volume-muted -t 1000 -r 2593 -u normal "Mute"
  else
    send_notification
  fi
  ;;
esac
