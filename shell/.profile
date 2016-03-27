export LANG=en_US.UTF-8
GRAY="[34m"
NC="[00m"
export PS1="$GRAYλ $NC"
export EDITOR="vim"
export VISUAL="$EDITOR"
export PAGER="less"

# mail
export DEAD="/tmp/dead.letter"
export MAIL="$HOME/mail/inbox/"

export PATH=$PATH:$HOME/bin:$HOME/perl5/bin/
. $HOME/.dotfiles/shell/aliases.sh
. $HOME/.dotfiles/shell/funcs.sh
. $HOME/.dotfiles/shell/shmark/shmark.sh

# OPAM configuration
. /home/nc/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
