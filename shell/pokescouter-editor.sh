#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title pokescouter-editor
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🧑🏻‍💻

code ../

fork ../
# Forkのウィンドウをフローティングに切り替える
fork_window_id=$(yabai -m query --windows | jq '.[] | select(.app=="Fork") | .id')
if [ ! -z "$fork_window_id" ]; then
    yabai -m window $fork_window_id --toggle float
fi


open -a "Google Chrome" https://console.firebase.google.com/project/pokescoutor/firestore/data/~2Fuser~2FOn7bXX3if8MF2jHfGSe1WYZbVy13?hl=ja https://github.com/miyasic/PokeScouter