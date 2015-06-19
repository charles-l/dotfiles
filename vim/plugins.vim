"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'gmarik/Vundle.vim' "Plugin Manager
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
Plug 'kien/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'mileszs/ack.vim'
Plug 'tomasr/molokai'
Plug 'gastonsimone/vim-dokumentary'

"Ruby
Plug 'vim-ruby/vim-ruby'

call plug#end()

colorscheme molokai
