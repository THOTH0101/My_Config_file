#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a

function get_brightness {
  brightnessctl -m g
}

function send_notification {
  icon="brightnesssettings"
  brightness=$(get_brightness)
  extra=4
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" 0 $((brightness / 488 * extra)) | sed 's/[0-9]//g')
  # Send the notification
  dunstify -i "$icon" -r 5555 -u normal "    $bar"
}

case $1 in
up)
  # increase the backlight by 5%
  brightnessctl -q s +10%
  send_notification
  ;;
down)
  # decrease the backlight by 5%
  brightnessctl -q s 10%-
  send_notification
  ;;
esac
