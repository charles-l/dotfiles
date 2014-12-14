Dotfiles
========
My config files.

Screenies!
--------
_Vim_<br/>
![](screenshots/vim.png)
<br/>

_tmux/Vim/zsh_<br/>
![](screenshots/all_together.png)

Install
----
`git clone https://github.com/charles-l/dotfiles ~/.dotfiles` <br/>
`sh ~/.dotfiles/install.sh`

Features and overview of .vimrc
----
- Minimal cruft.
- Plugins enabled and configured:
  - [Vundle](http://www.vim.org/scripts/script.php?script_id=3458)
  - [Taglist](http://www.vim.org/scripts/script.php%3Fscript_id%3D273)
  - [Vim Fugitive](https://github.com/tpope/vim-fugitive)
  - [Syntastic](https://github.com/scrooloose/syntastic)
  - [Rainbow Parentheses](https://github.com/kien/rainbow_parentheses.vim)
  - [Scratch.vim](https://github.com/mtth/stratch.vim)
- Ctrl-P-like file searching using dmenu. Much faster and lighter weight. (If Dmenu isn't avaliable, defaults back to ctrl-p)
- Leader is mapped to `,`
- Switch between C/C++ source files and header files using `,a`

------
Features in my .tmux.conf
---
- Ctrl-Space leader (Better than Ctrl-B.)
- Sensible defaults
- Vim movement
- Hidden status bar by default

[See it in action](https://asciinema.org/a/14706)
