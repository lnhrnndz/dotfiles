abbr -a -- src 'source $HOME/.config/fish/config.fish'

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

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
abbr -a -- lg 'lazygit'

# ls #
abbr -a -- ll 'ls -l'
abbr -a -- la 'ls -a'
abbr -a -- lal 'ls -al'
abbr -a -- lt 'eza --sort newest -l'
abbr -a -- lalt 'eza --sort newest -l -a'
# alias ls in fish/functions

abbr -a -- mv 'mv -v'
abbr -a -- cp 'cp -v'
abbr -a -- rs 'rsync -avh --progress'
abbr -a -- rsi 'rsync -avh --info=progress2 --partial'

abbr -a -- usermount 'sudo mount -o umask=0022,gid=100,uid=1000'

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

# NixOs #
abbr -a -- config 'sudoedit /etc/nixos/configuration.nix'
abbr -a -- rebuild 'sudo nixos-rebuild switch'
abbr -a -- boot 'sudo nixos-rebuild boot'
abbr -a -- update 'sudo nix-channel --update'
