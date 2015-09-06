#!/bin/sh
# Script to install prerequisites for you

echo ":: WARNING! '~/.dotfiles' must exist for this to work!"
cd $HOME/.dotfiles
git submodule init
git submodule update
echo ":: submodules updated"

echo ":: moving old config files"
mv ~/.vimrc ~/.vimrc.old
mv ~/.tmux.conf ~/.tmux.conf.old

echo ":: linking config files"
ln -f vim/vimrc ~/.vimrc
ln -f tmux/tmux.conf ~/.tmux.conf
ln -f bash/profile ~/.profile
ln -f git/gitignore_global ~/.gitignore_global

echo ":: installing plug for vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo ":: installing vundle plugins"
vim +PlugInstall +qall

echo ":: finished installation"
echo "   to update, just \`git pull\` this repo and run install.sh again"
