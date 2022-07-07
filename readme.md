# Mancuoj's Dotfiles

- .zshrc
- .vimrc
- .tmux.conf
- .vscode
- 💕


## ZSH

```bash

# built-in plugins
dirhistory
copyfile
copypath
copybuffer
colored-man-pages
command-not-found

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# zsh theme spaceship 
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# z
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# git-open
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

# hub
sudo apt install hub

# ugit


# fzf-tab


# degit & ni
npm i -g degit
npm i -g @antfu/ni

# proxy
alias sss="export all_proxy=http://$host_ip:7890;export http_proxy=http://$host_ip:7890;export https_proxy=http://$host_ip:7890;"
alias uss="unset all_proxy;unset http_proxy;unset https_proxy;"
```