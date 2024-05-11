
alias vi=nvim
alias vim=nvim
alias cat=bat
alias ls="colorls --dark"
alias tf="tmux ls | fzf-tmux --border --height 40% --reverse | cut -d ':' -f 1 | xargs -n 1 tmux switchc -t"
alias plz=sudo
alias lg=lazygit
alias ffwp='find * -type f | fzf-tmux --border --reverse --preview="bat --number --color=always {}"'
alias fgc="git log --oneline | fzf-tmux --reverse --border --multi --preview 'git show {+1}'"
alias ffwop='find * -type f | fzf-tmux --border --reverse --preview-window hidden --bind "?:preview:bat --color=always --number {}"'
alias omzr="omz reload"
alias startvm='start_stop_vm vignesh-dev-2 start'
alias stopvm='start_stop_vm vignesh-dev-2 stop'
alias devvm="ssh devvm"


start_stop_vm()
{
  local vm=$1
  local state=$2
  gcloud compute instances $state $vm --project ftc-qa-283616
}

find_and_edit ()
{
  local file
  file=($(find * -type f | fzf-tmux --border --reverse --preview="bat --number --color=always {}"))
  if [ "$file" != "" ]; then
    vim $file
  fi
}

alias fe=find_and_edit

find_and_edit_with_editor_of_choice ()
{
    local file
    local editor=$1
    if [ -x "$(command -v "$editor")" ]; then
        file=$(find * -type f | fzf-tmux --border --reverse --preview="bat --number --color=always {}")
        if [ "$file" != "" ] && [ "$editor" != "" ]; then
            $editor $file
        fi
    else 
        echo "$editor not found"
    fi
}

alias fewe=find_and_edit_with_editor_of_choice $1
