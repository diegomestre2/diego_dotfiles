#!/bin/bash

if [ -f ".functions" ]; then
    mv $HOME/.functions $HOME/.functions_local
fi
ln -sf $DOTFILES/functions/.functions $HOME/.functions
source $HOME/.functions

