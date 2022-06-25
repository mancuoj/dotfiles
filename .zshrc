export ZSH="$HOME/.oh-my-zsh"

PATH="$PATH:$HOME/.local/bin"

# 代理
host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
alias sss="export all_proxy=http://$host_ip:7890;export http_proxy=http://$host_ip:7890;export https_proxy=http://$host_ip:7890;"
alias uss="unset all_proxy;unset http_proxy;unset https_proxy;"
# export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
# export all_proxy=http://$host_ip:7890
# export http_proxy=http://$host_ip:7890
# export https_proxy=http://$host_ip:7890

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="spaceship"


# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
# dirhistory -> alt+arrow
# copyfile -> copyfile <filename>
# copypath -> copypath || copypath <file>
# copybuffer -> ctrl+o
plugins=(
  git
  gitfast
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
  dirhistory
  copyfile
  copypath
  copybuffer
  thefuck
)


# npm i -g @antfu/ni
alias s="nr start"
alias d="nr dev"
alias b="nr build"


# 我的
alias c="clear"
alias src="source ~/.zshrc"
alias bat="batcat"
alias cat="batcat"
alias update="sudo apt update && sudo apt upgrade"

source $ZSH/oh-my-zsh.sh

# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
