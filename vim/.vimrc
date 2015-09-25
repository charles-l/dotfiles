"Basic settings
set nocompatible
filetype plugin indent on

source ~/.vim/basicconfig.vim
source ~/.vim/plugins.vim

" SYNTAX
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set t_Co=256
colorscheme distinguished
