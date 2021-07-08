# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append the aliases from another file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Include directories to PATH
export PATH=$PATH:/home/bretx/.local/bin
export PATH=$PATH:/usr/local/go/bin
export STARSHIP_CONFIG=~/.config/starship/config.toml

alias config='/usr/bin/git --git-dir=/home/bretx/.cfg/ --work-tree=/home/bretx' 
. "$HOME/.cargo/env"

eval "$(starship init bash)"
