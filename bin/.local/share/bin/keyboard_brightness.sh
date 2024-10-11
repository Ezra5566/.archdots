#!/usr/bin/env sh

# Check if the script is already running
pgrep -cf "${0##*/}" | grep -qv 1 && echo "An instance of the script is already running..." && exit 1

# Get the directory of the script
scrDir=`dirname "$(realpath "$0")"`
source $scrDir/globalcontrol.sh

# Check if SwayOSD is installed
use_swayosd=false
if command -v swayosd-client >/dev/null 2>&1 && pgrep -x swayosd-server >/dev/null; then
    use_swayosd=true
fi

print_error()
{
cat << EOF
    $(basename ${0}) <action> [step] 
    ...valid actions are...
        i -- <i>ncrease keyboard backlight [+5%]
        d -- <d>ecrease keyboard backlight [-5%]

    Example:
        $(basename ${0}) i 10    # Increase keyboard backlight by 10%
        $(basename ${0}) d       # Decrease keyboard backlight by default step (5%)
EOF
}

send_notification() {
    brightness=`brightnessctl -d "chromeos::kbd_backlight" info | grep -oP "(?<=\()\d+(?=%)" | cat`
    brightinfo=$(brightnessctl -d "chromeos::kbd_backlight" info | awk -F "'" '/Device/ {print $2}')
    angle="$(((($brightness + 2) / 5) * 5))"
    ico="$HOME/.config/dunst/icons/vol/vol-${angle}.svg"
    bar=$(seq -s "." $(($brightness / 15)) | sed 's/[0-9]//g')
    notify-send -a "t2" -r 91190 -t 800 -i "${ico}" "${brightness}${bar}" "${brightinfo}"
}

get_brightness() {
    brightnessctl -d "chromeos::kbd_backlight" -m | grep -o '[0-9]\+%' | head -c-2
}

step="${2:-5}"

case $1 in
i|-i)  # increase the keyboard backlight
    if [[ $(get_brightness) -lt 10 ]] ; then
        # increase the keyboard backlight by 1% if less than 10%
        step=1
    fi

    $use_swayosd && swayosd-client --brightness raise "$step" && exit 0
    brightnessctl -d "chromeos::kbd_backlight" set +${step}%
    send_notification ;;
d|-d)  # decrease the keyboard backlight
    if [[ $(get_brightness) -le 10 ]] ; then
        # decrease the keyboard backlight by 1% if less than 10%
        step=1
    fi

    if [[ $(get_brightness) -le 1 ]]; then
        brightnessctl -d "chromeos::kbd_backlight" set ${step}%
        $use_swayosd && exit 0
    else
        $use_swayosd && swayosd-client --brightness lower "$step" && exit 0
        brightnessctl -d "chromeos::kbd_backlight" set ${step}%-
    fi

    send_notification ;;
*)  # print error
    print_error ;;
esac

