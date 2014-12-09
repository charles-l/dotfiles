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
        if command -v $1 2>/dev/null; then
                echo $1 is already installed
        else
                echo Installing $1
                $INSTALLCOMMAND $1
        fi
}

install vim
install mutt
install tmux

echo "moving old config files"
mv ~/.vimrc ~/.vimrc.old
mv ~/.tmux.conf ~/.tmux.conf.old

echo "linking config files"
ln -f .vimrc ~/.vimrc
ln -f .tmux.conf ~/.tmux.conf

echo "finished installation"
echo "to update, just \`git pull\` this repo"

#######################

echo "Do you want to install extras? (stuff without dotfiles, but still useful?)"
read line
if [[ ${line:0:1} == "y" ]]; then echo "Continue"; else exit; fi

install ruby
echo "Installing useful gems"
gem install delicious-cli
