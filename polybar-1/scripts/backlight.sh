#!/usr/bin/env sh
BRI=/sys/class/backlight/intel_backlight/brightness
MAXBRI=/sys/class/backlight/intel_backlight/max_brightness
function display_bri () {
    echo '%{F#77D}'  '%{F#FFF}'$(((100 * `cat $BRI`)/`cat $MAXBRI`))%
}
display_bri
while inotifywait -qq -e close_write $BRI; do display_bri; done
