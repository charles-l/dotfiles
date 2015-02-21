""""""""""""""""""
" KEYBOARD BINDS "
""""""""""""""""""
nnoremap <silent> <leader>o :call DmenuOpen("e")<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>f :Exp<CR>
nnoremap <silent> <leader>a :call SwapSourceFile("e")<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
inoremap <C-F> <C-X><C-F>

"Move windows with C-Direction
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
