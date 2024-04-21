##################################################################################################
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.
zstyle ':z4h:' auto-update      'ask'
zstyle ':z4h:' auto-update-days '10'
zstyle ':z4h:bindkey' keyboard  'pc'
zstyle ':z4h:' start-tmux       no
zstyle ':z4h:' term-shell-integration 'yes'
zstyle ':z4h:autosuggestions' forward-char 'accept'
zstyle ':z4h:fzf-complete' recurse-dirs 'no'
zstyle ':z4h:direnv'         enable 'no'
zstyle ':z4h:direnv:success' notify 'yes'
zstyle ':z4h:ssh:example-hostname1'   enable 'no'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
zstyle ':z4h:ssh:*'                   enable 'no'
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'
zstyle ':z4h:ssh-agent:' start yes

z4h install ohmyzsh/ohmyzsh || return
z4h init || return
path=(~/bin $path)
export GPG_TTY=$TTY
z4h source ~/.env.zsh
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace
z4h bindkey undo Ctrl+/ Shift+Tab
z4h bindkey redo Alt+/
z4h bindkey z4h-cd-back    Alt+Left
z4h bindkey z4h-cd-forward Alt+Right
z4h bindkey z4h-cd-up      Alt+Up
z4h bindkey z4h-cd-down    Alt+Down

autoload -Uz zmv
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home
setopt glob_dots
setopt no_auto_menu
##################################################################################################



function up() {
  echo -e "\033[0;34mUpdating system packages ...\033[0m"
  sudo apt update -qq && sudo apt upgrade -yqq

  echo -e "\033[0;34mUpdating npm global packages ...\033[0m"
  taze major -gis

  echo -e "\033[0;34mUpgrading bun ...\033[0m"
  bun upgrade

  echo -e "\033[0;34mUpgrading deno ...\033[0m"
  deno upgrade

  echo -e "\033[0;34mUpdating rye ...\033[0m"
  rye self update

  echo -e "\033[0;34mUpdating Rust packages ...\033[0m"
  rustup update
  cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')

  echo -e "\033[0;32mEverything is shiny now!\033[0m"
}

function md() {
  [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1"
}
compdef _directories md

function pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

function cl() {
  if [[ -z $2 ]] then
    gh repo clone "$@" && cd "$(basename "$1" .git)"
  else
    gh repo clone "$@" && cd "$2"
  fi
}

function p() {
  cd ~/Projects/$1
}

function forks() {
  cd ~/Forks/$1
}

function works() {
  cd ~/Works/$1
}

function clp() {
  p && cl "$@" && code . && cd ~2
}

function clf() {
  forks && cl "$@" && code . && cd ~2
}

function clw() {
  works && cl "$@" && code . && cd ~2
}

function codep() {
  p && code "$@" && cd -
}

function codef() {
  forks && code "$@" && cd -
}

function codew() {
  works && code "$@" && cd -
}

alias ls='lsd'
alias cd='z'
alias tree='tree -a -I .git'
alias remove='rm -rf'
alias clean='remove node_modules && ni'
alias weather='curl -s wttr.in/shanghai | head -n 7 | tail -n 5'

alias nio='ni --prefer-offline'
alias s='nr start'
alias d='nr dev'
alias b='nr build'
alias t='nr test'
alias fmt='nr format'
alias lint='nr lint'
alias lintf='nr lint --fix'
alias release='nr release'

alias cr='gh repo create'
alias crpr='gh pr create'
alias fork='gh repo fork'

alias gs='git status'
alias gl='git log'
alias glo='gl --oneline --graph'
alias gp='git push'
alias gpf='gp --force'
alias gpl='git pull --rebase'

alias ga='git add'
alias gA='ga -A'
alias gc='git commit'
alias gcm='gc -m'
alias gam='gA && gcm'

alias gi='git init'
alias gii='gi && gam "chore: init"'

alias gb='git branch'
alias gbd='gb -d'
alias gco='git checkout'
alias gcob='gco -b'
alias main='gco main'
alias dev='gco dev'

alias gr='git reset'
alias grh='gr HEAD'
alias grh1='gr HEAD~1'

# Great Wall
host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890

# fnm
export PATH="/home/mancuoj/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# bun
[ -s "/home/mancuoj/.bun/_bun" ] && source "/home/mancuoj/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# rye
source "$HOME/.rye/env"

# go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/gopath

# fly.io
export FLYCTL_INSTALL="/home/mancuoj/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="/home/mancuoj/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# autin
eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"

# zoxide
eval "$(zoxide init zsh)"

# Turso
export PATH="/home/mancuoj/.turso:$PATH"
