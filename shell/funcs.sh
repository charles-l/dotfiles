# Colorized man pages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

#FZF funcs

fe() {
        local file
        file=$(fzf --query="$1" --select-1 --exit-0)
        [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

fd() {
        local dir
        dir=$(find ${1:-.} -path '*/\.*' -prune \
                -o -type d -print 2> /dev/null | fzf +m) &&
                cd "$dir"
}

fkill() {
        ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

fco() {
        local commits commit
        commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
                commit=$(echo "$commits" | fzf +s +m -e) &&
                git checkout $(echo "$commit" | sed "s/ .*//")
}

# Light pastebin service
pb () {
    curl -F "c=@${1:--}" https://ptpb.pw
}
