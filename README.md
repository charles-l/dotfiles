Dotfiles
========

My config files for VIM and ZSH

Screenies!
--------
_VIM_
![](vim.png)
<br/>

_BASH_<br/>
![](bash.png)

Dependencies
-----
*.vimrc*
- [Vundle](http://www.vim.org/scripts/script.php?script_id=3458)
- Then open the .vimrc file and run `:BundleInstall` to get the rest of the plugins.

Features in my .vimrc
----
- A bunch of awesome plugins:
  - [Vundle](http://www.vim.org/scripts/script.php?script_id=3458)
  - [CtrlP](https://github.com/kien/ctrlp.vim)
  - [Vim Markdown](https://github.com/plasticboy/vim-markdown)
  - [delimitMate](http://www.vim.org/scripts/script.php?script_id=2754)
  - [SearchComplete](http://www.vim.org/scripts/script.php?script_id=474)
  - [JellyBeans theme](http://www.vim.org/scripts/script.php?script_id=2555)
  - [VIM airline](https://github.com/bling/vim-airline)
  - [Syntastic](https://github.com/scrooloose/syntastic)
  - [Vaxe](https://github.com/jdonaldson/vaxe)(For people who program in Haxe. Just remove it if you don't)
- Leader is mapped to `,`
- `make` project with `,m`

Features in my .bashrc
---
- Git aliases:
  - `g` = `git`
  - `ga` = `git add`
  - `gr` = `git remove`
  - `gc` = `git commit`
  - `gp` = `git push`
  - `gh` = `git checkout`
  - `go` = `git clone`
  - `gs` = `git status -sb`
  - `gl` = `git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative`
    - a.k.a. a pretty git log
- `finder` alias opens current directory in finder
- `tn` alias will open a terminal notification with the message in the following quotes
- `syssleep` will send compter to sleep with simple applescript
