# Mancuoj's Dotfiles

- .zshrc
- .vimrc
- .tmux.conf
- .vscode
- 💕


## ZSH

```bash
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

npm i -g degit
npm i -g @antfu/ni

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

# built-in plugins
dirhistory
copyfile
copypath
copybuffer
colored-man-pages
command-not-found

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ugit
git clone https://github.com/Bhupesh-V/ugit.git $ZSH_CUSTOM/plugins/ugit

# fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab


# apt
sudo apt install hub
sudo apt install exa
sudo apt install duf
sudo apt install tldr

# proxy
alias sss="export all_proxy=http://$host_ip:7890;export http_proxy=http://$host_ip:7890;export https_proxy=http://$host_ip:7890;"
alias uss="unset all_proxy;unset http_proxy;unset https_proxy;"
```