export ENV=~/.profile

alias ga='git add'
alias gc='git commit'
alias gp='git cherry --abbrev -v && git push'
alias gs='git status -s'
alias gfl='git log -u'
alias gdc='git diff --cached HEAD^'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias mk='make'
alias news='newsbeuter'

# xclip
alias pbc='xclip -selection clip-board'
alias pbp='xclip -selection clip-board -o'

###

pb () {
  curl -F "c=@${1:--}" https://ptpb.pw
}

man() {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

cd() {
  if [[ $1 == 'b.'* ]]; then
    builtin cd `echo "$*" | sed -e "s/b//g" | sed -e "s|.|../|g"`
  else
    builtin cd "$*"
  fi
  echo "`pwd`"
}

whoops() {
  c="$1 $(fc -l1 | cut -f2)"
  echo $c
  $c
}

GRAY="[34m"
NC="[00m"
export PS1="$GRAY$ $NC"

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
TERM='xterm-256color'

export PATH HOME TERM
