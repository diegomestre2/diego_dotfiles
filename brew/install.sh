#!/usr/bin/env bash

# Include external functions
source ./functions/functions.sh

install_brew() {
    # Check for Homebrew and install if we don't have it
    if test ! $(which brew); then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # Update Homebrew recipes
    brew update
    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
}

brew_install() {
    local cask=$1 program=$2

    [[ -z $program ]] && program=$cask
 
    #ask "Do you agree to install $(info $program)?" && read answer
    #if [[ ${answer} != "y" ]]; then
    #    success "Skipping..."
    #    return
    #fi
    if [[ $cask == 'cask' ]]; then
        info "Installing $program with cask..."
        brew cask list | grep $program || brew cask install $program
    else
        info "Installing $program..."
        brew list | grep $program || brew install $program
    fi
    finish
}

main() {
    # Start
    install_brew
    # CLI Tools
    brew_install coreutils
    brew_install tree
    brew_install wget
    brew_install yarn
    brew_install tldr
    # Desktop applications
    brew_install cask java
    brew_install cask gpg-suite
    brew_install cask google-chrome
    brew_install cask firefox
    brew_install cask dropbox
    brew_install cask vlc
    brew_install cask iterm2
    brew_install cask toggl
    brew_install cask visual-studio-code
    brew_install cask steam
    brew_install cask sublime-text
    # Quick Look plugins
    brew_install cask qlcolorcode # https://github.com/anthonygelibert/QLColorCode
    brew_install cask qlstephen # https://github.com/whomwah/qlstephen
    brew_install cask quicklook-json # https://github.com/sindresorhus/quick-look-plugins
    brew_install cask qlimagesize # https://github.com/Nyx0uf/qlImageSize
    brew_install cask webpquicklook # https://github.com/dchest/webp-quicklook
    # Install GnuPG to enable PGP-signing commits.
    brew_install gnupg
    # Install more recent versions of some macOS tools.
    brew_install grep
    brew_install openssh
    brew_install screen
    # Install font tools.
    brew tap bramstein/webfonttools
    brew_install sfnt2woff
    brew_install sfnt2woff-zopfli
    brew_install woff2
    # install databases
    brew_install sqlite
    brew_install postgres
    # Install other useful binaries.
    brew_install ack
    brew_install git
    brew_install rename
    brew_install antibody
    brew_install yapf

    # Remove outdated versions from the cellar.
    brew cleanup
    # Finish
    on_finish
}

main "$*"