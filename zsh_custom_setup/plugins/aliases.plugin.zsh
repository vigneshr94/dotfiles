
alias vi=nvim
alias vim=nvim
alias cat=bat
alias ls=colorls
alias tf="tmux ls | fzf --border --height 40% --reverse | cut -d ':' -f 1 | xargs -n 1 tmux switchc -t"
alias plz=sudo
alias lg=lazygit
alias ffwp='find * -type f | fzf --border --reverse --preview="bat --number --color=always {}"'
alias fgc="git log --oneline | fzf --reverse --border --multi --preview 'git show {+1}'"
alias ffwop='find * -type f | fzf --border --reverse --preview-window hidden --bind "?:preview:bat --color=always --number {}"'
alias omzr="omz reload"

find_and_edit ()
{
  local file
  file=($(find * -type f | fzf --border --reverse --preview="bat --number --color=always {}"))
  if [ "$file" != "" ]; then
    vim $file
  fi
}

alias fe=find_and_edit
