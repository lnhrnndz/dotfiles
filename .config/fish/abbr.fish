abbr -a -- src 'source $HOME/.config/fish/config.fish'

# git #
abbr -a -- gl 'git log'
abbr -a -- gs 'git status'
abbr -a -- gd 'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit'
abbr -a -- gca 'git commit --amend'
abbr -a -- gco 'git checkout'
# alias glog in fish/functions

# ls #
abbr -a -- ll 'ls -l'
abbr -a -- la 'ls -a'
abbr -a -- lal 'ls -al'
abbr -a -- lt 'exa --sort newest -l'
# alias ls in fish/functions

# fzf #
abbr -a -- fcd 'fzf-cd-widget'
abbr -a -- fvim 'vim $(find . | fzf)'
abbr -a -- fopen 'fuzzyopen' # see fuzzyopen script
abbr -a -- fzo 'fuzzyopen' # see fuzzyopen script

abbr -a -- sxhkdrc 'nvim ~/.config/sxhkd/sxhkdrc'

# tree #
abbr -a -- treee 'tree --dirsfirst -F'
abbr -a -- dotfilestree 'tree --dirsfirst -F -a . -I .git'
bind -M insert -- \et 'tree --dirsfirst -F'

# WSL #
abbr -a -- e 'explorer.exe'

# OSX #
abbr -a -- o 'open .'
abbr -a -- s 'sioyek'
#alias sioyek='open -a sioyek'

# VPN #
abbr -a -- vpn 'nordvpn'

