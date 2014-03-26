Dotfiles
========

My config files for VIM and ZSH

Screenies!
--------
_VIM_
![](vim.png)
<br/>

_ZSH_<br/> 
<!--- 
Update these images soon. They're outdated 
-->
![](zsh.png)

Dependencies
-----
*.vimrc*
- [Vundle](http://www.vim.org/scripts/script.php?script_id=3458)
- Then open the .vimrc file and run `:BundleInstall` to get the rest of the plugins.
- Hides tmux status bar when you enter VIM.

Features in my .vimrc
----
- A bunch of awesome plugins:
  - [Vundle](http://www.vim.org/scripts/script.php?script_id=3458)
  - [CtrlP](https://github.com/kien/ctrlp.vim)
  - [Vim Markdown](https://github.com/plasticboy/vim-markdown)
  - [delimitMate](http://www.vim.org/scripts/script.php?script_id=2754)
  - [SearchComplete](http://www.vim.org/scripts/script.php?script_id=474)
  - [ToggleMaximize](http://www.vim.org/scripts/script.php?script_id=4285) *This plugin is mapped to `Ctrl-F` by default to toggle full screen. I've edited the plugin to use `Ctrl-\`*
- Leader is mapped to `,`
- `make` project with `,m`

Features in my .zshrc
---
- Fixes some of the slowness of zsh autocomplete
- `finder` alias opens current directory in finder
- `tn` alias will open a terminal notification with the message in the following quotes
- `syssleep` will send compter to sleep with simple applescript
