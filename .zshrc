export ZSH="$HOME/.oh-my-zsh"
PATH="$PATH:$HOME/.local/bin"

ZSH_THEME="spaceship"

plugins=(
  gitfast
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
  dirhistory
  copyfile
  copypath
  copybuffer
  thefuck
  git-open
  command-not-found
  ugit
  fzf-tab
)

# ni
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias nio="ni --prefer-offline"
alias lint="nr lint"
alias lintf="nr lint:fix"

# git
alias gs="git status"
alias gl="git log"
alias glo="git log --oneline --graph"
alias gam="git add . && git commit -m"
alias gp="git push"
alias gb="git branch"

alias go="git open"
alias gc="hub clone"

remove() {
  if [ ! $1 ]; then
    echo "请输入要删除的目录名称"
    return 0
  fi
  echo "正在删除$1目录"
  rm -rf $1 && echo "删除成功" || echo "删除失败,请重新尝试"
}

u() {
  if [ ! $1 ]; then
    echo "请输入要更新的目录名称"
    return 0
  fi
  z $1
  gam "feat: update"
  gp
  cd - && echo "更新成功" || echo "更新失败,请重新尝试"
}

# fzf-tab
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'


source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Great Wall
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
export all_proxy=http://$host_ip:7890
export http_proxy=http://$host_ip:7890
export https_proxy=http://$host_ip:7890

export PATH="/home/hh/g/git-fuzzy/bin:$PATH"

# my
alias c="clear"
alias src="source ~/.zshrc"
alias bat="batcat"
alias cat="batcat"
alias update="sudo apt update && sudo apt upgrade"
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias hi="~/.me/hi.sh"
# source ~/.me/hi.sh

# exa
alias ls="exa --icons --ignore-glob=\"*pycache*|*package*\""
alias lt="exa --icons --tree --level=2 --ignore-glob=\"*pycache*|*package*\""
alias lr="exa --icons --recurse --ignore-glob=\"*pycache*|*package*\""
alias l1="exa --icons -1"
alias la="exa --icons --all"
alias ll="exa --header --long"
