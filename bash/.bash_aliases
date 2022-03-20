# Bash
alias ll='exa -lh --icons --group-directories-first'
alias la='exa -a --group-directories-first'
alias laa='exa -lha --icons --group-directories-first --git-ignore'
alias ls='exa'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ss='source $HOME/.bashrc'
alias sa='source $HOME/.bash_aliases'
alias cl='clear'
alias cp='cp -iv'
alias mv='mv -iv'
alias put='trash-put '
alias mkdir='mkdir -pv'
alias mo='sudo mount /dev/sda ~/Desktop/usb'
alias umo='sudo umount '
alias inst='sudo apt install '
alias remove='sudo apt remove '
alias cat='bat '
alias tree='exa --tree'

# Git
alias ga='git add .'
alias gs='git status'
alias gi='git init'
alias gp='git push'
alias gig='touch .gitignore'
alias gc='git commit -m '
alias gr='git rm --cached '
alias gac='git add . && git commit -m '
alias gcl='git clone '
alias gup='git push'
alias gdown='git pull'
alias gl='git log'
alias lz='lazygit'

# Edit
alias bs='nvim $HOME/.bashrc'
alias ali='nvim $HOME/.bash_aliases'

# Directories
alias p='clear && cd $HOME/Projects && ll'
alias dl='clear && cd $HOME/Downloads && ll'
alias desk='clear && cd $HOME/Desktop && ll'
alias w='clear && cd $HOME/Pictures/wallpapers'
alias conf='clear && cd $HOME/.config && ll'
alias d='clear && cd $HOME/Documents && ll'
alias th='clear && cd $HOME/Projects/thesis && ll'
alias phd='clear && cd ~/Documents/phd && ll'
alias dot='clear && cd $HOME/dotfiles && ll'
alias gr='clear && cd $HOME/Projects/granoo && ll'

# Programs
alias net='nmtui'
alias v='nvim'
alias z='zathura'
alias the='zathura thesis.pdf'
alias vol='alsamixer'
alias patch='patch -p1 <'
alias fshow='sxiv -t *'
alias stow='stow *'
#alias tar='tar -xzfv '
alias sys='inxi -Fxz'

