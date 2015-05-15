"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'tpope/vim-fugitive' "Git wrapper
Plugin 'kien/ctrlp.vim'  "Fuzzy searching if dmenu isn't avaliable
Plugin 'kien/rainbow_parentheses.vim' "Makes working with lisp easier
Plugin 'wgibbs/vim-irblack' "Nice, low contrast color scheme
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'

call vundle#end()
