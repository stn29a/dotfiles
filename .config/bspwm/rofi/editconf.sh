#!/bin/env bash

# Options for config editor
EDIT="xed"
cfg01="1:bspwmrc"
cfg02="2:sxhkdrc"
cfg03="3:polybar"
cfg04="4:alacritty"
cfg05="5:dunst"

# Get answer from user via rofi
selected_option=$(echo "$cfg01
$cfg02
$cfg03
$cfg04
$cfg05" | rofi -dmenu\
                  -i\
                  -p "Choose config"\
                  -config "~/.config/bspwm/rofi/config.rasi"\
                  -font "JetBrainsMono Nerd Font Bold 12"\
                  -width "10"\
                  -lines 5)

# Do something based on selected option
if [ "$selected_option" == "$cfg01" ]
then
    $EDIT $HOME/.config/bspwm/bspwmrc
elif [ "$selected_option" == "$cfg02" ]
then
    $EDIT $HOME/.config/sxhkd/sxhkdrc
elif [ "$selected_option" == "$cfg03" ]
then
    $EDIT $HOME/.config/bspwm/polybar/config
elif [ "$selected_option" == "$cfg04" ]
then
    $EDIT $HOME/.config/alacritty/alacritty.yml
elif [ "$selected_option" == "$cfg05" ]
then
    $EDIT $HOME/.config/dunst/dunstrc
else
    echo "No match"
fi
