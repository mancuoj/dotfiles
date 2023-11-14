export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="steeef"

zstyle ':omz:update' mode auto
fpath+=~/.zfunc

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  fzf
)

# alias
alias gcl='git clone'
alias gl='git log'
alias glo='git log --oneline --graph'
alias gs='git status'
alias gi="git init"
alias gc='git commit'
alias gcm='git commit -m'
alias gam="git add . && git commit -m"
alias gpl='git pull --rebase'
alias gp="git push"
alias gpf='git push --force'
alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'
alias gco='git checkout'
alias gcob='git checkout -b'
alias main='git checkout main'

alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias lint="nr lint"
alias lintf="nr lint --fix"

alias update="sudo apt update && sudo apt upgrade -y"
alias remove="rm -rf"

# great wall
host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/mancuoj/.bun/_bun" ] && source "/home/mancuoj/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Load Angular CLI autocompletion.
source <(ng completion script)

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin

# fzf
# export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:55%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eza completions
export FPATH="~/eza/completions/zsh:$FPATH"

source $ZSH/oh-my-zsh.sh

alias cat="batcat"
alias ls="eza --icons"