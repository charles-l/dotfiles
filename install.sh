#!/bin/sh
# Script to install prerequisites for you

brew=`command -v brew`
apt=`command -v apt-get`
yum=`command -v yum`
pacman=`command -v pacman`

if [[ -n "$brew" ]]; then
        INSTALLCOMMAND="brew install"
elif [[ -n "$apt" ]]; then
        INSTALLCOMMAND="apt-get install"
elif [[ -n "$yum" ]]; then
        INSTALLCOMMAND="yum install"
elif [[ -n "$pacman" ]]; then
        INSTALLCOMMAND="pacman -S"
else
        echo "Huh. Unknown package manager."
        echo "quitting..."
        exit
fi

install() {
        description=$2
        if command -v $1 2>/dev/null; then
                echo $1 is already installed
        else
                echo Installing $1
                echo Description: $description
                $INSTALLCOMMAND $1
        fi
}

echo "#################### WARNING ###################"
echo "# It is assumed that this directory is located #"
echo "# ~/.dotfiles. Some paths depend on it.        #"
echo "#################### WARNING ###################"

install git  "Version control"
install vim  "Editor"
install mutt "Email client"
install tmux "Terminal multiplexer"

echo "installing zprezto for zsh"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "installing vundle for vim"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "installing vundle plugins"
vim +PluginInstall +qall

echo "moving old config files"
mv ~/.vimrc ~/.vimrc.old
mv ~/.tmux.conf ~/.tmux.conf.old

echo "linking config files"
ln -f vim/vimrc ~/.vimrc
ln -f tmux/tmux.conf ~/.tmux.conf
ln -f zsh/zpreztorc ~/.zpreztorc
ln -f git/gitignore_global ~/.gitignore_global

ln -f ~/.zprezto/runcoms/zlogin "${ZDOTDIR:-$HOME}/.zlogin"
ln -f ~/.zprezto/runcoms/zlogout "${ZDOTDIR:-$HOME}/.zlogout"
ln -f ~/.zprezto/runcoms/zprofile "${ZDOTDIR:-$HOME}/.zprofile"
ln -f ~/.zprezto/runcoms/zshenv "${ZDOTDIR:-$HOME}/.zprofile"

echo "finished installation"
echo "to update, just \`git pull\` this repo"

#######################

echo "Do you want to install extras? (stuff without dotfiles, but still useful)"
read line
if [[ ${line:0:1} == "y" ]]; then echo "Continue"; else exit; fi

install newsbeuter "RSS reader"
install painobar   "Pandora client"
install ruby       "General purpose scripting language. [dependency]"
