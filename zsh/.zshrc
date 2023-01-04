# Set up the prompt
fpath+=($HOME/.zsh/pure)
autoload -Uz promptinit
promptinit
prompt pure
export PURE_PROMPT_VICMD_SYMBOL="_"
export PURE_PROMPT_SYMBOL="$"

# TODO
# I need a way to deal with this on non macos distro
# Source brew
export PATH="/opt/homebrew/bin:$PATH"

# Setting up default editor 
export EDITOR="nvim"
export GIT_EDITOR=$EDITOR

# Aliases
source ~/.zsh_aliases

setopt autocd # Lazy cd

# Share history across tabs and auto save history on use
# TODO 
# I'm not sure if inc_append_history or append_history is what I want so
# will experiment more with these
# setopt inc_append_history
setopt append_history
setopt sharehistory
setopt histignorealldups # No duplicates in history

# Use vi keybindings
# TODO
# Testing out setopt vi, as far as I can tell it does bindkey -v, but also
# updates other aspects of zsh to use vi style. I should investigate this is
# more detail.
# bindkey -v
setopt vi

# Bind ctrl + r to reverse history search
bindkey "^R" history-incremental-search-backward

# TODO
# Look into all the options around globbing on the terminal
# https://zsh.sourceforge.io/Intro/intro_2.html
setopt extendedglob
setopt globdots # add hidden files to glob matches using *

# Uses menu completion.
# TODO
# More to investigate here
setopt automenu

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history

# Enable cd'ing using vars
# TODO
# I should look more into how this works.
setopt cdablevars

# Enable fg/bg tasks
setopt monitor

# Setup history search on keypresses
# https://github.com/zsh-users/zsh-history-substring-search
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Use modern completion system
autoload -Uz compinit
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Functions
# TODO
# Move these out somewhere
function find_replace {
	local find=$1
	local replace=$1

	vim "+bufdo %s/${find}/${replace}/gc | up" '+q' -- $(rg $find -l) >2/dev/null
}

# Zsh syntax highlighting should be sourced at end of file
# source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
