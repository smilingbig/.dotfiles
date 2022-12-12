# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Setting up default editor 
export EDITOR="nvim"
export GIT_EDITOR=$EDITOR

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

# Use modern completion system
autoload -Uz compinit
compinit

# TODO
# This was auto generated need to figure out how this is working.
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
