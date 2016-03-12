set TERM='xterm-256color'

if [[ "`uname`" == 'Darwin' ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias ga='git add'
alias gc='git commit'
alias gca='git commit --all'
alias gp='git push'
alias gs='git status -s'
alias gl="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias grep='grep --color=auto'
alias v="$EDITOR"
alias mk='make'
alias xsel='xsel -b'
alias news='newsbeuter'

# pulseaudio-less steam!
alias steam1="LD_PRELOAD=/usr/lib32/libasound.so.2 STEAM_RUNTIME=1 SDL_AUDIODRIVER=alsa steam"
# fix for csgo (for some reason GLVND does something funky and breaks csgo)
alias steam2="__GLVND_DISALLOW_PATCHING=1 steam"

# stupid irssi
alias irssi='TERM=screen-256color irssi'

alias p='mpc toggle'
[ -z "`which nvim 2>/dev/null`" ] || alias vim='nvim'
