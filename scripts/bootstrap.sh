#!/usr/bin/env bash

source ./functions/functions.sh

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

on_start() {
    fast_install=false
    if [[ $(uname) != 'Darwin' ]]; then
        exit 1
    fi

    info_ '                             ____  _____ '
    info_ '    ____ ___   ____ _ _____ / __ \/ ___/ '
    info_ '   / __ `__ \ / __ `// ___// / / /\__ \  '
    info_ '  / / / / / // /_/ // /__ / /_/ /___/ /  '
    info_ ' /_/ /_/ /_/ \__,_/ \___/ \____//____/   '
    info_ '                                         '
    info_ "This script will guide you through installing macOS applications and cli tools."
    echo "If you want, it will install everything without your direct agreement!"
    echo
    ask "Do you want to proceed with installation?" && read answer
    echo
    if [[ "${answer}" != "y" ]]; then
        echo "Exiting..."
        exit 1
    fi
    echo
    #ask "Do you want to proceed with a \"fast\" installation? (without any question)" && read answer
    #echo
    #if [[ "${answer}" == "y" ]]; then
    #    fast_install=true
    #fi
    #if [[ "${answer}" == "q" ]]; then
    #    echo "You know my secret... see you next time!"
    #    exit 1
    #fi
}

install_dotfiles() {
	info 'installing dotfiles'
	find -H "$DOTFILES_ROOT" -maxdepth 3 -name '*.link' -not -path '*.git*' |
		while read -r src; do
			dst="$HOME/.$(basename "${src%.*}")"
			link_file "$src" "$dst"
		done
}


main(){
	on_start
    setup_gitconfig
    install_dotfiles
    
    info "installing dependencies"
    if ./bin/update_dotfiles; then
    	success "dependencies installed"
    else
    	fail "error installing dependencies"
    fi

    zsh="$(find_zsh)"
    test -z "$TRAVIS_JOB_ID" &&
	test "$(expr "$SHELL" : '.*/\(.*\)')" != "zsh" &&
	command -v chsh >/dev/null 2>&1 &&
	chsh -s "$zsh" &&
	success "set $("$zsh" --version) at $zsh as default shell"
	
    echo ''
    echo '  All installed!'
}

main "$*"

