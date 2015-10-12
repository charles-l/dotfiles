set TERM='xterm-256color'
export MAIL=$HOME/var/mail/INBOX
export EDITOR=vim
export VISUAL=vim

if [ "`uname`" == 'Darwin' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=always'
fi

alias ga='git add'
alias gc='git commit'
alias gca='git commit --all'
alias gp='git push'
alias gs='git status -s'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias v='vim'
alias mk='make'
# stupid irssi
alias irssi='TERM=screen-256color irssi'
