"Boilerplate to enable Vundle
call plug#begin('~/.vim/plugged')

Plug 'gastonsimone/vim-dokumentary'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim' "Makes working with lisp easier
Plug 'junegunn/vim-oblique'
Plug 'junegunn/vim-pseudocl'
Plug 'kana/vim-fakeclip'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend|png|jpg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'

Plug 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

Plug 'mileszs/ack.vim'
Plug 'mtth/scratch.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-indent-object'
Plug 'textobj-user'
Plug 'matchit.zip'
Plug 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/.vimrc']
let g:startify_custom_header = [
            \ '                      ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ',
            \ '                     ███    ███ ███  ▄██▀▀▀███▀▀▀██▄',
            \ '                     ███    ███ ███▌ ███   ███   ███',
            \ '                     ███    ███ ███▌ ███   ███   ███',
            \ '                     ███    ███ ███▌ ███   ███   ███',
            \ '                     ███    ███ ███  ███   ███   ███',
            \ '                     ███    ███ ███  ███   ███   ███',
            \ '                     ▀██████▀   █▀    ▀█   ███   █▀  ',
            \ '',
            \ ''
            \ ]
Plug 'Townk/vim-autoclose'
Plug 'vimwiki'
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Lisp
Plug 'kovisoft/paredit'

"Blehscript
Plug 'pangloss/vim-javascript'

"Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'textobj-rubyblock'

"C
Plug 'scrooloose/syntastic'

call plug#end()
