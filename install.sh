#!/usr/bin/env sh

# links to dotfiles dir instead of current dir
# to allow relocation of repo without having to install again
config_dir=$HOME/.config
dotfiles_dir=$config_dir/dotfiles
current_dir=$(pwd)

ln -sfn $current_dir $dotfiles_dir
echo Linked $current_dir to $dotfiles_dir

# mouseless compile
cd mouseless/repo
if ! command go build . &> /dev/null
then
    echo Please install Go
    exit 1
fi
echo Installed Mouseless and Configs
mv mouseless ../
cd ../../

# tmux config
ln -sfn $dotfiles_dir/.tmux $HOME/.tmux
echo Linked $dotfiles_dir/.tmux to $HOME/.tmux
ln -sfn $dotfiles_dir/.tmux.conf $HOME/.tmux.conf
echo Linked $dotfiles_dir/.tmux.conf to $HOME/.tmux.conf

# vim/nvim config
ln -sfn $dotfiles_dir/.vim $HOME/.vim
echo Linked $dotfiles_dir/.vim to $HOME/.vim
ln -sfn $dotfiles_dir/nvim $config_dir/nvim
echo Linked $dotfiles_dir/nvim to $config_dir/nvim

# emacs/spacemacs config
ln -sfn $dotfiles_dir/.spacemacs $HOME/.spacemacs
echo Linked $dotfiles_dir/.spacemacs to $HOME/.spacemacs

# nixshell config
ln -sfn $dotfiles_dir/nixshell $HOME/nixshell
echo Linked $dotfiles_dir/nixshell to $HOME/nixshell

# bashrc config
ln -sfn $dotfiles_dir/.bashrc $HOME/.bashrc
echo Linked $dotfiles_dir/.bashrc to $HOME/.bashrc

# ranger config
ln -sfn $dotfiles_dir/ranger $config_dir/ranger
echo Linked $dotfiles_dir/ranger to $config_dir/ranger

# spotify-player config
ln -sfn $dotfiles_dir/spotify-player $config_dir/spotify-player
echo Linked $dotfiles_dir/spotify-player to $config_dir/spotify-player

# i3 config
ln -sfn $dotfiles_dir/i3 $config_dir/i3
echo Linked $dotfiles_dir/i3 to $config_dir/i3

# alacritty config
ln -sfn $dotfiles_dir/alacritty $config_dir/alacritty
echo Linked $dotfiles_dir/alacritty to $config_dir/alacritty

# link zathura
mkdir -p $config_dir/zathura
ln -sfn $dotfiles_dir/zathurarc $config_dir/zathura/zathurarc
echo Linked $dotfiles_dir/zathurarc $config_dir/zathura/

# rofi configs
ln -sfn $dotfiles_dir/rofi $config_dir/rofi
echo Linked $dotfiles_dir/rofi $config_dir/rofi

echo Success
