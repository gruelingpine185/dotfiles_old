#!/usr/bin/env sh

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

sketchybar --add item           apple.logo left                             \
                                                                            \
           --set apple.logo     icon=$APPLE                                 \
                                icon.font="$FONT:Black:16.0"                \
                                icon.color=$GREEN                           \
                                background.padding_left=-8                  \
                                background.padding_right=16                 \
                                label.drawing=off                           \
                                click_script="$POPUP_CLICK_SCRIPT"          \
                                                                            \
           --add item           apple.prefs popup.apple.logo                \
           --set apple.prefs    icon=$PREFERENCES                           \
                                label="Preferences"                         \
                                click_script="open -a 'System Preferences';
                                              $POPUP_OFF"                   \
           --add item           apple.lock popup.apple.logo                 \
           --set apple.lock     icon=$LOCK                                  \
                                label="Sleep"                               \
                                click_script="pmset displaysleepnow;
                                              $POPUP_OFF"
