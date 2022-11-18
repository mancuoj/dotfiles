export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="random"
ZSH_THEME="simple"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  git-open
  fzf-tab
)

source $ZSH/oh-my-zsh.sh


# -------------------------------- #
#              git                 #
# -------------------------------- #
alias ga="git add"
alias gp="git push"
alias gs="git status"
alias gl="git log"
alias glo="git log --oneline --graph"
alias gpl="git pull"
alias gm="git merge"

alias open="git open"

alias gi="git init && gam 'chore: init'"
alias gam="git add . && git commit -m"
alias gamf="gam 'feat: update'"
alias gamp="gamf && gp"
alias gpall="gp --all origin"
alias create="hub create && gp -u origin HEAD"

alias gb='git branch'
alias gbd='git branch -d'
alias gco="git checkout"
alias gcob='git checkout -b'
alias main="git checkout main"


# -------------------------------- #
#           @antfu/ni              #
# -------------------------------- #
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias nio="ni --prefer-offline"


# -------------------------------- #
#         custom alias             #
# -------------------------------- #
alias zshconf="code ~/.zshrc"
alias update="sudo apt update && sudo apt upgrade"

function h() {
  cd ~/h/$1
}

function remove() {
  rm -rf $1
}

function mdh() {
  mkdir ~/h/$1 && cd ~/h/$1
}

function clone() {
  if [[ -z $2 ]] then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

function cloneh() {
  h && clone "$@" && code . && cd ~2
}

function codeh() {
  h && code "$@" && cd -
}


# -------------------------------- #
#             proxy                #
# -------------------------------- #
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890


# -------------------------------- #
#              fnm                 #
# -------------------------------- #
export PATH=/home/hh/.fnm:$PATH
eval "`fnm env --use-on-cd`"


# -------------------------------- #
#              fzf                 #
# -------------------------------- #
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# -------------------------------- #
#               ?                  #
# -------------------------------- #
zstyle ':omz:update' mode auto
ENABLE_CORRECTION="true"               
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'


# -------------------------------- #
#              go                  #
# -------------------------------- #
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


# -------------------------------- #
#             pnpm                 #
# -------------------------------- #
export PNPM_HOME="/home/hh/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"