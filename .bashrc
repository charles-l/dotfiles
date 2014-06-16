export EDITOR=vim
# Pretty prompt
col=$RANDOM
let "col %= 255"
export PS1="[\\[$(tput setaf $col)\]\W\[$(tput sgr0)\]] "

## ALIASES 'N STUFF
alias ls='ls -G'
alias ll='ls -al'
alias sl='ls -G'

# Use a newer version of screen installed from brew repo so I have 256 colors
alias screen='screen-4.0.3'

alias love="/Applications/love.app/Contents/MacOS/love"

# Git aliases
alias g='git'
alias ga='git add'
alias gr='git remove'
alias gc='git commit'
alias gp='git push'
alias gh='git checkout'
alias go='git clone'
alias gs='git status -sb'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# OSX Specific
alias finder="open -a \"finder\""
alias syssleep="osascript -e 'tell app \"System Events\" to sleep'"
alias tn="terminal-notifier -message "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
