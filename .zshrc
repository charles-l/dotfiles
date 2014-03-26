setopt MENUCOMPLETE
setopt AUTO_LIST
setopt AUTO_MENU
setopt LONG_LIST_JOBS
setopt AUTO_PARAM_SLASH

autoload -Uz promptinit compinit colors
promptinit
compinit
colors

PAGER='less'
EDITOR='vim'
PROMPT="%{$fg[green]%}(%~)%{$reset_color%} "
RPROMPT="%{$fg[cyan]%}%n%{$reset_color%} on %{$fg_bold[yellow]%}%m%{$reset_color%}" 

# OSX specific: Play nice with autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

bindkey ' ' magic-space

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

## ALIASES 'N STUFF
alias ls='ls -G'
alias ll='ls -al'
alias sl='ls -G'

# Git aliases
alias g='git'
alias ga='git add'
alias gr='git remove'
alias gc='git commit'
alias gp='git push'
alias gh='git checkout'
alias go='git clone'
alias gs='git status'

# OSX Specific
alias finder="open -a \"finder\""
alias syssleep="osascript -e 'tell app \"System Events\" to sleep'"
alias tn="terminal-notifier -message "
