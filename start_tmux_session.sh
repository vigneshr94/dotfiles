#!/bin/bash

session="Dashboard"
ch_dir="~/OMDashboard"
win1="Terminal"
win2="dc_logs"
win3="container_logs"
win4="Dashboard_terminal"
win5="Editor"
win6="Git"

cmd_win3_pane_1="htop"
cmd_win3_pane_2="ping 8.8.8.8"
cmd_win3_pane_3="top"
cmd_win2_pane_1="ls -la"

editor_cmd="nvim"
git_cmd="lazygit"

if ! tmux has-session -t "$session"; then

    tmux new-session -s "$session" -d
    tmux rename-window -t "$session":1 "$win1"
    tmux send-keys -t "$session":1 "$ch_dir" ENTER
    tmux new-window -t "$session":2 -n "$win2"
    tmux new-window -t "$session":3 -n "$win3"
    tmux new-window -t "$session":4 -n "$win4"
    tmux new-window -t "$session":5 -n "$win5"
    tmux new-window -t "$session":6 -n "$win6"

    tmux split-window -t "$session":3 -v
    tmux split-window -t "$session":3.2 -h

    tmux send-keys -t "$session":3.1 "$cmd_win3_pane_1" ENTER
    tmux send-keys -t "$session":3.2 "$cmd_win3_pane_2" ENTER
    tmux send-keys -t "$session":3.3 "$cmd_win3_pane_3" ENTER 
    tmux send-keys -t "$session":2 "$cmd_win2_pane_1" ENTER
    tmux send-keys -t "$session":5 "$editor_cmd" ENTER
    tmux send-keys -t "$session":6 "$git_cmd" ENTER

fi

tmux switch-client -t "$session"
