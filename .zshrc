export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="random"
ZSH_THEME="simple"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

alias gp="git push"
alias gpl="git pull"

alias gi="git init && gam 'chore: init'"
alias gam="git add . && git commit -m"
alias gamf="gam 'feat: update'"
alias gamp="gamf && gp"

alias zshconf="code ~/.zshrc"
alias update="sudo apt update && sudo apt upgrade"

function remove() {
  rm -rf $1
}

host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890