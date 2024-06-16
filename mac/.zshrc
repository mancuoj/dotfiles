zstyle ':z4h:' auto-update      'no'
zstyle ':z4h:' auto-update-days '28'
zstyle ':z4h:bindkey' keyboard  'mac'
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

z4h install ohmyzsh/ohmyzsh || return
z4h init || return
path=(~/bin $path)
export GPG_TTY=$TTY
z4h source ~/.env.zsh
z4h bindkey undo Ctrl+/   Shift+Tab  
z4h bindkey redo Option+/ 
z4h bindkey z4h-cd-back    Shift+Left   
z4h bindkey z4h-cd-forward Shift+Right  
z4h bindkey z4h-cd-up      Shift+Up     
z4h bindkey z4h-cd-down    Shift+Down   
autoload -Uz zmv
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home
setopt glob_dots
setopt no_auto_menu

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

alias up="brew update && brew upgrade && brew cu -a -y && brew cleanup && mas upgrade"
alias ls="lsd"
alias cd="z"
alias rm="trash"
alias p="cd ~/Projects"
alias works="cd ~/Works"

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

export http_proxy=http://127.0.0.1:7897
export https_proxy=http://127.0.0.1:7897
export all_proxy=http://127.0.0.1:7897

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
