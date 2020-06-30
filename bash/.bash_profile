# Command to centralize everything in the .bashrc file and executes it.
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
