#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=16                          \
                              icon.padding_right=16                         \
                              label.padding_right=20                        \
                              icon.highlight_color=$RED                     \
                              background.padding_left=-8                    \
                              background.padding_right=-8                   \
                              background.height=20                          \
                              background.corner_radius=4                    \
                              background.color=$SPACE_BACKGROUND            \
                              background.drawing=on                         \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.background.height=26                    \
                              label.background.drawing=on                   \
                              label.background.color=$OPEN_APPS_BACKGROUND  \
                              label.background.corner_radius=9              \
                              label.drawing=off                             \
                              script=""                                     \
                              click_script="$SPACE_CLICK_SCRIPT"
done

sketchybar   --add item       separator left                          \
             --set separator  icon=                                  \
                              icon.font="Hack Nerd Font:Regular:14.0" \
                              background.padding_left=16              \
                              background.padding_right=16             \
                              label.drawing=off                       \
                              associated_display=active               \
                              icon.color=$WHITE
