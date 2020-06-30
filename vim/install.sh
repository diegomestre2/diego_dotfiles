#!/bin/sh

# Include external functions
source ./functions/functions.sh
info "Installing vim..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
vim +'PlugUpdate' +qa

if [ -f "$HOME/.vimrc" ]; then
	mv $HOME/.vimrc $HOME/.vimrc_local
fi

if command -v nvim >/dev/null 2>&1; then
	curl -fLo ~/.local/share/nvim/clesite/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Installing nvim..."
	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/vim/.vimrc" ~/.config/nvim/init.vim
	nvim +'PlugInstall --sync' +qa
	nvim +'PlugUpdate' +qa
fi

finish
