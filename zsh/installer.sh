
#!/usr/bin/env bash

# Include external functions
source ./functions/functions.sh

if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc_local
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Uncomment this line to set the file .zshrc as default
# ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

source $HOME/.zshrc
touch $HOME/.hushlogin