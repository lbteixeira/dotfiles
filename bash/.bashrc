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

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	git rev-parse --is-inside-work-tree &>/dev/null || return;

	# Check for what branch we’re on.
	# Get the short symbolic ref. If HEAD isn’t a symbolic ref, get a
	# tracking remote branch or tag. Otherwise, get the
	# short SHA for the latest commit, or give up.
	branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
		git describe --all --exact-match HEAD 2> /dev/null || \
		git rev-parse --short HEAD 2> /dev/null || \
		echo '(unknown)')";

		# Check for uncommitted changes in the index.
	if ! $(git diff --quiet --ignore-submodules --cached); then
		s+='';
	fi;
	# Check for unstaged changes.
	if ! $(git diff-files --quiet --ignore-submodules --); then
		s+='';
	fi;
	# Check for untracked files.
	if [ -n "$(git ls-files --others --exclude-standard)" ]; then
		s+='';
	fi;
	# Check for stashed files.
	if $(git rev-parse --verify refs/stash &>/dev/null); then
		s+='';
	fi;

	[ -n "${s}" ] && s=" [${s}]";

	echo -e "${1} ${branchName}${2}${s}${1}";
}

if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 64);
	orange=$(tput setaf 166);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 136);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	orange="\e[1;33m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]";
#PS1+="\[${bold}\]\n";
PS1+="\[${blue}\][";
PS1+="\[${white}\]\u";
PS1+="\[${yellow}\]  ";
PS1+="\[${white}\]\w";
PS1+="\[${blue}\]] ";
PS1+="\$(prompt_git \"\[${yellow}\]\" \"\[${blue}\]\")";
PS1+="\n";
PS1+="\[${white}\] \[${reset}\]"; 
export PS1;
alias config='/usr/bin/git --git-dir=/home/bretx/.cfg/ --work-tree=/home/bretx' 
. "$HOME/.cargo/env"
