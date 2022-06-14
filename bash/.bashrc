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
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/Projects/granoo/install/GranOO/3.0/bin
export PATH=$PATH:~/.local/bin/apache-maven-3.8.3/bin
export PATH=$PATH:/usr/local/include/catch2
export PATH=$PATH:/usr/local/include/ImageMagick-7

export EDITOR='nvim'
export JAVA_HOME=/usr/lib/jvm/jdk-17.0.1
#export JAVA_HOME=/usr/lib/jvm/jdk-11.0.2
#export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_311
export PATH=$JAVA_HOME/bin:$PATH
export STARSHIP_CONFIG=~/.config/starship/config.toml
export CMAKE_PREFIX_PATH=$HOME/Projects/granoo/install/GranOO/3.0/

eval "$(starship init bash)"

export WORKON_HOME=~/.venv
export PROJECT_HOME=~/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
