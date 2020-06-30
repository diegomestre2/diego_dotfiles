#!/bin/bash
# Include external functions
source ./functions/functions.sh

info "Installing bash..."

if [ -f "$HOME/.bash_profile" ]; then
    mv $HOME/.bash_profile $HOME/.bash_profile_local
fi
ln -sf $DOTFILES/bash/.bash_profile $HOME/.bash_profile
source $HOME/.bash_profile

if [ -f "$HOME/.bashrc" ]; then
    mv $HOME/.bashrc $HOME/.bashrc_local
fi
ln -sf $DOTFILES/bash/.bashrc $HOME/.bashrc
source $HOME/.bashrc

if [ -f "$HOME/.bash_prompt" ]; then
    mv $HOME/.bash_prompt $HOME/.bash_prompt_local
fi
ln -sf $DOTFILES/bash/.bash_prompt $HOME/.bash_prompt
source $HOME/.bash_prompt

finish
