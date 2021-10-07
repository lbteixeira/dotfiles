# My dotfiles

Repository to manage my configuration files (aka dotfiles). I'm able to concentrate all my dotfiles in a single version controlled folder thanks to [GNU Stow](https://www.gnu.org/software/stow/), that is described as

> a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.

From the [official manual page](https://man7.org/linux/man-pages/man2/symlink.2.html), symbolic links (symlinks)

> are interpreted at run time as if the contents of the link had been substituted into the path being followed to find a file or directory.

## Installing GNU Stow

On Debian based systems, run:

`sudo apt-get install stow`

## Usage

1. Create a folder to store your dotfiles. In my case, it is called "dotfiles".
2. In this folder, you need to "recreate" the structure of your system, so GNU Stow knows where to put the symlinks. For example, my .bash\* files should be at my `$HOME` folder, so I included them at `dotfiles/bash`. On the other hand, my Neovim folder should be located at `$HOME/.config/nvim`, so I included them at `dotfiles/textEditors/.config/nvim`. Note how the folder "textEditors" is a representation of my `$HOME` folder.
3. Move your configuration files to the folders created in the previous step.
4. From your dotfiles folder, run `stow *`.
5. Now you should see symlinks at the locations where you previously had your configuration files.
6. If you need to include more files in the future, repeat step 4.
