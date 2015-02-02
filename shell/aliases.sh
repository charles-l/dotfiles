set TERM='xterm-256color'
export EDITOR=vim
export GOPATH=~/Dev/go
export GOROOT=/usr/local/go
export PATH="$PATH:$HOME/.rvm/bin:$GOPATH/bin" # RVM and go bin

alias ls='ls -G'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --all'
alias gp='git push'
alias gs='git status -s'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias v='vim'
alias ma='make'
