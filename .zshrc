export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="steeef"
zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

alias zshconf="code ~/.zshrc"
alias update="sudo apt update && sudo apt upgrade"
alias ba="batcat"

alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gam="ga . && git commit -m"
alias gi="git init && gam 'chore: init'"
alias gb='git branch'
alias gbd='git branch -d'
alias gco="git checkout"
alias gcob='git checkout -b'
alias main="git checkout main"

alias nio="ni --prefer-offline"
alias s="nr start"
alias t="nr test"
alias tu="nr test -u"
alias p="nr play"
alias d="nr dev"
alias b="nr build"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias release="nr release"

function h() {
  cd ~/h/$1
}

function mdh() {
  mkdir ~/h/$1 && cd ~/h/$1
}

function remove() {
  rm -rf $1
}

function clone() {
  if [[ -z $2 ]] then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

function cl() {
  h && clone "$@" && code .
}

function co() {
  h && code "$@" && cd -
}

host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
source "$HOME/.rye/env"
