"Basic settings
set nocompatible
filetype plugin indent on

source ~/.nvim/basicconfig.vim
source ~/.nvim/plugins.vim

" SYNTAX
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set t_Co=256
colorscheme Tomorrow-Night-Eighties
