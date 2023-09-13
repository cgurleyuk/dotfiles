# Dotfiles

This repository is a collection of configuration files I use.

The bootstrap script was inspired from [holman/dotfiles](https://github.com/holman/dotfiles). The script checks the existance of the required folder tree, creates folders if required, finally linking to the configuration file. This was primarily required for folders like .config which house multiple applications.

# First Steps

To bootstrap a computer, here are the first things one has to do

- Install some stuff
    - (g)vim
    - zsh
    - oh-my-zsh from https://ohmyz.sh
    - vundle from https:://github.com/VundleVim/Vundle.vim
- Checkout cgurleyuk/dotfiles into ~/.dotfiles
- ***Important:*** Change directory to ~/.dotfiles
- Run ~/.dotfiles/bootstrap.sh

