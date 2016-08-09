set TERM='xterm-256color'

if [[ "`uname`" == 'Darwin' || "`uname`" == *BSD ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ga='git add'
alias gc='git commit'
alias gp='git cherry --abbrev -v && git push'
alias gs='git status -s'
alias gfl='git log -u'
alias gdc='git diff --cached HEAD^'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# xclip
alias pbc='xclip -selection clip-board'
alias pbp='xclip -selection clip-board -o'

alias grep='grep --color=auto'
alias v="$EDITOR"
alias mk='make'
alias news='newsbeuter'
alias wget='wget -q --show-progress --progress=dot'

# pulseaudio-less steam!
alias steam1="LD_PRELOAD=/usr/lib/libasound.so.2 STEAM_RUNTIME=1 SDL_AUDIODRIVER=alsa steam"
# fix for csgo (for some reason GLVND does something funky and breaks csgo)
alias steam2="__GLVND_DISALLOW_PATCHING=1 steam"

# nmh
alias n="next -noheader"
alias p="prev -noheader"
alias l="scan -noheader"
alias s="show -noheader"
alias pullmail="fdm fetch && inc"
