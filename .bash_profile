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
alias o="open -a"

alias love="/Applications/love.app/Contents/MacOS/love"
alias v="/usr/local/bin/vi"
alias gvim="open -a \"MacVim\""

function ql {
  qlmanage -p $1 >> /dev/null &
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/bin:$PATH
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
#MAGICAL AUTOJUMP :)


# added by duckpan installer
eval $(perl -I${HOME}/perl5/lib/perl5 -Mlocal::lib)


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/ninjacharlie/Dev/lua/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
