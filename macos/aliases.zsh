#!/bin/sh
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
alias reload!='exec "$SHELL" -l'
# Alias Visual studio code (code)
alias vscode="/Applications/Visual\ Studio\ Code.app/contents/Resources/app/bin/code"
# Alias Sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# Alias Weather
alias weather="curl wttr.in"
# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; sudo npm install npm -g; sudo npm update -g;'
# DuckDB shell shortcut
alias duckdb='/Users/diegogomestome/git/duckdb/build/debug/duckdb'
# ls with dash for directories
alias ls='ls -GFh'
# list only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# nice directory tree listing showing permissions, user, group and size (human readable)
alias t="tree -L 1 --dirsfirst -shugp"
# restart system
alias restart=sudo shutdown -r now "Rebooting Now..."

# neovim
if command -v nvim >/dev/null 2>&2; then
	alias vim='nvim'
fi

# increases the sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# show all files including dotfiles
defaults write com.apple.finder AppleShowAllFiles -bool true
# checks for updates once per day
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# super fast key repeat
#defaults write NSGlobalDomain KeyRepeat -int 0

# python aliases
alias p=python
alias p3=python3
alias pp=pypy
