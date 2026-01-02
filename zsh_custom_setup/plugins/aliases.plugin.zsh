
function fed(){
  local editor="nvim"
  local location="$PWD"
  
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -e) editor="$2"; shift 2 ;;
      -l) location="$2"; shift 2 ;;
      *) location="$1"; shift ;;
    esac
  done
  
  local file
  file=$(find "$location" -type f | fzf-tmux --border --reverse --preview='bat --number --color=always {}')
  [[ -n "$file" ]] && "$editor" "$file"
}

# common alias
alias vi=vim
alias v=nvim
alias cat=bat
alias ls="colorls --dark"
alias lg=lazygit
alias omzr="omz reload"
alias cd=z
alias ldc=lazydocker

# azure virtual machines alias
alias startaz="az vm start -g rg-sunops-developer-001 -n vm-sunops-dev-002"
alias stopaz='az vm stop -g rg-sunops-developer-001 -n vm-sunops-dev-002'
alias azuredev="ssh azure"
alias azurelogin="az login --tenant \"f585aa17-d773-4604-ae74-fe8db052afc8\" --scope \"https://management.core.windows.net//.default\""

# zellij alias
alias zt=zellij
alias ztr="zellij run"
alias ztcomops="zellij -n comops -s ComOps360"
alias ztzc3="zellij -n zc3 -s ZC3"
alias ztzc2="zellij -n zc2 -s RPI5"
alias ztzc1="zellij -n zc1 -s ZC1.5"
alias ztutils="zellij -n utilites -s UtilitesScripts"
alias ztgen="zellij -n general -s Home"
alias ztka="zellij ka"
alias ztk="zellij k"
alias ztls="zellij ls"
alias zta="zellij a"
alias ztda="zellij da"
alias ztd="zellij d"

