pb () {
  curl -F "c=@${1:--}" https://ptpb.pw
}

sshhosts() {
  cat /Users/ninjacharlie/.ssh/known_hosts | sed 's/[, ].*//g'
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

function manf() {
  man -P "less -p \"^ +$2\"" $1
}

scratch() {
  new_dir="/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  cd $new_dir
  echo "New scratch dir ready"
}

cd() {
  if [[ $1 == 'b.'* ]]; then
    builtin cd `echo "$*" | sed -e "s/b//g" | sed -e "s|.|../|g"`
  else
    builtin cd "$*"
  fi
  echo -e "\033[1;30m`pwd`\033[0m"
}
