"Boilerplate to enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim' "Plugin Manager
Plugin 'taglist.vim' "Source code browser
Plugin 'tpope/vim-fugitive' "Git wrapper
Plugin 'kien/ctrlp.vim'  "Fuzzy searching if dmenu isn't avaliable
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kien/rainbow_parentheses.vim' "Makes working with lisp easier
Plugin 'wgibbs/vim-irblack' "Nice, low contrast color scheme
Plugin 'charles-l/writer' "For writing in vim
Plugin 'tpope/vim-dispatch' "Better build plugin
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter' "Magical commenting
Plugin 'vim-scripts/SyntaxRange'
Plugin 'gregsexton/MatchTag'
Plugin 'geekq/vim-go'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gilligan/vim-lldb'
Plugin 'scrooloose/syntastic'
Plugin 'kana/vim-textobj-user'
Plugin 'ervandew/supertab'
Plugin 'jgdavey/tslime.vim'

"Ruby
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-bundler.git'
Plugin 'thoughtbot/vim-rspec'

"Coffeescript
Plugin 'kchmck/vim-coffee-script'

"Markdown
Plugin 'tpope/vim-markdown'

"Arduino
Plugin 'sudar/vim-arduino-syntax'

"JavaScript
Plugin 'vim-scripts/JavaScript-Indent'

call vundle#end()

"""""""""""""""""
" PLUGIN CONFIG "
"""""""""""""""""

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
        \ ['darkgreen',   'firebrick3'],
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['green',       'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['red',         'firebrick3'],
        \ ]

"Supertab
let g:SuperTabDefaultCompletionType = "context"

"Ctrl-P Funky
nnoremap <Leader>fu :CtrlPFunky<Cr>

"Tslime
vmap <Leader>r <Plug>SendSelectionToTmux

"Delimitmate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

nnoremap <silent> <leader>t :TlistToggle<CR>
nnoremap <silent> <leader>m :Make<CR>

syntax enable
colorscheme ir_black
