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

is_tmux_running() {
    if tmux ls &> /dev/null; then
        echo "Tmux server is running......";
        return 0;
    else
        echo "Tmux server is not running......";
        return 1;
    fi
}

is_session_exists() {
    local session=$1;
    if tmux has-session -t "$session" &> /dev/null; then
        echo "$session exits considering attaching to that session......";
        return 0;
    else
        echo "$session not found. considering creating the session.......";
        return 1;
    fi
}

create_session() {
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
    tmux select-window -t "$session":1
}

attach_to_session(){
    read -p "Do you want to attach to the $session session (y/n): " option;
    case "$option" in
        y|Y)
            tmux attach-session -t $session
            ;;
        n|N)
            echo "Exiting the script."
            exit 0
            ;;
        *)
            echo "No option choosen, consider attacting to the preferred session."
            exit 0
            ;;
    esac
}

main() {
    if is_tmux_running; then
        echo "Tmux server is running........";
        echo "Checking for session $session";
        if is_session_exists $session; then
            echo "$session found attaching to it.";
            attach_to_session
        else
            echo "$session not found creating a new session.";
            create_session
            echo "$session Create successfully";
            attach_to_session
        fi
    else
        echo "Tmux Server is not running. starting the server and creating the session....."
        create_session
        attach_to_session
    fi
}

main
