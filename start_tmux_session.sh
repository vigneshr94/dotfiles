#!/bin/bash

session="CAI"
ch_dir="~/FTC_Solar/Projects/Main_Projects/construction_ai_application"
win1="Terminal"
win2="Explorer"
win3="Backend"
win4="Workspace"
win5="PythonShell"
win6="Git"

win2_cmd="yazi"
win3_cmd="poetry shell"
win5_cmd="poetry shell"
win6_cmd="lg"

if ! tmux has-session -t "$session"; then

    tmux new-session -s "$session" -d
    tmux rename-window -t "$session":1 "$win1"
    tmux new-window -t "$session":2 -n "$win2"
    tmux send-keys -t "$session":2 "$ch_dir" ENTER
    tmux new-window -t "$session":3 -n "$win3"
    tmux send-keys -t "$session":3 "$ch_dir/backend" ENTER
    tmux new-window -t "$session":4 -n "$win4"
    tmux send-keys -t "$session":4 "$ch_dir" ENTER
    tmux new-window -t "$session":5 -n "$win5"
    tmux send-keys -t "$session":5 "$ch_dir/backend" ENTER
    tmux new-window -t "$session":6 -n "$win6"
    tmux send-keys -t "$session":6 "$ch_dir" ENTER

    tmux split-window -t "$session":4 -v
    tmux send-keys -t "$session":4.2 "$ch_dir" ENTER

    tmux send-keys -t "$session":2 "$win2_cmd" ENTER
    tmux send-keys -t "$session":3 "$win3_cmd" ENTER
    tmux send-keys -t "$session":5 "$win5_cmd" ENTER
    tmux send-keys -t "$session":6 "$win6_cmd" ENTER

fi

tmux switch-client -t "$session"
