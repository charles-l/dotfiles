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

scratch() {
    new_dir="/tmp/scratch-`date +'%s'`"
    mkdir -p $new_dir
    cd $new_dir
    echo "New scratch dir ready"
}
