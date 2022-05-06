# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/leon/.oh-my-zsh"

# half-life inspired prompt
autoload -Uz vcs_info # Load version control information
autoload -U colors && colors  # Load colors
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%fon %F{039}%b '
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%F{099}%n %{$reset_color%}in %F{010}%~ ${vcs_info_msg_0_}%F{166}λ %f'

THEME=$(xrdb -query | awk '/name/ { print $2 }')
[ "$THEME" = "greenscreen" ] && PROMPT='%B%n %{$reset_color%}in %~ ${vcs_info_msg_0_}λ %f'

# # simpler half-life prompt (no git):
# # Enable colors and change prompt:
# autoload -U colors && colors  # Load colors
# PS1="%B%F{099}%n %{$reset_color%}in %F{010}%~ %F{166}λ %f"

setopt autocd     # Automatically cd into typed directory.
stty stop undef       # Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP

setopt globdots


# vim on the command line
set -o vi


[ -f ~/.profile ] && source ~/.profile
[ -f ~/.aliasrc ] && source ~/.aliasrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
