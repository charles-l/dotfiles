"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'gastonsimone/vim-dokumentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-fakeclip'
Plug 'kien/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'ViewPort'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'matchit'
Plug 'YankRing.vim'
Plug 'matchit.zip'
Plug 'w0ng/vim-hybrid'

" Lisp
Plug 'kovisoft/paredit'

"Blehscript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'textobj-rubyblock'

call plug#end()
