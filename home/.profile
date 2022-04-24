export PATH="$PATH:${$(find ~/bin/ -type d -printf %p:)%%:}:$HOME/.emacs.d/bin"

# default programs
export EDITOR="nvim"
export TERM="st-256color"
export SHELL="zsh"

export BROWSER="surf"