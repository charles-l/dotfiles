#!/bin/sh
#TODO: perhaps grep info from git status, so it's faster
DIR="$1"
RED=$(echo '\033[0;31m')
GREEN=$(printf '\033[0;32m')
YELLOW=$(printf '\033[0;33m')
GRAY=$(printf '\033[1;30m')
CYAN=$(printf '\033[0;36m')
BLUE=$(printf '\033[0;34m')
BBLUE=$(printf '\033[0;44m')
NC=$(printf '\033[0;0m')
OUT=`ls -lah | awk -v gray="$GRAY" -v nc="$NC" '{print $1 " " $2 " " gray $3 nc " " $4 " " $5 " " $6 " " $7 " " $8 " " $9}' | column -t`

function highlight() {
    OUT=`printf "$OUT" | sed "s|^d\(.*\)\{1\}|${BLUE}d\1${NC}|"`
}

function inject_git() {
    git rev-parse --git-dir 1>/dev/null 2>/dev/null
    if [[ $? == 0 ]]; then
        DIRTY_FILES=`git diff-files --ignore-submodules --name-only 2>/dev/null`
        UNTRACKED_FILES=`git ls-files --exclude-standard --others 2>/dev/null`
        UNTRACKED_FILES="$UNTRACKED_FILES `git ls-files --ignored --exclude-standard --others 2>/dev/null`"
        COMMITTED_FILES=`git ls-files 2>/dev/null`
        STAGED_FILES=`git diff --name-only --cached 2>/dev/null`

        for f in $DIRTY_FILES; do
            OUT=`printf "$OUT" | sed "s| $f$|$YELLOW\|$NC $f|"`
        done

        for f in $UNTRACKED_FILES; do
            OUT=`printf "$OUT" | sed "s| $f$|$GRAY\|$NC $f|"`
        done

        for f in $STAGED_FILES; do
            OUT=`printf "$OUT" | sed "s| $f$|$GREEN\|$NC $f|"`
        done

        for f in $COMMITTED_FILES; do
            printf "$OUT" | grep "^.*|.* $f$" 1>/dev/null 2>/dev/null
            if [[ $? == 1 ]]; then
                OUT=`printf "$OUT" | sed "s| $f$|$BLUE\|$NC $f|"`
            fi
        done
    fi
}

function inject_file_weight() {
    OUT=`printf "$OUT" | sed -e "s|\([0-9]*\.*[0-9]*[0-9]M\)\{1\}|$YELLOW\1$NC|g"`
    OUT=`printf "$OUT" | sed -e "s|\([0-9]*\.*[0-9]*[0-9]G\)\{1\}|$RED\1$NC|g"`
}

highlight
inject_git
inject_file_weight

printf "$OUT\n"
