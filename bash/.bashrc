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
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/Projects/granoo/install/GranOO/3.0/bin
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
export PATH=$PATH:~/.local/bin/apache-maven-3.8.3/bin

export EDITOR='nvim'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export STARSHIP_CONFIG=~/.config/starship/config.toml
export CMAKE_PREFIX_PATH=$HOME/Projects/granoo/install/GranOO/3.0/

eval "$(starship init bash)"

export WORKON_HOME=~/.venv/
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

. "$HOME/.cargo/env"
