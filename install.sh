#!/usr/bin/env sh

# links to dotfiles dir instead of current dir
# to allow relocation of repo without having to install again
config_dir=$HOME/.config
dotfiles_dir=$config_dir/dotfiles
current_dir=$(pwd)

ln -s $current_dir $dotfiles_dir
