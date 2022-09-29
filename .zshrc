export ZSH="$HOME/.oh-my-zsh"

# “random" -> $RANDOM_THEME
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  git-open
)

source $ZSH/oh-my-zsh.sh


# -------------------------------- #
#              git                 #
# -------------------------------- #
alias gs="git status"
alias ga="git add"
alias gam="git add . && git commit -m"
alias gp="git push"
alias gamp="gam \"feat: update\" && gp"
alias go="git open"
alias gl="git log"
alias glo="git log --oneline --graph"
alias main='git checkout main'


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

function dir() {
  mkdir $1 && cd $1
}

function create() {
  hub create && gp -u origin HEAD
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
#               ?                  #
# -------------------------------- #
zstyle ':omz:update' mode auto          
ENABLE_CORRECTION="true"               
DISABLE_UNTRACKED_FILES_DIRTY="true"   


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
