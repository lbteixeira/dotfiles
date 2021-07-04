# My dotfiles

Repository to manage my configuration files (aka dotfiles). I'm able to concentrate all my dotfiles in a single version controlled folder thanks to [GNU Stow](https://www.gnu.org/software/stow/), that is described as

> a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.

## Usage

1. Create a folder to store your dotfiles.
2. In this folder, you need to "recreate" the structure of your system, so GNU Stow knows where to put the symlinks. For example, my .bash\* files should be in my home folder, so I included them at dotfiles/bash. On the other hand, my Neovim folder should be located at $HOME/.config/nvim, so I included them at dotfiles/textEditors/.config/nvim.
